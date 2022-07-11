# Slider View

[![pub package](https://img.shields.io/pub/v/slider_view?label=stable)][pub package]
[![GitHub](https://img.shields.io/github/license/fluttercandies/flutter_slider_view)][repo]
[![GitHub stars](https://img.shields.io/github/stars/fluttercandies/flutter_slider_view?style=social&label=Stars)][repo]
<a target="_blank" href="https://jq.qq.com/?_wv=1027&k=5bcc0gy"><img border="0" src="https://pub.idqqimg.com/wpa/images/group.png" alt="FlutterCandies" title="FlutterCandies"></a>

A slider view widget that supports custom type models and various configs.

## Features ✨

- ⚡️ Support infinity scrolling
- 🎛 Control layout size from either **Aspect Ratio** or **Width * Height**
- 🖲 Displays indicators
- 💻 Desktop support

## Preparing for use 🍭

```shell
flutter pub add slider_view
```

## Usage 📖

```dart
Widget _buildSliderView(BuildContext context) {
  return SliderView(
    config: SliderViewConfig<String>(
      aspectRatio: 16 / 9,
      models: models,
      itemBuilder: (String model) => Center(
        child: Text(
          model,
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    ),
  );
}
```

See `SliderViewConfig` for more details.

## Contributors ✨

Many thanks to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):
<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://blog.alexv525.com"><img src="https://avatars1.githubusercontent.com/u/15884415?v=4?s=50" width="50px;" alt=""/><br /><sub><b>Alex Li</b></sub></a><br /><a href="https://github.com/fluttercandies/flutter_wechat_assets_picker/commits?author=AlexV525" title="Code">💻</a> <a href="#design-AlexV525" title="Design">🎨</a> <a href="https://github.com/fluttercandies/flutter_wechat_assets_picker/commits?author=AlexV525" title="Documentation">📖</a> <a href="#example-AlexV525" title="Examples">💡</a> <a href="#ideas-AlexV525" title="Ideas, Planning, & Feedback">🤔</a> <a href="#maintenance-AlexV525" title="Maintenance">🚧</a> <a href="#question-AlexV525" title="Answering Questions">💬</a> <a href="https://github.com/fluttercandies/flutter_wechat_assets_picker/pulls?q=is%3Apr+reviewed-by%3AAlexV525" title="Reviewed Pull Requests">👀</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->
This project follows the
[all-contributors](https://github.com/all-contributors/all-contributors) specification.
Contributions of any kind welcomed!!

[pub package]: https://pub.dev/packages/slider_view
[repo]: https://github.com/fluttercandies/flutter_slider_view
