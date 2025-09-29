import 'dart:io';

import 'package:flutter/material.dart';
import 'package:online_image_classification/controller/home_provider.dart';
import 'package:online_image_classification/util/widgets_extension.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Image Classification",
          style: TextStyle(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const _HomeBody(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 4,
          children: [
            Expanded(
              child: Consumer<HomeProvider>(
                builder: (context, value, child) {
                  final imagePath = value.imagePath;
                  return imagePath == null
                      ? const Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.image,
                            size: 100,
                          ),
                        )
                      : Image.file(
                          File(imagePath.toString()),
                          fit: BoxFit.contain,
                        );
                },
              ),
            ),
            Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(16),
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          elevation: 0),
                      onPressed: () =>
                          context.read<HomeProvider>().openGallery(),
                      child: Text(
                        "Gallery",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(16),
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          elevation: 0),
                      onPressed: () =>
                          context.read<HomeProvider>().openCamera(),
                      child: Text(
                        "Camera",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(16),
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          elevation: 0),
                      onPressed: () => context
                          .read<HomeProvider>()
                          .openCustomCamera(context),
                      child: Text(
                        "Custom",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.onSurface),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ].expanded(),
                ),
                FilledButton.tonal(
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(16),
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    elevation: 0,
                  ),
                  onPressed: () {
                    final scaffoldMessenger = ScaffoldMessenger.of(context);
                    scaffoldMessenger.showSnackBar(
                      SnackBar(content: Text("Feature under development")),
                    );
                  },
                  child: Text("Analyze Gambar",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.onSurface)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
