
int speed = 0; //speed of vertical lines
float speed1 = 0; //speed of horizontal line
PFont font1; //comic sans pixel
String[] ones; //"1 werd 2 rule dem all"
int idx1 = 0; //index of "one word"
boolean start = false; //begin "game"
boolean introfin = false; //true after intro finishes
boolean press = false; // for click play!
boolean win = false;
String typedText = "";
String[] guess;
int idx2 = 0;

void setup() {
  size(600, 600);
  background(255);
  font1 = loadFont("PixelComicSans-Regular-48.vlw");
  ones = loadStrings("one.txt");
  guess = loadStrings("guess.txt");
  smooth();
}

//trigger statements:
void mouseClicked() {
  if ((mouseX > 200) && (mouseX < 400) && (mouseY > 235) && (mouseY < 365) && (start==false)) {
    start=true;
    println("yup");
  }
  if ((mouseX > 200) && (mouseX < 400) && (mouseY > 235) && (mouseY < 365) && (introfin==true) && (press == false)) {
    fill(255);
    textFont(font1);
    textAlign(CENTER);
    text("play?", width/2, height/2+15);
    press = true;
  }
}

void draw() {
  background(255);
  //draw the colorful lines in background
  for (int i = -600; i < width*2; i+=20) {
    stroke(255, 0, 0);
    line(i+speed, 600, 60+i+speed, 0);
  }
  for (int i = -600; i < height*2; i+=20) {
    stroke(0, 255, 0);
    line(0, i+speed1, 1000, 60+i+speed1);
  }
  for (int i = -600; i < width*2; i+=20) {
    stroke(0, 0, 255);
    line(90+i+speed, 600, i+speed, 0);
  }
  //move lines at different speeds
  speed+=2;
  speed1+=1.3;
  //reset line position
  if (speed >= width) {
    speed=0;
  }
  if (speed1 >= width) {
    speed1 = 0;
  }
  //draw empty box
  noFill();
  strokeWeight(1);
  stroke(0);
  rectMode(CENTER);
  rect(width/2, height/2, 200, 130);
  //set up font shit
  fill(0);
  textFont(font1);
  textSize(48);
  textAlign(CENTER);
//when player clicks box, the intro plays:
  if ((start==true)&&(idx1 < ones.length)) {
    text(ones[idx1], width/2, height/2+15);
  }
//play the intro text by doing this:
  if (start==true) {    
    idx1++;
  }
//play? button:
  if ((idx1 > ones.length) && (start==true) && (press==false) && (win==false)) {
    introfin = true;
    text("play?", width/2, height/2+15);
  }
//when the player presses play:
  if (press == true) {
    textFont(font1, 14);
    if (idx2 < guess.length) {
      text(guess[idx2], width/2, height/2-45);
    }
// this adds a blinking cursor after your text
    text(typedText+(frameCount/5 % 2 == 0 ? "_" : ""), width/2, height/2);
  }
  //if the player inputs the right word:
  if (win==true) {
    println("WINNNNINGGGGGGG");
    press = false;
    fill(255, 0, 0);
    textSize(48);
    text((frameCount/10 % 2 == 0 ? "CONGRATULATIONS! \n YOU'VE WON!" : ""), width/2, height/2-45);
  }
  if ((idx2 == guess.length)&&(win==false)) {
    //game over
    fill(255, 0, 0);
    textSize(80);
    text((frameCount/10 % 2 == 0 ? "GAME \n OVER" : ""), width/2, height/2-45);
    if (frameCount % 300 == 0) {
      exit();
    }
  }
}

void keyReleased() {
  if (key != CODED) {
    switch(key) {
    case BACKSPACE:
      typedText = typedText.substring(0, max(0, typedText.length()-1));
      break;
    case TAB:
      typedText += "    ";
      break;
    case ENTER:
    case RETURN:
      // comment out the following two lines to disable line-breaks
      //recognize for lol
      if ((typedText.equals("lol")) || (typedText.equals("LOL")) || (typedText.equals("#HAM")) || (typedText.equals("eym kalau")) || (typedText.equals("pokemon")) || (typedText.equals("meme")) || (typedText.equals("bap bap bap")) || (typedText.equals("fap")) || (typedText.equals("faptop")) || (typedText.equals("moinkey")) || (typedText.equals("BUKAKE SUNRISE")) || (typedText.equals("bukake sunrise"))) {
        win = true;
      } 
      else {
        typedText = "";
        idx2++;
      }
      break;
    case ESC:
    case DELETE:
      break;
    default:
      typedText += key;
    }
  }
}


