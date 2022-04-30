import 'package:graduation_project/models/test_model.dart';

List<TestModel> questions = [
  TestModel(
    "What number do you see ?",
    'assets/test_images/Ishihara-Plate-01-38.jpg',
    {
      '12': true,
      '10': false,
      '18': false,
    },
    "Everyone should see number 12",
  ),
  TestModel(
    "What number do you see ?",
    'assets/test_images/Ishihara-Plate-02-38.jpg',
    {
      '3': false,
      '8': true,
      '9': false,
    },
    "3",
  ),
  TestModel(
    "What number do you see ?",
    'assets/test_images/Ishihara-Plate-03-38.jpg',
    {
      '8': false,
      '5': false,
      '6': true,
    },
    "5",
  ),
  TestModel(
    "What number do you see ?",
    'assets/test_images/Ishihara-Plate-04-38.jpg',
    {
      '60': false,
      '70': false,
      '29': true,
    },
    "70",
  ),
  TestModel(
    "What number do you see ?",
    'assets/test_images/Ishihara-Plate-05-38.jpg',
    {
      '57': true,
      '35': false,
      '25': false,
    },
    "35",
  ),
  TestModel(
    "What number do you see ?",
    'assets/test_images/Ishihara-Plate-06-38.jpg',
    {
      '3': false,
      '2': false,
      '5': true,
    },
    "2",
  ),
  TestModel(
    "What number do you see ?",
    'assets/test_images/Ishihara-Plate-07-38.jpg',
    {
      '5': false,
      '3': true,
      '8': false,
    },
    "5",
  ),
  TestModel(
    "What number do you see ?",
    'assets/test_images/Ishihara-Plate-08-38.jpg',
    {
      '17': false,
      '15': true,
      '12': false,
    },
    "17",
  ),
  TestModel(
    "What number do you see ?",
    'assets/test_images/Ishihara-Plate-09-38.jpg',
    {
      '21': false,
      '74': true,
      '45': false,
    },
    "21",
  ),
  TestModel(
    "What number do you see ?",
    'assets/test_images/Ishihara-Plate-10-38.jpg',
    {
      'Don\'t see anything': false,
      '2': true,
      'Unknown object': false,
    },
    "Most people don't see anything or see something wrong. ",
  ),
  TestModel(
    "What number do you see ?",
    'assets/test_images/Ishihara-Plate-11-38.jpg',
    {
      'Don\'t see anything': false,
      '9': false,
      '6': true,
    },
    "Most people don't see anything or see something wrong. ",
  ),
  TestModel(
      "What number do you see ?",
      'assets/test_images/Ishihara-Plate-12-38.jpg',
      {
        '97': true,
        '56': false,
        'Don\'t see anything': false,
      },
      "Most people don't see anything or see something wrong."),
  TestModel(
    "What number do you see ?",
    'assets/test_images/Ishihara-Plate-13-38.jpg',
    {
      '45': true,
      '65': false,
      'Unknown object': false,
    },
    "Most people don't see anything or see something wrong. ",
  ),
  TestModel(
    "What number do you see ?",
    'assets/test_images/Ishihara-Plate-14-38.jpg',
    {
      '7': false,
      '5': true,
      'Don\'t see anything': false,
    },
    "Most people don't see anything or see something wrong. ",
  ),
  TestModel(
    "What number do you see ?",
    'assets/test_images/Ishihara-Plate-15-38.jpg',
    {
      '12': false,
      'Don\'t see anything': false,
      '7': true,
    },
    "Most people don't see anything or see something wrong. ",
  ),
  TestModel(
    "What number do you see ?",
    'assets/test_images/Ishihara-Plate-16-38.jpg',
    {
      '14': false,
      '16': true,
      'Don\'t see anything': false,
    },
    "Most people don't see anything or see something wrong. ",
  ),
  TestModel(
    "What number do you see ?",
    'assets/test_images/Ishihara-Plate-17-38.jpg',
    {
      'Don\'t see anything': false,
      '78': false,
      '73': true,
    },
    "Most people don't see anything or see something wrong. ",
  ),
  TestModel(
    "What do you see on the plate ?",
    'assets/test_images/Ishihara-Plate-18-38.jpg',
    {
      '5': false,
      'Nothing': true,
      '8': false,
    },
    "5",
  ),
  TestModel(
    "What do you see on the plate ?",
    'assets/test_images/Ishihara-Plate-19-38.jpg',
    {
      'Nothing': true,
      '2': false,
      '3': false,
    },
    "2",
  ),
  TestModel(
    "What do you see on the plate ?",
    'assets/test_images/Ishihara-Plate-20-38.jpg',
    {
      'Nothing': true,
      '45': false,
      '34': false,
    },
    "45",
  ),
  TestModel(
    "What do you see on the plate ?",
    'assets/test_images/Ishihara-Plate-21-38.jpg',
    {
      'Nothing': true,
      '73': false,
      '23': false,
    },
    "73",
  ),
  TestModel(
    "What number do you see ?",
    'assets/test_images/Ishihara-Plate-22-38.jpg',
    {
      '6': false,
      '2': false,
      '26': true,
    },
    "6 or 2",
  ),
  TestModel(
    "What number do you see ?",
    'assets/test_images/Ishihara-Plate-23-38.jpg',
    {
      '2': false,
      '42': true,
      '4': false,
    },
    "4 or 2",
  ),
  TestModel(
    "What number do you see ?",
    'assets/test_images/Ishihara-Plate-24-38.jpg',
    {
      '35': true,
      '5': false,
      '3': false,
    },
    "5 or 3",
  ),
  TestModel(
    "What number do you see ?",
    'assets/test_images/Ishihara-Plate-25-38.jpg',
    {
      '6': false,
      '96': true,
      '9': false,
    },
    "6 or 9",
  ),
  TestModel(
    "What do you see on the plate ?",
    'assets/test_images/Ishihara-Plate-26-38.jpg',
    {
      'Purple and red spots': true,
      'Only red line': false,
      'Only purple line': false,
    },
    "Only red line or only purple line",
  ),
  TestModel(
    "What do you see on the plate ?",
    'assets/test_images/Ishihara-Plate-27-38.jpg',
    {
      'Purple and red spots': true,
      'Only red line': false,
      'Only purple line': false,
    },
    "Only red line or only purple line",
  ),
  TestModel(
    "What do you see on the plate ?",
    'assets/test_images/Ishihara-Plate-28-38.jpg',
    {
      'A line': false,
      'Two lines': false,
      'Nothing': true,
    },
    "A line",
  ),
  TestModel(
    "What do you see on the plate ?",
    'assets/test_images/Ishihara-Plate-29-38.jpg',
    {
      'Nothing': true,
      'A line': false,
      'Two lines': false,
    },
    "A line",
  ),
  TestModel(
    "What do you see on the plate ?",
    'assets/test_images/Ishihara-Plate-30-38.jpg',
    {
      'Nothing': false,
      'Blue-green line': true,
      'Blue line': false,
    },
    "Nothing",
  ),
  TestModel(
    "What do you see on the plate ?",
    'assets/test_images/Ishihara-Plate-31-38.jpg',
    {
      'Blue-green line': true,
      'Nothing': false,
      'Red line': false,
    },
    "Nothing",
  ),
  TestModel(
    "What do you see on the plate ?",
    'assets/test_images/Ishihara-Plate-32-38.jpg',
    {
      'Nothing': false,
      'A false line': false,
      'Orange line': true,
    },
    "Nothing  or a false line ",
  ),
  TestModel(
    "What do you see on the plate ?",
    'assets/test_images/Ishihara-Plate-33-38.jpg',
    {
      'Orange line': true,
      'Nothing': false,
      'A false line': false,
    },
    "Nothing  or a false line ",
  ),
  TestModel(
    "What do you see on the plate ?",
    'assets/test_images/Ishihara-Plate-34-38.jpg',
    {
      'Blue-green and yellow-green line': true,
      'Only red-green and violet line': false,
      'Nothing': false,
    },
    "Only red-green and violet line",
  ),
  TestModel(
    "What do you see on the plate ?",
    'assets/test_images/Ishihara-Plate-35-38.jpg',
    {
      'Only blue-green and violet line': false,
      'Blue-green and yellow-green line': true,
      'Nothing': false,
    },
    "Only blue-green and violet line",
  ),
  TestModel(
    "What do you see on the plate ?",
    'assets/test_images/Ishihara-Plate-36-38.jpg',
    {
      'Blue-green and violet line': false,
      'Nothing': false,
      'Violet and orange line': true,
    },
    "Blue-green and violet line",
  ),
  TestModel(
    "What do you see on the plate ?",
    'assets/test_images/Ishihara-Plate-37-38.jpg',
    {
      'Violet and orange line': true,
      'Blue-green and violet line': false,
      'Nothing': false,
    },
    "Blue-green and violet line",
  ),
  TestModel(
    "What do you see on the plate ?",
    'assets/test_images/Ishihara-Plate-38-38.jpg',
    {
      'Single line': true,
      'Two lines': false,
      'Nothing': false,
    },
    "Everyone should see the same line",
  ),
];
