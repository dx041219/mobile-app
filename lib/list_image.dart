import 'dart:io';
import 'package:flutter/material.dart';

class ImageListPage extends StatelessWidget {
  final List<File> images; 

  const ImageListPage({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Uploaded Images',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://t4.ftcdn.net/jpg/05/80/39/35/360_F_580393578_FMzdGc6Azxjc0MUhTYdxMUOwD6oihmrY.jpg',
            fit: BoxFit.cover,
          ),
          images.isEmpty
              ? const Center(
                  child: Text(
                    'No images uploaded yet.',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, 
                    crossAxisSpacing: 6.0, 
                    mainAxisSpacing: 6.0, 
                  ),
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _showFullScreenImage(context, images[index]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: FileImage(images[index]),
                            fit: BoxFit.cover, 
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }

  void _showFullScreenImage(BuildContext context, File imageFile) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.black,
          child: InteractiveViewer(
            child: Image.file(
              imageFile,
              fit: BoxFit.contain, 
            ),
          ),
        );
      },
    );
  }
}
