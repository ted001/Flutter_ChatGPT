import 'package:chatgpt/data/database.dart';
import 'package:chatgpt/services/chatgpt.dart';
import 'package:chatgpt/services/record.dart';
import 'package:floor/floor.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:uuid/uuid.dart';

final chatgpt = ChatGPTService();

final logger = Logger(level: kDebugMode ? Level.verbose : Level.info);

const uuid = Uuid();

late AppDatabase db;

setupDatabse() async {
  db = await initDatabase();
}

final recorder = RecordService();

late TextToSpeech tts;

initTTS() {
  tts = TextToSpeech();
  tts.setRate(1.0);
  tts.setPitch(1.0);
  tts.setLanguage('en-US');
}
