import 'package:flutter/material.dart';

void main() {
  runApp(const ProductApp());
}

class ProductApp extends StatelessWidget {
  const ProductApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Карточка товара',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2EC4B6)),
      ),
      home: const ProductScreen(),
    );
  }
}

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF0F3),
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: const ProductCard(
          title: 'Обнимашки от котика',
          imageAsset: 'assets/images/1.png',
          description:
              'Профессиональный котик предоставляет тёплые обнимашки '
              'премиум-класса. В комплекте: мурчание 24/7, мягкие лапки и взгляд, '
              'которому невозможно отказать. Возможна оплата вкусняшками.',
          price: '0 ₽',
          oldPrice: '999 ₽',
          rating: '★ 5,0',
          reviews: '777 отзывов',
          isNew: true,
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.title,
    required this.imageAsset,
    required this.description,
    required this.price,
    required this.oldPrice,
    required this.rating,
    required this.reviews,
    this.isNew = false,
  });

  final String title;
  final String imageAsset;
  final String description;
  final String price;
  final String oldPrice;
  final String rating;
  final String reviews;
  final bool isNew;

  static const Color _accent = Color(0xFF2EC4B6);
  static const Color _star = Color(0xFFF5A623);
  static const Color _muted = Color(0xFF7A7E89);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      constraints: const BoxConstraints(maxWidth: 360),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE7E8EC)),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1B2E).withValues(alpha: 0.10),
            blurRadius: 30,
            spreadRadius: -8,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 18,
        children: [
          Container(
            height: 280,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(imageAsset, fit: BoxFit.cover),
                ),
                if (isNew)
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: _accent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Новинка',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 6,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                  height: 1.2,
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: rating,
                      style: const TextStyle(
                        color: _star,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: ' ($reviews)',
                      style: const TextStyle(
                        color: _muted,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
                style: textTheme.titleSmall,
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(
                color: _muted,
                height: 1.45,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Text(
                price,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: _accent,
                ),
              ),
              Text(
                oldPrice,
                style: textTheme.titleMedium?.copyWith(
                  color: const Color(0xFF9AA0AB),
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: const Color(0xFF9AA0AB),
                ),
              ),
            ],
          ),
          FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              backgroundColor: _accent,
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: const Text(
              'ОБНЯТЬ',
              style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 1),
            ),
          ),
        ],
      ),
    );
  }
}
