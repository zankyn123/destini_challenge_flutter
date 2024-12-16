import 'dart:core';
import 'package:flutter/foundation.dart';

import 'Story.dart';

enum ChoiceIndex { first, second }

class StoryBrain {
  final List<Story> _storyData = [
    // 1
    Story(
        storyTitle:
            'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
        choice1: 'I\'ll hop in. Thanks for the help!',
        choice2: 'Better ask him if he\'s a murderer first.'),
    // 2
    Story(
        storyTitle: 'He nods slowly, unphased by the question.',
        choice1: 'At least he\'s honest. I\'ll climb in.',
        choice2: 'Wait, I know how to change a tire.'),
    // 3
    Story(
        storyTitle:
            'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        choice1: 'I love Elton John! Hand him the cassette tape.',
        choice2: 'It\'s him or me! You take the knife and stab him.'),
    // 4
    Story(
        storyTitle:
            'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        choice1: 'Restart',
        choice2: ''),
    // 5
    Story(
        storyTitle:
            'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        choice1: 'Restart',
        choice2: ''),
    // 6
    Story(
        storyTitle:
            'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        choice1: 'Restart',
        choice2: '')
  ];

  int _currentStory = 0;

  void _resetStory() {
    _currentStory = 0;
  }

  String getCurrentStoryTitle() {
    return _storyData[_currentStory].storyTitle;
  }

  String getCurrentChoice1() {
    return _storyData[_currentStory].choice1;
  }

  String getCurrentChoice2() {
    return _storyData[_currentStory].choice2;
  }

  void makeChoice(ChoiceIndex choiceIndex) {
    if (kDebugMode) {
      print(
        'Story ${_currentStory} - Select choice ${_getIndexByChoiceIndex(choiceIndex)}',
      );
    }
    if (_currentStory == 0) {
      _currentStory = choiceIndex == ChoiceIndex.first ? 2 : 1;
    } else if (_currentStory == 1) {
      _currentStory = choiceIndex == ChoiceIndex.first ? 2 : 3;
    } else if (_currentStory == 2) {
      _currentStory = choiceIndex == ChoiceIndex.first ? 5 : 4;
    } else {
      _resetStory();
    }
    if (kDebugMode) {
      print('Current story $_currentStory');
    }
  }

  bool isRemainStory() {
    return !([3, 4, 5].toList().contains(_currentStory));
  }

  int _getIndexByChoiceIndex(ChoiceIndex choiceIndex) {
    switch (choiceIndex) {
      case ChoiceIndex.first:
        return 1;
      case ChoiceIndex.second:
        return 2;
    }
  }
}
