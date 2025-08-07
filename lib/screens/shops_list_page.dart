import 'package:flutter/material.dart';
import '../data/mock_shops.dart';
import '../models/shop_model.dart';
import '../widgets/shop_grid_item.dart';

class ShopsListPage extends StatefulWidget {
  const ShopsListPage({super.key});

  @override
  State<ShopsListPage> createState() => _ShopsListPageState();
}

class _ShopsListPageState extends State<ShopsListPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Shop> _filteredShops = [];
  List<Shop> _allShops = [];

  @override
  void initState() {
    super.initState();
    _allShops = MockShops.getAllShops();
    _filteredShops = _allShops;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _filteredShops = MockShops.searchShops(_searchController.text);
    });
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      _filteredShops = _allShops;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Coffee Shop Finder',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              _showInfoDialog(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Section
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Find Your Perfect Coffee Shop',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search coffee shops...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: _clearSearch,
                          )
                        : null,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${_filteredShops.length} coffee shops found',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white60,
                  ),
                ),
              ],
            ),
          ),
          // Grid Section
          Expanded(
            child: _filteredShops.isEmpty
                ? _buildEmptyState()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: _filteredShops.length,
                      itemBuilder: (context, index) {
                        return ShopGridItem(shop: _filteredShops[index]);
                      },
                    ),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollToTop();
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.keyboard_arrow_up),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: Colors.white60,
            ),
            const SizedBox(height: 16),
            Text(
              'No coffee shops found',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.white60,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Try adjusting your search terms',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white60,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _clearSearch,
              child: const Text('Clear Search'),
            ),
          ],
        ),
      ),
    );
  }

  void _scrollToTop() {
    // In a real app, you'd use a ScrollController
    // For now, we'll just clear the search to show all items
    _clearSearch();
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).cardTheme.color,
          title: Text(
            'About Coffee Shop Finder',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          content: Text(
            'Discover amazing coffee shops in your area. '
            'Browse through our curated list, read reviews, '
            'and find the perfect spot for your next coffee break.\n\n'
            'Features:\n'
            '• Search by name or features\n'
            '• Detailed shop information\n'
            '• Interactive maps\n'
            '• Ratings and reviews',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Close',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}