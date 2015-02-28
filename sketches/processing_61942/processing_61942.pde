
int timer = 0;
int gameOverCondition = 0;
boolean gameOver;
boolean gameStart;
boolean gameRunning;
boolean gameWin;
boolean wordChosen;
ArrayList<String> incorrectLetters = new ArrayList<String>();
String gameWord;
int guessAttempts = 0;
String letter;
String correctWord = "";
StringBuffer displayWord;
PImage FP;
PImage MF;
PImage KT;
PImage whale;
PImage AY;
PImage BT;
PImage KS;
PImage SH;
PImage AL;
PImage MH;
PImage CF;
PImage AA;
PImage LL;
PImage DS;
PImage pole;
PImage SL;
char clicked;

void setup() {
  stroke(255);
  size(500, 350);
  background(155);
  frameRate(30);
  gameOver = false;
  gameStart = false;
  gameRunning = true;
  wordChosen = false;
  correctWord = "";
  incorrectLetters = new ArrayList<String>();
  guessAttempts = 0;
  timer = 0;
  AY = loadImage("AYBeta.png");
  BT = loadImage("BTBeta.png");
  KS = loadImage("KSBeta.png");
  SH = loadImage("SHBeta.png");
  AL = loadImage("ALBeta.png");
  CF = loadImage("CFBeta.png");
  MH = loadImage("MHBeta.png");
  AA = loadImage("AABeta.png");
  LL = loadImage("LLBeta.png");
  DS = loadImage("DSBeta.png");
  SL = loadImage("SLBeta.png");
  KT = loadImage("KT.png");
  whale = loadImage("Whale.png");
  MF = loadImage("Ferraro.png");
  FP = loadImage("fist.png");
  pole = loadImage("pole.png");
  chooseWord();
}

//Chooses difficulty level.
void chooseDifficulty() {

  if ( key == 'e' || key == 'E') {
    gameOverCondition = 5400;
    gameStart = true;
    letter = "";
  }
  else if ( key == 'M' || key == 'm' ) {
    gameOverCondition = 3600;
    gameStart = true;
    letter = "";
  }
  else if ( key == 'H' || key == 'h' ) {
    gameOverCondition = 1800;
    gameStart = true;
    letter = "";
  }
  else {
  }
}

void draw() {
  if (gameStart == false && gameRunning == true) {
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
   if (gameOver == true && gameRunning == false && gameWin == false) {
    youLose();
  }

  if (gameOver == true && gameRunning == false && gameWin == true) {
    youWin();
  }
  if (gameStart == true && gameOver == false && gameRunning == true) {
    timer++;
    background(255);
    image( KT , 290 , 0);
    fill(0);
    textSize(20);
    text("Letters guessed", 0, 20);
    fill( 255, 0, 0);
    for (int i = 0 ; i < incorrectLetters.size() ; i++) {
      text(incorrectLetters.get(i), 50*(i), 50, 100);
    }
    textSize(40);
    fill(0);
    for (int i = 0 ; i < gameWord.length() ; i++) {
      text( displayWord.charAt(i), 50*(i), 300, 200);
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

    if (gameLogic() == true) {
      rightLetter();
    }

    if (gameLogic() == false) {
      wrongLetter(letter);
    }   
    if (timer == gameOverCondition) {
      gameOver = true;
      gameRunning = false;
      gameStart = false;
      gameWin = false;
    }
    if (gameWinCondition() == true) {
      gameStart = false;
      gameWin = true;
      gameOver = true;
      gameRunning = false;
    }
    if (guessAttempts == 5) {
      hangingMan();
      gameOver = true;
      gameWin = false;
      gameRunning = false;
    }
  }
}

//Randomly chooses the word the user must guess from the array wordBank.
void chooseWord() {
  int random = (int)(Math.random() * (wordbank.length));
  gameWord = wordbank[random];
  for (int i = 0 ; i < gameWord.length() ; i++) {
    correctWord+= ".";
  }
  displayWord = new StringBuffer(correctWord);
}

//A method that draws out the hangman as the game continues
void hangingMan() {


  if (guessAttempts == 0) {
  image(pole , 300 , 50);
  }
  if (guessAttempts == 1) {
    //head
    image(pole , 300 , 50);
    fill(255);
    ellipse(345, 92, 55, 55);
  }
  if (guessAttempts == 2) {
    //body
    image(pole , 300 , 50);
    fill(255);
    ellipse(345, 92, 55, 55);
    line(345, 118, 345, 175);
  }
  if (guessAttempts == 3) {
    //arms
    image(pole , 300 , 50);
    fill(255);
    ellipse(345, 92, 55, 55);
    line(345, 118, 345, 175);
    line(300 , 140, 380 , 140);
  }
  if (guessAttempts == 4) {
    //legs
   image(pole , 300 , 50);
    fill(255);
    ellipse(345, 92, 55, 55);
    line(345, 118, 345, 175);
    line(300 , 140, 380 , 140);
    line(345, 175 , 330 , 220);
    line(345, 175 , 360 , 220);
  }
  if (guessAttempts == 5) {
    //face
    image(pole , 300 , 50);
    fill(255);
    ellipse(345, 92, 55, 55);
    line(345, 118, 345, 175);
    line(300 , 140, 380 , 140);
    line(345, 175 , 330 , 220);
    line(345, 175 , 360 , 220);
    image( randomImage(), 320, 55);
  }
}

//Rewritten keyPressed() code uses inputLogic method.
void keyPressed() {
  inputLogic();
}

// Saves the users keyboard input.
void inputLogic() {

  if (Character.isLetter(key) == true) {
    clicked = key;
    letter = Character.toString(key);
    letter = letter.toLowerCase();
  }
}

//Logic for the game, determines whether or not the letter is part of the game word or not.
boolean gameLogic() {
  if ( gameWord.contains(letter) == true) {
    return true;
  }
  return false;
}

//Procedures to enact if the letter is correct.
void rightLetter() {
  for (int k = 0 ; k < gameWord.length() ; k++) {
    if ( key == gameWord.charAt(k)) {
      displayWord.setCharAt( k, clicked);
    }
  }
  key = ' ';
}

//Condition to win the game.
boolean gameWinCondition() {
  for (int i = 0 ; i < displayWord.length() ; i++) {
    if ( displayWord.charAt(i) == '.') {
      return false;
    }
  }
  return true;
}

//Creates the lose screen message.
void youLose() {
  fill(0);
  textSize(35);
  text("SORRY! ", 0, 80);
  textSize(35);
  text("THE WORD WAS ", 0, 120);
  textSize(35);
  fill( 255, 0, 0 );
  text(gameWord, 0, 170);
  fill(0);
  textSize(25);
  text("Your time was: " + "" + timer, 0, 195);
  textSize(30);
  fill(210, 86, 122);
  text("Would you like to play again? ", 0, 220 );
  text("[Y]es? or [N]o? ", 0, 245);
  if ( key == 'y' || key == 'Y') {
    setup();
  } if( key == 'n' || key == 'N') {
    exit();
}
}

//Creates the win screen message.
void youWin() {
  background(0 , 225, 225 );
  image( KT , 0 , 300);
  image( whale , 150, 250);
  image( MF, 430, 0);
  image( FP , 420 , 250);
  textSize(40);
  fill( 130, 25, 220 );
  text("CONGRATULATIONS!", 0, 50);
  textSize(35);
  text("YOU SUCCESSFULLY GUESSED ", 0, 100);
  textSize(35);
  fill( 255, 0, 0 );
  text(gameWord, 0, 150);
  fill(0);
  text("Your time was: " + "" + timer, 0, 175);
  textSize(30);
  fill(210, 86, 122);
  text("Would you like to play again? ", 0, 200 );
  text("[Y]es? or [N]o? ", 0, 225);
  if ( key == 'y' || key == 'Y') {
    setup();
  } if( key == 'n' || key == 'N') {
    exit();
  }
}

//Procedures to conduct if the player guessed a wrong letter.
void wrongLetter(String s) {
  for (String str: incorrectLetters) {
    if (str.equals(letter)) {
      return;
    }
  }
  incorrectLetters.add(s);
  guessAttempts++;
}

//Creates underline marks to represent how many letters there are in the word. Mainly for visual design.
void wordPresentation() {
  for (int i = 0; i < gameWord.length() ; i++) {
    int begA = 50 * i;
    int begB = 300;
    line( begA, begB, begA + 25, begB);
  }
}

// Finds a random image from the PImage array to use as the head of the hangman.
PImage randomImage() {
  PImage[] imageBank = {
    AY, BT, KS, SH, AL, MH, CF , AA , LL , DS , SL
  };
  int randomizer = (int)(Math.random() * imageBank.length);
  return imageBank[randomizer];
}

//Word Bank for the game. (This is at the bottom because if this was at the top, it would be too obvious)
String[] wordbank = {
  "swag", "boar", "anthony", "great", "poptarts", "swaggy", "yolo", "stanley", "ferraro", "orbitals", "hamlet", "tricks", "ichiro", "apcs", "cyber", "zoboomafoo", "dora", "shamu" , "seacrest" , "cellphone" , "macsarebad" , "headphones" , " starbucks" , "eureka" , "gothic" , "profound" , "idk" , "bff" , "jill", "letbe" , "safe" , "blanket" , "router" , "wireless", "cupcake" , "bob" , "kiiroitori" , "under" , "the" , "sky" , "droid" , "tennis" , "java" , "gridworld" , "jazz" , "studmuffin" , "calculus" , "earth" ,"shattering" , "binkowski" , "profound" , "batman" , "motley" , "justice" , "rime" , "chomalam" , "tyga" , "dominoes" , "bikini" , "buckaroo" , "z" , "giraffe" , "chinchilla" , "llama" , "hope"   
};


