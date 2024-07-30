import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> uploadImage(File imageFile, String url) async {
  const token = 'token11'; // Replace with your actual token

  try {
    // Create a multipart request
    final request = http.MultipartRequest('POST', Uri.parse('https://610b-60-52-198-189.ngrok-free.app/image'))
      ..headers['Authorization'] = 'Bearer $token'
      ..files.add(await http.MultipartFile.fromPath('image', imageFile.path));

    // Send the request and get the response
    final response = await request.send();

    // Handle the response
    if (response.statusCode == 200) {
      print('Image uploaded successfully');
    } else {
      print('Image upload failed with status code: ${response.statusCode}');
      // Optionally, read the response body
      final responseBody = await response.stream.bytesToString();
      print('Response body: $responseBody');
    }
  } catch (e) {
    print('An error occurred while uploading the image: $e');
  }
}
