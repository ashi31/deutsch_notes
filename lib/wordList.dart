import 'package:flutter/material.dart';

import 'categoryList.dart';
import 'word.dart';

List<Word> wordList = [
  Word(
      categories: [categoryList[0].categoryName],
      englishWord: 'Star',
      singular: {'der': 'Stern'},
      plural: {'die': 'Sterne'},
      image: Image.asset('images/sadness.jpg')),
];
