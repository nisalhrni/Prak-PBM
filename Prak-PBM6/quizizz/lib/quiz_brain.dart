import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(questionText: 'Foundation digunakan untuk menyamarkan ketidaksempurnaan kulit dan menciptakan dasar riasan yang merata', questionAnswer: true),
    Question(questionText: 'Mascara adalah produk yang digunakan untuk menggambar alis', questionAnswer: false),
    Question(questionText: 'Eyeliner digunakan untuk memberikan warna pada kelopak mata', questionAnswer: false),
    Question(questionText: 'Contouring adalah teknik makeup yang digunakan untuk menonjolkan fitur wajah seperti tulang pipi dan hidung', questionAnswer: true),
    Question(questionText: 'Highlighter digunakan untuk memberikan kilau pada area wajah yang ingin ditonjolkan', questionAnswer: true),
    Question(questionText: 'Primer adalah langkah terakhir dalam rutinitas makeup', questionAnswer: false),
    Question(questionText: 'Bedak tabur digunakan untuk memberikan hasil akhir matte pada wajah', questionAnswer: true),
    Question(questionText: 'Blush digunakan untuk memberikan warna alami pada pipi', questionAnswer: true),
    Question(questionText: 'Makeup setting spray digunakan sebelum aplikasi makeup untuk menghidrasi kulit', questionAnswer: false),
    Question(questionText: 'Beauty blender adalah alat yang digunakan untuk menyapukan foundation dan concealer pada wajah', questionAnswer: true),
    Question(questionText: 'Skincare routine tidak berpengaruh pada hasil akhir makeup', questionAnswer:  false),
    Question(questionText: 'Skin preparation berfungsi untuk menjaga ketahanan makeup dalam waktu lama', questionAnswer: true),
    Question(questionText: 'Eyeshadow digunakan untuk mewarnai bibir', questionAnswer: false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  //TODO: Step 3 Part A - create isFinished method that checks the last questions.
  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1 ) {
      print('returning true');
      return true;
    } else {
      return false;
    }
  }

  //TODO: Menghitung jumlah pertanyaan
  int getTotalQuestions() {
    return _questionBank.length;
  }
  //TODO: Step 4 Part B - Create a reset() method that sets the questionNumber back to 0
  void reset() {
    _questionNumber = 0;
  }
}