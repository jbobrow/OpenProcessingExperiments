
int timer = 0;
int gameOverCondition = 0;
int gameWinCondition = 0;
boolean gameOver;
boolean gameStart;
String[] wordbank = {
  "swag", "boar",
};
ArrayList<String> incorrectLetters = new ArrayList<String>();
String gameWord = "";
int guessAttempts = 0;
String letter;


void setup() {
  stroke(255);
  size(500, 350);
  frameRate(10);
  gameOver = false;
  gameStart = false;
  chooseWord();
}

void chooseDifficulty() {
  if (keyPressed) {
    if ( key == 'e' || key == 'E') {
      gameOverCondition = 5400;
      gameStart = true;
    }
    else if ( key == 'M' || key == 'm' ) {
      gameOverCondition = 3600;
      gameStart = true;
    }
    else if ( key == 'H' || key == 'h' ) {
      gameOverCondition = 1800;
      gameStart = true;
    }
    else {
    }
  }
}


void draw() {
  if (gameStart == false) {
    textSize(40);
    fill(0);
    text("Welcome to Hangman!", 0, 50);
    textSize(48);
    text("Please choose a level! ", 0, 175);                              
    fill( 0, 0, 225);
    text("[E]asy", 0, 230);
    fill(0, 225, 0);
    text("[M]edium", 0, 280);
    fill(225, 0, 0);
    text("[H]ard", 0, 330);
    chooseDifficulty();
  }
  if (gameStart == true && gameOver == false) {
    timer++;
    background(255);
    fill(0);
    textSize(20);
    text("Letters guessed", 0, 20);
    for (int i = 0 ; i < incorrectLetters.size() ; i++) {
      text(incorrectLetters.get(i), 50*(i), 50, 100);
    }
    for (int i = 0 ; i < gameWord.length() ; i++) {
    }
    fill(255);
    stroke(50, 50, 50);
    textSize(28);
    fill(0);
    text("Timer", 350, 30);
    fill(255, 0, 0);
    text(timer, 430, 30);
    wordPresentation();
    hangingMan();
    for (int i = 0; i < gameWord.length() ; i++) {
      int begA = 50 * i;
      int begB = 300;
      textSize(40);
      text( ".", begA + 4, begB - 1);
    }

    if (gameLogic() == true) {
      rightLetter();
    }

    if (gameLogic() == false) {
      wrongLetter(letter);
    }      
    if (gameWinCondition == gameWord.length()) {
      gameOver = true;
    }
    if (timer == gameOverCondition) {
      gameOver = true;
    }
  }
  if (gameOver == true || guessAttempts == 5) {
    background(0);
  }
}

void chooseWord() {
  int random = (int)(Math.random() * (wordbank.length)) ;
  gameWord = wordbank[random];
}

void hangingMan() {


  if (guessAttempts == 0) {

    line(460, 50, 460, 230);
    line(460, 50, 390, 50);
    line(390, 50, 390, 65);
  }
  if (guessAttempts == 1) {
    line(460, 50, 460, 230);
    line(460, 50, 390, 50);
    line(390, 50, 390, 65);
    fill(255);
    ellipse(390, 90, 55, 55);
  }
  if (guessAttempts == 2) {
    line(460, 50, 460, 230);
    line(460, 50, 390, 50);
    line(390, 50, 390, 65);
    fill(255);
    ellipse(390, 90, 55, 55);
    line(390, 118, 390, 175);
  }
  if (guessAttempts == 3) {
    //arms
    line(460, 50, 460, 230);
    line(460, 50, 390, 50);
    line(390, 50, 390, 65);
    fill(255);
    ellipse(390, 90, 55, 55);
    line(390, 118, 390, 175);
    line(345, 140, 435, 140);
  }
  if (guessAttempts == 4) {
    //legs
    line(460, 50, 460, 230);
    line(460, 50, 390, 50);
    line(390, 50, 390, 65);
    fill(255);
    ellipse(390, 90, 55, 55);
    line(390, 118, 390, 175);
    line(345, 140, 435, 140);
    line(390, 175, 375, 220);
    line(390, 175, 405, 220);
  }
  if (guessAttempts == 5) {
  }
}

void keyPressed() {
  inputLogic();
}

void inputLogic() {
  char clicked = key;
  letter = Character.toString(key);
  letter = letter.toLowerCase();
}

boolean gameLogic() {
  if ( gameWord.contains(letter) == true) {
    return true;
  }
  return false;
}

void rightLetter() {


  for (int k = 0 ; k < gameWord.length() ; k++) {
    if (key == gameWord.charAt(k)) {
    }
    return;
  }
}




void wrongLetter(String s) {
  for (String str: incorrectLetters) {
    if (str.equals(letter)) {
      return;
    }
  }
  incorrectLetters.add(s);
  guessAttempts++;
}

void wordPresentation() {
  for (int i = 0; i < gameWord.length() ; i++) {
    int begA = 50 * i;
    int begB = 300;
    line( begA, begB, begA + 25, begB);
    textSize(20);
  }
}
