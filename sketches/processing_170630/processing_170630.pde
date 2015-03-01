
//interaction & art.comp
import ddf.minim.*;

Minim minim;
AudioSample button;
AudioSample NO;
AudioSample OK;
AudioSample door;

PImage alice;
PImage bread;
PImage tinydoor;

int password = 0;
int fail = 0;

PFont f;

float frameNum;

void setup() {

  size(800, 700);
  alice = loadImage("200_s.gif");
  bread = loadImage("3 bread.png");
  tinydoor = loadImage("tiny door.gif");

  f = createFont("Courier", 12);
  textFont(f);

  frameRate(30);
  frameNum = frameCount;


  minim = new Minim(this);
  button = minim.loadSample("beep-21.mp3", 512);
  NO = minim.loadSample("beep-03.mp3", 512);
  OK = minim.loadSample("ok.mp3", 512);
  door = minim.loadSample("tinyenter.wav", 512);

  // if (player == null) println("beep");
}


void draw() {
  background(255);
  // println(frameCount);

  println(password);

  textAlign(CENTER);
  fill(0);
  text("What did you see in the hole?", width/2, 4*height/5 - 15);
  text("Answer the question and Press the ENTER key.", width/2, 4*height/5);


  imageMode(CENTER);
  image(alice, width/2, height/2);

/*
  if (password == 12) {
    noStroke();
    fill(255, 0, 0);
    ellipse(width/5, height/2, 10, 10);
  }

  if (password == 32) {
    noStroke();
    fill(0, 0, 255);
    ellipse(4*width/5, height/2, 10, 10);
  }
  */


  if (password == 50) {
    // OK.play();
    imageMode(CENTER);
    image(bread, width/2 + 2, height/4, 150/3, 138/3);
    text("EAT ME", width/2, height/4 - 30);
    if (frameCount == 50) door.trigger();
    if (frameCount >= 50) {
      background(255);
      //door.close();
      image(tinydoor, width/2, height/2, 644/3, 610/3);
      text("OK, you can enter now. Good luck!", width/2, height/4);
      fail = 0;
    }
  }

  if (password == 100) {
    //  NO.play();
    text("you can not enter", width/2, height/4);
  }


  if (fail >= 2) {
    text("Go back to the hole poster.", width/2, 4*height/5 + 15);
   if (fail >= 5) 
     text("Which colors and How many times did you see the lights?", width/2, 4*height/5 + 30);
     if (fail >= 10)
     text("example of answer : yellow7green8", width/2, 4*height/5 + 45);
  }
}


void keyPressed() {

  if (key == 'q' || key == 'w' ) {
    password = 0;
    button.trigger();
  }
  if (key == 'e' )
    button.trigger();
  if (key == 'r' )
    button.trigger();
  if (key == 'u')
    button.trigger();
  if (key == 'y' || key == 'k' ) {
    password = 0;
    button.trigger();
  }
  if (key == 'i' || key == 'o' ) {
    password = 0;
    button.trigger();
  }
  if (key == 'p' || key == 'a' ) {
    password = 0;
    button.trigger();
  }
  if (key == 's') {
    password = 0;
    button.trigger();
  }
  if (key == 'f' || key == 'g' ) {
    password = 0;
    button.trigger();
  }
  if (key == 'h' || key == 'j' ) {
    password = 0;
    button.trigger();
  }
  if (key == 'l' || key == 'd')
    button.trigger();  
  if (key == 'b')
    button. trigger();
  if (key == 'z' || key == 'x' ) {
    password = 0;
    button.trigger();
  }
  if (key == 'c' || key == 'v' ) {
    password = 0;
    button.trigger();
  }
  if (key == 't' || key == 'n' ) {
    password = 0;
    button.trigger();
  }
  if (key == 'm' || key == '1' ) {
    password = 0;
    button.trigger();
  }
  if (key == '2' || key == '6' ) {
    password = 0;
    button.trigger();
  }
  if (key == '4' || key == '5' ) {
    password = 0;
    button.trigger();
  }
  if (key == '8' || key == '9' ) {
    password = 0;
    button.trigger();
  }
  if (key == '0' || key == ',' ) {
    password = 0;
    button.trigger();
  }
  if (key == '3' || key == '7')
    button.trigger();

  if (key == 'r') 
    password = 3;
  if (key == 'e' && password == 3 || password == 28)
    password = password+4; 
  if (key == 'd' && password == 7) 
    password = password+5;
  if (key == '3' && password == 12)
    password = password+6;
  if (key == 'b' && password == 18)
    password = password+1;
  if (key == 'l' && password == 19)
    password = password+2;
  if (key == 'u' && password == 21)
    password = password+7;
  if (key == '7' && password == 32) 
    password = password+8;


  if (keyCode == ENTER) {
    if (password == 40) {
      frameCount = 0;
      password = 50;
      OK.trigger();
    } else {
      password = 100;
      NO.trigger();
      fail = fail+1;
    }
  }

  /*
  if (keyCode == RIGHT) {
   noStroke();
   fill(0, 0, 255);
   ellipse(4*width/5, height/2, 20, 20);
   } else if (keyCode == LEFT) {
   noStroke();
   fill(255, 0, 0);
   ellipse(width/5, height/2, 20, 20);
   }
   */
}



