# Stacked Animated List View flutter

![pub.dev](https://img.shields.io/badge/pub.dev-1.0.0-green)

<div align="left">
<img src="https://raw.githubusercontent.com/abdulrehmank7/stacked-animated-list/master/animated_list_preview%20copy.png" width="30%" alt="" >
</div>

## Features

Create visually stunning animated stacked lists. Transform your static lists into engaging, swipable card views.

<div align="left">
<img src="https://raw.githubusercontent.com/abdulrehmank7/stacked-animated-list/master/screen-20240707-171341.gif" width="30%" >
</div>

## Getting started

add dependency to your `pubspec.yaml` file

```yaml

dependencies:
  stacked_animated_list: ^1.0.0

```
import package in your dart file

```dart

import 'package:stacked_animated_list/ui/stacked_list_widget.dart';

```
## Usage

Add `StackedListWidget` to your widget and pass the list of widget that you want to display. 

```dart

import 'package:stacked_animated_list/ui/stacked_list_widget.dart';

const images = [
  Assets.imagesOnepeice,
  Assets.imagesNarutoi,
  Assets.imagesStone,
  Assets.imagesWindbreaker,
];

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const cardWidth = 220.0;

    final listItems = images.mapIndexed((index, image) {
      return SizedBox(
        width: cardWidth,
        child: AspectRatio(
          aspectRatio: .66,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      );
    }).toList();
    
    return Scaffold(
      body: StackedListWidget(
        listItems: listItems,
        listItemWidth: cardWidth,
      ),
    );
  }
}


```


## Additional configuration available
```dart

    StackedListWidget(
        listItems: listItems,
        listItemWidth: cardWidth,
        animationDuration: const Duration(milliseconds: 350),
        borderRadius: BorderRadius.circular(16),
        rotationAngle: 10,
        additionalTranslateOffsetBeyondScreen: 50,
        focusedItemShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.26),
            blurRadius: 28,
            spreadRadius: 8,
            offset: const Offset(8, 16),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.26),
            blurRadius: 28,
            spreadRadius: 8,
            offset: const Offset(-8, 2),
          ),
        ],
      )

```
| Parameter                               | Description                                                                                         |
|-----------------------------------------|-----------------------------------------------------------------------------------------------------|
| `animationDuration`            | The animation duration of card movement.                                                            |
| `borderRadius`    | Border radius of the card in the stacked list.                                                      |
| `rotationAngle`                  | Rotation angle at which the card should be rotated. Higher the angle, higher the card rotation.     |
| `additionalTranslateOffsetBeyondScreen` | Additional horizontal offset of unfocused card. This will move the unfocused card outside of screen as per the provided value. |
| `focusedItemShadow`    | Focused card shadow customization parameter.                                                        |

