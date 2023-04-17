library image_zoomer;

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A Calculator.
class ImageZoomer extends StatelessWidget {
  final String image;
  final ImageType imageType;
  final EdgeInsetsGeometry? padding;
  final Color? dialogBgColor;
  final double? dialogElevation;
  final EdgeInsets? boundaryMargin;
  final double? minScale;
  final double? maxScale;
  final Widget? crossWidget;
  final Alignment? alignment;
  final bool? isPanEnabled;
  final void Function(ScaleEndDetails)? onInteractionEnd;
  final void Function(ScaleStartDetails)? onInteractionStart;
  final void Function(ScaleUpdateDetails)? onInteractionUpdate;
  final PanAxis? panAxis;
  final double? interactionEndFrictionCoefficient;
  final double? scaleFactor;
  final ShapeBorder? dialogShape;
  final EdgeInsets? insetPadding;
  const ImageZoomer(
      {super.key,
      required this.image,
      required this.imageType,
      this.padding,
      this.dialogBgColor,
      this.dialogElevation,
      this.boundaryMargin,
      this.minScale,
      this.maxScale,
      this.crossWidget,
      this.alignment,
      this.isPanEnabled,
      this.onInteractionEnd,
      this.onInteractionStart,
      this.onInteractionUpdate,
      this.panAxis,
      this.interactionEndFrictionCoefficient,
      this.scaleFactor,
      this.dialogShape,
      this.insetPadding});

  Image fetchImage(ImageType imageType) {
    if (imageType == ImageType.asset) {
      return Image.asset(image);
    } else if (imageType == ImageType.network) {
      return Image.network(image);
    } else if (imageType == ImageType.file) {
      return Image.file(File(image));
    } else {
      return Image.memory(Uint8List.fromList(image.codeUnits));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: dialogBgColor,
        elevation: dialogElevation,
        shape: dialogShape,
        insetPadding: insetPadding ?? const EdgeInsets.all(10),
        child: Stack(
          children: [
            Padding(
              padding: padding ??
                  const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 24),
              child: InteractiveViewer(
                panEnabled: isPanEnabled ?? true,
                alignment: alignment,
                onInteractionEnd: onInteractionEnd,
                onInteractionStart: onInteractionStart,
                onInteractionUpdate: onInteractionUpdate,
                panAxis: panAxis ?? PanAxis.free,
                interactionEndFrictionCoefficient:
                    interactionEndFrictionCoefficient ?? 0.0000135,
                scaleFactor: scaleFactor ?? 200,
                boundaryMargin: boundaryMargin ?? EdgeInsets.zero,
                minScale: minScale ?? 1,
                maxScale: maxScale ?? 3,
                child: fetchImage(imageType),
              ),
            ),
            crossWidget ??
                Positioned(
                    top: 4,
                    right: 4,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(CupertinoIcons.clear_circled,
                          size: 30, color: Colors.red),
                    ))
          ],
        ));
  }
}

enum ImageType { file, memory, network, asset }
