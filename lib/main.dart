import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DestiniPage(),
    );
  }
}

class DestiniPage extends StatefulWidget {
  const DestiniPage({super.key});

  @override
  State<DestiniPage> createState() => _DestiniPageState();
}

class _DestiniPageState extends State<DestiniPage> {
  StoryBrain storyBrain = StoryBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('images/background.png'),
        )),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    storyBrain.getCurrentStoryTitle(),
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      storyBrain.makeChoice(ChoiceIndex.first);
                    });
                  },
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(const EdgeInsets.all(16)),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    backgroundColor: WidgetStateProperty.all(Colors.red),
                  ),
                  child: Text(
                    storyBrain.getCurrentChoice1(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              if (storyBrain.isRemainStory())
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        storyBrain.makeChoice(ChoiceIndex.second);
                      });
                    },
                    style: ButtonStyle(
                      padding:
                          WidgetStateProperty.all(const EdgeInsets.all(16)),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      backgroundColor: WidgetStateProperty.all(Colors.green),
                    ),
                    child: Text(
                      storyBrain.getCurrentChoice2(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                )
            ],
          ),
        )),
      ),
    );
  }
}
