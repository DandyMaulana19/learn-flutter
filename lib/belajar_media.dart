import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class BelajarMedia extends StatefulWidget {
  const BelajarMedia({super.key});

  @override
  State<BelajarMedia> createState() => _BelajarMediaState();
}

class _BelajarMediaState extends State<BelajarMedia> {
  File? image;
  File? video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Media")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/cobaAssets.png",
              width: 100,
            ),
            Image.network(
                "https://blog.mindorks.com/images/understanding-multidex-banner-img.png"),
            ElevatedButton(
                onPressed: () {
                  PickImage();
                },
                child: Text("Pick Image From Gallery")),
            ElevatedButton(
                onPressed: () {
                  TakePicture();
                },
                child: Text("Pick Image From Camera")),
            ElevatedButton(
                onPressed: () {
                  PickVideo();
                },
                child: Text("Pick Video From Gallery")),
            ElevatedButton(
                onPressed: () {
                  TakeVideo();
                },
                child: Text("Pick Video From Camera")),
            if (image != null) Image.file(image!),
            if (video != null)
              AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: VideoPlayer(_controller!),
              )
          ],
        ),
      ),
    );
  }

  Future PickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() {
      this.image = imageTemporary;
    });
  }

  Future TakePicture() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() {
      this.image = imageTemporary;
    });
  }

  VideoPlayerController? _controller;

  Future PickVideo() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (video == null) return;

    final videoTemporary = File(video.path);
    _controller = VideoPlayerController.file(videoTemporary)
      ..initialize().then((_) {
        setState(() {
          this.video = videoTemporary;
          _controller!.play();
          _controller!.setLooping(true);
        });
      });
  }

  Future TakeVideo() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.camera);

    if (video == null) return;

    final videoTemporary = File(video.path);
    _controller = VideoPlayerController.file(videoTemporary)
      ..initialize().then((_) {
        setState(() {
          this.video = videoTemporary;
          _controller!.play();
          _controller!.setLooping(true);
        });
      });
  }
}
