// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:shrine/model/product.dart';
import 'package:shrine/model/products_repository.dart';

import 'supplemental/asymmetric_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  // TODO: Make a collection of cards (102)
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());
    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      product.name,
                      style: theme.textTheme.labelLarge,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 18.0,
                    ),
                    Text(
                      formatter.format(
                        product.price,
                      ),
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    return AsymmetricView(
      products: ProductsRepository.loadProducts(category),
    );
    // TODO: Pass Category variable to AsymmetricView (104)
    // return Scaffold(
    //   // TODO: Add app bar (102)
    //   appBar: AppBar(
    //     title: const Text(
    //       'SHRINE',
    //     ),
    //     leading: IconButton(
    //       icon: const Icon(Icons.menu),
    //       onPressed: () {},
    //     ),
    //     actions: [
    //       IconButton(
    //         onPressed: () {},
    //         icon: const Icon(
    //           Icons.search,
    //           semanticLabel: 'search',
    //         ),
    //       ),
    //       IconButton(
    //         onPressed: () {},
    //         icon: const Icon(
    //           Icons.tune,
    //           semanticLabel: 'filter',
    //         ),
    //       )
    //     ],
    //   ),
    //   // TODO: Add a grid view (102)
    //   body: AsymmetricView(
    //     products: ProductsRepository.loadProducts(Category.all),
    //   ),

    //   // body: GridView.count(
    //   //   crossAxisCount: 2,
    //   //   padding: const EdgeInsets.all(16.0),
    //   //   childAspectRatio: 8.0 / 9.0,
    //   //   children: _buildGridCards(context),
    //   // ),
    //   // TODO: Set resizeToAvoidBottomInset (101)
    //   resizeToAvoidBottomInset: false,
    // );
  }
}
