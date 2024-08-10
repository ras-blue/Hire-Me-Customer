import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hire_me_customer/provider/favorite_provider.dart';

class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({super.key});

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends ConsumerState<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final _favoriteProvider = ref.read(favoriteProvider.notifier);
    final _wishItem = ref.watch(favoriteProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Wishlist',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 4,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                _favoriteProvider.removeAllItems();
              },
              icon: Icon(
                CupertinoIcons.delete,
              ),
            ),
          ],
        ),
        body: _wishItem.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: _wishItem.length,
                itemBuilder: (context, index) {
                  final wishData = _wishItem.values.toList()[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: SizedBox(
                        height: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.network(
                                wishData.imageUrl[0],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    wishData.productName,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "\$" + wishData.price.toStringAsFixed(2),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _favoriteProvider
                                          .removeItem(wishData.productId);
                                    },
                                    icon: Icon(
                                      Icons.cancel,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'your wishlist is empty',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5,
                      ),
                    ),
                    Text(
                      'you havent added any items\n you can add from the home screen',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ));
  }
}
