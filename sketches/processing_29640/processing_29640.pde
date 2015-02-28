
//Simple game application reminiscent of PAC-MAN, the arcade classic. Use the buttons to change the number, size, and color of the objects he is chasing. See how many you can catch in 25 seconds.

//slider setup 
import controlP5.*;
ControlP5 controlP5;
int sliderValue = 100; 

//select box setup 
import interfascia.*;

GUIController c;
IFButton b1, b2, b3;
IFLabel l;

//background setup
PImage maze; 
PImage ghosts; 
PImage win; 

//audio  setup
import ddf.minim.*;
Minim minim; 
AudioSample buzz; 
AudioSample button; 
AudioSample slider; 
AudioSample button2; 
AudioSample tick; 

//instruct mode setup 
PFont f;
boolean instruct = true; 
PImage instructionScreen; 

//timer setup
Timer time;
PImage clock;
boolean gamestart = false;
boolean GameOver = false;
PImage gameOver; 

//ball setup
int numBall = 25;
float [][] ballPos;
float ballWidth = 30; 
float [][][] ballRange;
boolean[] ballDraw;
float pacManWidth = 20; 
float [] pacMan = {
  350, 250
};

//color setup 
color B1 = color(0,0,0);//black
color B2 = color(250,148,195);//pink
color B3 = color(12,255,253);//blue
color B4 = color(251,142,13);//orange
color B5 = color(233,15,16);//red 
color ballcolor = color(0,0,0);//default black


void setup() {
  size(550, 550); 
  noStroke(); 
  smooth();
  GameOver = false;
  
  //load slider  
  controlP5 = new ControlP5(this); 
  controlP5.addSlider("sliderValue", 5, 25, 140, 140, 520, 75, 10);
 
  //load select box
  c = new GUIController (this);
  
  b1 = new IFButton ("S", 275, 520, 20, 17);
  b2 = new IFButton ("M", 295, 520, 20, 17);
  b3 = new IFButton ("L", 315, 520,20,17); 

  b1.addActionListener(this);
  b2.addActionListener(this);
  b3.addActionListener(this); 

  c.add (b1);
  c.add (b2);
  c.add(b3); 
 
  //load images 
  clock = loadImage ("clock.png"); 
  instructionScreen = loadImage("IntroScreen.jpg");
  gameOver = loadImage("gameOver.jpg");
  maze = loadImage("blackmaze.png");
  win = loadImage("win.png"); 
  
  //load fonts 
  f = loadFont("MSReferenceSansSerif-Bold-48.vlw"); 
  textFont(f, 25); 
  
  //load audio
   minim = new Minim(this);
   time = new Timer();
   buzz = minim.loadSample("buzz.mp3", 2048);
   button = minim.loadSample("button-16.mp3", 2048); 
   slider = minim.loadSample("button-43.mp3", 2048); 
   button2 = minim.loadSample("button-37.mp3", 2048); 
   tick = minim.loadSample("clock-ticking-2.mp3", 2048); 
  
  //load balls with ranges 
  ballPos = new float[numBall][2];
  for (int i=0; i<numBall; i++) {
    ballPos[i][0] = random(50,500);
    ballPos[i][1] = random(50,500);
  }
  ballRange = new float[numBall][2][2];
  for (int i=0; i<numBall; i++) {
    // Xrange
    ballRange[i][0][0] = ballPos[i][0] - ballWidth/2 - pacManWidth;
    ballRange[i][0][1] = ballPos[i][0] + ballWidth/2 + pacManWidth;
    // Yrange
    ballRange[i][1][0] =  ballPos[i][1] - ballWidth/2 - pacManWidth;
    ballRange[i][1][1] = ballPos[i][1] + ballWidth/2 + pacManWidth;
  }
  ballDraw = new boolean[numBall];
  for (int i=0; i<numBall; i++)
    ballDraw[i] = true;
}


void draw() {
  
  //background and clock images
  background(20);
  image(maze,0,0,550,500); 
  image(clock, 490, 505, 40, 40);
  
  //color selector boxes
  fill(B2); 
  rect(50,520,10,10); 
  fill(B3);
  rect(65,520,10,10);
  fill(B4);
  rect(80,520,10,10);
  fill(B5);
  rect(95,520,10,10);
  fill(B1); 
  rect(110,520,10,10);
  
  if(mousePressed){
    if (mouseX >50 && mouseX < 60) {
      if (mouseY >520 && mouseY <530) {
        ballcolor = B2;//pink button
        button.trigger(); 
        println("pink button hit"); 
      }
    }
    if (mouseX > 65 && mouseX < 75) {
      if (mouseY > 520 && mouseY <530) {
        ballcolor = B3;//blue button
        button.trigger();
        println("blue botton hit");
      }
    }
    if (mouseX > 80&& mouseX < 90) {
      if (mouseY >520 && mouseY <530) {
        ballcolor = B4;//orange button
        button.trigger(); 
        println("orange button hit"); 
      }
    }
    if (mouseX > 95 && mouseX < 105) {
      if (mouseY >520 && mouseY < 530) {
        ballcolor = B5;//red button
        button.trigger(); 
       println("red button hit"); 
      }
    }
    if (mouseX > 110 && mouseX < 120) {
      if (mouseY > 520 && mouseY < 530) {
        ballcolor = B1;//black button 
        button.trigger(); 
        println("blackbutton hit"); 
      }
    }
  }
  
  if (gamestart == true) {
    time.begintimer();
  }
  if (instruct) {
    instructMode();
  }
  //draw Pacman
  fill(250, 244, 0);
  arc(pacMan[0], pacMan[1], 2*pacManWidth, 2*pacManWidth, TWO_PI-PI/2, TWO_PI+PI);
  
  // draw objects
  fill(ballcolor); 
  for (int i=0; i<numBall; i++) {
    if (ballDraw[i])
      ellipse(ballPos[i][0], ballPos[i][1], ballWidth, ballWidth);
  }
  //check for a hit
  color backGround = color(0, 0, 0);
  for (int i=0; i<numBall; i++) {
    if (pacMan[0] >= ballRange[i][0][0] && pacMan[0] < ballRange[i][0][1]
      && pacMan[1] >= ballRange[i][1][0] && pacMan[1] < ballRange[i][1][1]
      && ballDraw[i] == true) {
      buzz.trigger();
      backGround = color(255, 0, 0);
      ballDraw[i] = false;
    }
  }
}



void stop() {
  buzz.close(); 
  minim.stop();
  super.stop();
}


