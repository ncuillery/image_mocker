import 'package:flutter/foundation.dart';

class PlaceholderService {
  final String name;
  final String description;
  final String url;
  final String pictureUrl;
  final List<String> tags;

  const PlaceholderService({
    @required this.name,
    @required this.description,
    @required this.url,
    @required this.pictureUrl,
    @required this.tags,
  })  : assert(name != null),
        assert(description != null),
        assert(url != null),
        assert(pictureUrl != null),
        assert(tags != null);
}

const placeholderServices = [
  PlaceholderService(
    name: 'Place Kitten',
    description:
        'Use the Internet first-class citizens as placeholders for your Website.',
    url: 'https://placekitten.com',
    pictureUrl: 'https://placekitten.com/1024/768',
    tags: ['Fun', 'Grayscale'],
  ),
  PlaceholderService(
    name: 'Fill Murray',
    description:
        'Iconic pictures of Bill Murray. Also by the same author: PlaceCage and Steven SeGallery.',
    url: 'http://www.fillmurray.com',
    pictureUrl: 'http://www.fillmurray.com/1200/900',
    tags: ['Fun', 'Grayscale', 'Open-source'],
  ),
  PlaceholderService(
    name: 'PlaceIMG',
    description:
        'Returns stock photos for a given theme, like "Architecture", "Tech" or "People". Also support sepia filter.',
    url: 'http://placeimg.com',
    pictureUrl: 'http://placeimg.com/1200/900/arch',
    tags: ['Stock photo', 'Grayscale', 'Sepia', 'Themes'],
  ),
  PlaceholderService(
    name: 'Bacon Mockup',
    description:
        'Bacon images, but not only. Also on display: briskets, pulled pork, drumsticks, ribs, etc.',
    url: 'https://baconmockup.com',
    pictureUrl: 'https://baconmockup.com/1200/900',
    tags: ['Fun'],
  ),
  PlaceholderService(
    name: 'Placemat',
    description:
        'Stock images categorized in 3 themes: "People", "Places" and "Things. Various options of customization: text, overlay, random seed.',
    url: 'https://placem.at',
    pictureUrl: 'https://placem.at/things?w=1200&h=900',
    tags: ['Stock photo', 'Text', 'Themes', 'Overlay'],
  ),
  PlaceholderService(
    name: 'Dynamic Dummy Image Generator',
    description:
        'More developer-oriented, this service returns plain mono-color images. Lots of handy options including shortcuts for different screen or ads resolutions.',
    url: 'https://dummyimage.com',
    pictureUrl: 'https://dummyimage.com/1200x900/bada55/ffffff',
    tags: ['Technical', 'Text', 'Formats'],
  ),
  PlaceholderService(
    name: 'lorempixel',
    description:
        'Another stock photo placeholder service. Note the "Abstract" category because sometimes you just want your image to represent nothing.',
    url: 'http://lorempixel.com',
    pictureUrl: 'http://lorempixel.com/1200/900/sports',
    tags: ['Stock photo', 'Text', 'Grayscale', 'Themes'],
  ),
];
