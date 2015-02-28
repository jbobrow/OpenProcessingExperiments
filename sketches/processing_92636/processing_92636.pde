
ControlBar Bar;
Cliffs Sides;
ArrayList bearArray;

import ddf.minim.*;
Minim minim;
AudioSnippet GameMusic;
AudioSample Ding;
AudioSample Cheer; 
AudioSample Boo2;
AudioSnippet Wah;


float noisePos = 0.0;
int score = 0;
int level = 1;
int nextTime = 2000;
int mode = 0;
int bKill = 10;
float cloudspeed = 0.5;
float cloudx = 0;
float trojanY = 0;
float trojanspeed = 0.2;
PImage StartScreen;
PImage LeftCliff;
PImage RightCliff;
PImage Background;
PImage CtrlBar;
PImage Trojans;
PImage GameOver;
PImage Flag;
PImage Cloud;
PImage Warning;

void setup() {
  size(1024, 576);
  noCursor();
  frameRate(240);
  Bar = new ControlBar ();
  Sides = new Cliffs ();
  StartScreen = loadImage("startscreen.png");
  LeftCliff = loadImage("Lcliff.png");
  RightCliff = loadImage("Rcliff.png");
  Background = loadImage("bg.png");
  CtrlBar = loadImage("ctrlbar.png");
  Trojans = loadImage("trojans.png");
  GameOver = loadImage("gameover.png");
  Flag = loadImage("flag.png");
  Cloud = loadImage("cloud.png");
  Warning = loadImage("warning.png");

  minim = new Minim(this);
  GameMusic = minim.loadSnippet("Game_Music2.mp3");
  Cheer = minim.loadSample("Cheer.mp3", 2048);
  Ding = minim.loadSample("Ding.mp3", 2048);
  Wah = minim.loadSnippet("wahwah.mp3");
  Boo2 = minim.loadSample("Boo.mp3");

  reset();
}

void draw() {
  background(255);
  //mode 0, startscreen
  if (mode == 0) {
    background(100);
    image(StartScreen, 0, 0, width, height);
    textSize(20);
    fill(0);
  } 
  //mode 1, game mode
  else if (mode == 1) {
    background(255);
    //set clouds and background
    cloudx = cloudx + cloudspeed;
    image(Background, -4, 0, width+8, height);
    image(Cloud, cloudx, 10, width/2, height/2);
    if (cloudx +width/2 >= width) {
      cloudspeed = -cloudspeed;
    } 
    if (cloudx <= 0) {
      cloudspeed = -cloudspeed;
    }
    //set trojans 
    trojanY = trojanY + trojanspeed;
    image(Trojans, 0, trojanY, width, height);
    if (trojanY >= 0) {
      trojanspeed = -trojanspeed;
    } 
    if (trojanY <= 5) {
      trojanspeed = -trojanspeed;
    }
    
    image(Flag, 800, 120, 200, 240);
    playGame();
    GameMusic.play();
  }
  //mode 2, game over  
  else if (mode == 2) {
    background(255);
    textSize(72);
    fill(#FFD879);
    image(GameOver, 0, 0);
    text(score, 445, 365);
    GameMusic.pause();
    Wah.play();
  }
}


float barleft;
float barright;
float barlength = 180;


//paddle
class ControlBar {

  void move() {
    //constrain paddle
    barleft = constrain(mouseX, 250, 774-barlength);
    barright = constrain(mouseX, 250, 774-barlength)+barlength;
  }

  void display() {
    noStroke();
    //    rect(barleft, 300, barlength, 20);
    image(CtrlBar, barleft, 300, barlength, 20);
    
    
    //set paddle length decrease with score
    if (score >= 200) {
      barlength = 170;
    } 
    if (score >= 300) {
      barlength = 160;
    } 
    if (score >= 400) {
      barlength = 150;
    } 
    if (score >= 500) {
      barlength = 140;
    } 
    if (score >= 600) {
      barlength = 130;
    } 
    if (score >= 700) {
      barlength = 120;
    } 
    if (score >= 800) {
      barlength = 110;
    } 
    if (score >= 900) {
      barlength = 100;
    } 
    if (score >= 1000) {
      barlength = 90;
    } 
    if (score >= 1500) {
      barlength = 70;
    } 
    if (score >= 2000) {
      barlength = 50;
    }
  }
}


class Cliffs {
  void move() {
  }
  void display() {


    fill(50);
    noStroke();

    //    rect(0, 300, 250, 400);
    image(LeftCliff, 0, 300);
    //    rect(774, 300, 250, 400);
    image(RightCliff, 774, 300, 254, 300);
  }
}





void mousePressed() {
  if (mode == 0) {
    mode = 1;
  } 
  else if (mode == 2) {
    reset();
    mode = 0;
  }
}

void reset() {
  loop();
  score = 0;
  bKill = 10;
  noisePos = 0.0;
  barlength = 180;
  noise(noisePos);
  bearArray = new ArrayList();
}



class Bears
{
  //set up coords. of bears
  public float x = 0;
  public float y = 0;
  //set up direction
  float speedX = 0;
  float speedY = 0;
  private PImage jbruin;
  float bearheight = 80;
  float bearwidth = 120;
  float horizon = 300;


  float r = 0;
  boolean fell = false;
  boolean scored = false;

  //generate bears
  Bears(float _x, float _y)
  {
    x = _x;
    y = _y;
    speedX = random(3, 6);
    speedY = random(-11, -8);
    r = 50;
    jbruin = loadImage("bear.png");
  }

  //gravity motion simulation
  void gravity()
  {
    speedY += 0.2;
  }

  float getX() {
    return this.x;
  }
  float getY() {
    return this.y;
  }

  float getRadius() {
    return this.r;
  }

  int run() {
    display();
    move();
    int score = offScreen();
    bounce();
    gravity();
    BearShrink();
    return score;
  }

  //score 10 points for every bear that gets across
  int offScreen() {
    int returnVal = 0;
    if (!scored && !fell && (x > width || y > height )) {
      returnVal = 10;
      scored = true;
    }
    return returnVal;
  }

  //bear size reduction with point increase
  void BearShrink() {
    if (score >= 250) {
      bearwidth = 96;
      bearheight = 64;
    } 
    if (score >= 500) {
      bearwidth = 80;
      bearheight = 60;
    } 
    if (score >= 750) {
      bearwidth = 66;
      bearheight = 44;
    } 
    if (score >= 1000) {
      bearwidth = 54;
      bearheight = 36;
    }
  }


  void bounce() {


    //for bears bouncing off control bar
    if ((x + bearwidth + 2 >= barleft) && (x <= barright) && 
      y + bearheight >= horizon + 10 &&  fell == false) {
      speedY = -speedY;
      y = horizon - bearheight -3;
      println("ok");
      Ding.trigger();
    }
    //for bears bouncing off right cliff
    if ((x + bearwidth + 5 >= 774) && (x <= width) &&
      y + bearheight >= horizon + 10 && fell == false) {
      speedY = -speedY;
    }
    else if (y + bearheight > horizon + 10 && speedY > 0 && fell == false) {
      fell = true;
      println("fell");
    }
  }





  void move() {
    x += speedX;
    y += speedY;
  }

  void display() {

    fill(0);
    //    rect(x, y, 120, 80);
    image(jbruin, x, y, bearwidth, bearheight);
  }
}


void playGame() {


  text("Score " +score, 20, 30);
  text("Lives Left " +bKill, 20, 60);


  //randomly generate bears  
  noisePos += 0.3;
  //  println(noise(noisePos));
  if (noise(noisePos) > 0.75) {
    Bears Bruins = new Bears(-50, 290);
    bearArray.add(Bruins);

//    if (score >= 500) {
//      bearArray.add(Bruins);
//    }
  }


  //scoring and life diminishing
  Iterator i = bearArray.iterator();
  while (i.hasNext ()) {
    Bears uclaB = (Bears) i.next();
    score += uclaB.run();

    //if bears fall through pit, life -1
    if ((uclaB.y > height) && (uclaB.x > 250) && (uclaB.x+barlength < 1024)) {
      bKill  -= 1;
      Boo2.trigger();
      i.remove(); 
    }
  }

  //if lives left = -1, game over
  if (bKill<= -1) {
    mode = 2;
  }





  stroke(0);
  strokeWeight(20);
  Bar.move();
  Bar.display();

  Sides.move();
  Sides.display();
}



