import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyTextScreen extends StatefulWidget {
  const MyTextScreen({Key key}) : super(key: key);

  @override
  _MyTextScreenState createState() => _MyTextScreenState();
}

class _MyTextScreenState extends State<MyTextScreen> {
  final String _text =
      "The little mermaid is a fairy tale written by the Danish author Hans Christian Andersen. The story follows the journey of a young mermaid who is willing to give up her life in the sea as a mermaid to gain a human soul. The tale was first published. “The Little Mermaid” is a fairy tale written by the Danish author Hans Christian Andersen. The story follows the journey of a young mermaid who is willing to give up her life in the sea as a mermaid to gain a human soul. The tale was first published in 1837 as part of a collection of fairy tales for children. “The Little Mermaid” is a fairy tale written by the Danish author Hans Christian Andersen. The story follows the journey of a young mermaid who is willing to give up her life in the sea as a mermaid to gain a human soul. The tale was first published in 1837 as part of a collection of fairy tales for children.";

  List<String> _words;
  Map<String, String> _wordDefinitions = {
    "The": "Bir objeyi vurgularken kullanılır.",
    "little": "Küçük",
    "mermaid": "Deniz kızı",
    "is": "Üçüncü şahıslar için kullanılır",
    "a": "İsmin tek olduğunu belirtmek için kullanılır",
    "fairy": "Bu bir isim",
    "tale": "Bu bir isim",
    "written": "Geçmiş zaman fiili",
    "by": "Kim tarafından",
    "the": "Bir objeyi vurgularken kullanılır",
    "Danish": "BU bir isim",
    "author": "Bu bir isim",
    "Hans": "Bu bir isim",
    "Christian": "Bu bir isim",
    "Andersen.": "Bu bir isim",
    "story": "Hikaye",
    "follows": "Takip eder",
    "journey": "Seyehat",
    "of": "Tamlamalar için kulanılır",
    "young": "Genç",
    "who": "Kim sorusu soran soru kelimesi",
    "willing": "Hevesli",
    "to": "Sebep bildiren kelime",
    "give": "Giv up vazgeçmek ",
    "up": "Giv up vazgeçmek",
    "her": "Bu bir kadınlar için kullanılan zamir",
    "life": "Hayat",
    "in": "İçinde",
    "sea": "Deniz",
    "as": "Gibi",
    "human": "İnsan",
    "soul.": "Ruh",
    "was": "Öyleydi",
    "first": "Birinci",
    "published.": "yayınlanan",
    "gain": "kazanmak"
  };

  @override
  void initState() {
    super.initState();
    _words = _text.split(" ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[100],
      ),
      backgroundColor: Colors.blueGrey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 20),
            Image.asset(
              "assets/banner.png",
              fit: BoxFit.fitWidth,
            ),
            SizedBox(height: 20),
            Text(
              'The Little Mermaid',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 24,),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
          child: RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 18),
              children: _words
                  .map((word) => TextSpan(
                text: word + " ",
                style: TextStyle(
                  color: Colors.black54,
                  decoration: TextDecoration.none,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _showDefinition(word);
                  },
              ))
                  .toList(),
            ),
          ),
        ),
          ],
        ),
      ),
    );
  }

  void _showDefinition(String word) {
    final RenderBox renderBox = context.findRenderObject();
    final RenderBox overlay = Overlay.of(context).context.findRenderObject();
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        renderBox.localToGlobal(
            renderBox.size.center(Offset.zero), ancestor: overlay),
        renderBox.localToGlobal(
            renderBox.size.center(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: position.top),
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width / 4, // change the width here
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      word,
                      style: TextStyle(

                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      _wordDefinitions[word],
                      style: TextStyle(
                          fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
