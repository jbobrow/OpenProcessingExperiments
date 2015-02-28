
String textInput;
String textOutput;

void setup() {
  textInput = "Bethany";
  textOutput = encodeMorseCode(textInput);
  println("Text input: " + textInput);
  println("Morse code: " + textOutput);
}

void draw() {
}

String encodeMorseCode(String in_string) {
    
  String TextInput = in_string.toLowerCase();
  String MorseCode = new String();
  String[] AlphabetArray = {
    "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", 
    "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"
  };
  String[] MorseCodeArray = {
    "._", "_...", "_._.", "_..", ".", ".._.", "__.", "....", "..", ".___", "_._", "._..", "__", 
    "_.", "___", ".__.", "__._", "._.", "...", "_", ".._", "..._", ".__", "_.._", "_.__", "__.."
  };
  
  for (int i=0; i<TextInput.length(); i++) {
    for (int j=0; j<AlphabetArray.length; j++) {
      if (String.valueOf(TextInput.charAt(i)).equals(AlphabetArray[j])) {
        MorseCode += MorseCodeArray[j] + " " ;
      }
    }
  }
  return MorseCode;
}

