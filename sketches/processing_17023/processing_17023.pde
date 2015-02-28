
ExCorpse[] corpseImage = new ExCorpse[4];
int maxFiles = 6; //this should be the total number of files we have
int IMGWIDTH = 375;
int IMGHEIGHT = 120;
int HISTORYWIDTH = 165;
int HINTWIDTH = 150;
int GUTTER = 7;
int WD=900;
int HT=540;
PFont font;
PFont font2;
PFont font3;
color redBlock = color(208, 36, 36); //these are the actual colors
color greenBlock = color(4, 203, 4);
color yellowBlock = color(235, 224, 31);
color blueBlock = color(60, 83, 220);
int[] answerCode = new int[4];
int[] guessCode = new int[4];
int RESET = 0; //these decide whether a click resets the game or updates with the next guess
int UPDATE = 1;
int actionPhase = UPDATE;
int guessNumber = 0; //keeps track of how many guesses
int guessIndex = 0;//this is a mockup for keyboard input
String actionMessage = "MAKE YOUR GUESS"; //this displays the bottom left message
Guess guesses;
int selection;

void setup(){
  font = loadFont("Handwriting-Dakota-48.vlw");
  font2 = loadFont("ArialMT-20.vlw");
  font3 = loadFont("ArialMT-14.vlw");
  size(920, 580);
  background(172, 196, 154);

  drawBackground();
  initializeImages();

  guesses= new Guess();

  //Select the code answer on setup
  for (int i = 0; i<4; i++){
    answerCode[i] = floor(random(6));
  }
}

void draw(){ //nothing! ha ha ha ha ha ha ha!
  guesses.drawAllSquares();

  if (selection >= 0 && mousePressed && mouseX > width-170){
    guesses.dragSquare(mouseX, mouseY);
  }

}

void mousePressed(){
  selection =  guesses.selectSquare(mouseX, mouseY);
}



void mouseReleased(){
  if (selection >= 0){
    guesses.dropSquare(mouseX, mouseY, selection); 
  }
}

void keyPressed(){

  if (key == ' '){ //this is a mockup for pressing the button on the physical interface
    if (actionPhase == UPDATE){ //if we're in updating mode, then do the comparison (to be coded) and update the number
      if (guessNumber < 9){
        guesses.translateColors();
        CompareUpdate();
        guessNumber = guessNumber + 1;
      }
      else{ //on the last guess, compare the results and set it so the next click will be a reset
        CompareUpdate();
        guessNumber = 0;
        actionPhase = RESET;
      }
    }
    else if (actionPhase == RESET){ //if we're in reset mode, choose a new code and new images
      drawBackground();
      initializeImages();
      for (int i = 0; i<4; i++){ //select a new answer code
        answerCode[i] = floor(random(6));
      }
      guesses.resetSquares();
      //  println(answerCode);
      actionPhase = UPDATE; //ready to guess!
    }
  } 
}

