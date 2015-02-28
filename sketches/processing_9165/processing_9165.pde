
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


float speed = 1;
int BallW=300;
int BallH=300; 
PImage orangeball;
PImage pop;
PImage sky;
PImage purpleball;
PImage blueball;
PImage yellowball;
PImage MyDart;
PFont font;
int score;
int missed;

float dartangle;
float[] angle = {
  0.0, 0.5, -0.5,1};

int[] x = new int [4];

float[] xPos = new float [4];
float[] yPos = {
  670,660,690,730};

Minim minim;
AudioPlayer in;
AudioPlayer inTwo;
AudioPlayer inThree;

void setup(){
  size(600,600);
  sky=loadImage("Sky.png");
  orangeball=loadImage ("orangeball.png"); 
  pop=loadImage ("POP2.png");
  purpleball=loadImage("purpleball.png");
  blueball=loadImage("blueball.png");
  yellowball=loadImage("yellowball.png");
  MyDart=loadImage("MyDart.png");
  minim = new Minim(this);//creates a new minim
  in = minim.loadFile("BalloonPop.mp3");
  inTwo = minim.loadFile("1-06 Coconut Mall.mp3");
  inTwo.play();
  inTwo.loop();
 inThree=minim.loadFile("3-33 Draw & Winning Results (Battle).mp3");
  font = loadFont("Calibri-Bold-48.vlw"); 
  textFont(font);
  textSize(34);
  smooth();
}
void draw(){
 imageMode(CORNER);
  frameRate= 24;
  image(sky, 0,0, 600, 600);
  //BALLOON 1
  if (yPos[0]>=600){
    x[0] = int(random(-50,450));
  }
  xPos[0] = x[0] + (sin(angle[0]) * 65.0);
  image(purpleball,xPos[0], yPos[0], BallW, BallH);
  //Speed of Balloon sway
  angle[0] += PI/225.0;
  if (missed<10){
  yPos[0] = yPos[0] - speed;
  }
  if ((mouseX <= xPos[0]+180 && mouseX >= xPos[0]+100) && (mouseY <= yPos[0]+140 && mouseY >= yPos[0]+50)  && (missed<10)){
    image(pop,xPos[0]+40,yPos[0],200,200);
    in.rewind();
    in.play();
    yPos[0]=int(random(640,750));
    speed=speed+0.05;
    score=score+1;
  }

  if (yPos[0]<-160){
    yPos[0] = int(random(640,750));
    missed=missed+1;
  }
  //BALLOON 2
  if (yPos[1]>=600){
    x[1] = int(random(-50,450));
  }
  xPos[1] = x[1] + (sin(angle[0]) * 45.0);
  image(orangeball, xPos[1], yPos[1], BallW, BallH);
  //Speed of Balloon sway
  angle[1] += PI/235.0;
  if (missed<10){
  yPos[1] = yPos[1] - speed;
  }
  if ((mouseX <= xPos[1]+180 && mouseX >= xPos[1]+100) && (mouseY <= yPos[1]+140 && mouseY >= yPos[1]+50)  && (missed<10)){ 
    image(pop,xPos[1]+40,yPos[1],200,200);
    in.rewind();
    in.play();
    yPos[1]=int(random(640,750));
    speed=speed+0.05;
    score=score+1;
  }
  if (yPos[1]<-160){
    yPos[1] = int(random(640,750));
    missed=missed+1;
  }

  //BALLOON 3
  if (yPos[2]>=600){
    x[2] = int(random(-50,450));
  }
  xPos[2] = x[2] + (sin(angle[2]) * 35.0);
  image(blueball, xPos[2], yPos[2], BallW, BallH);
   //Speed of Balloon sway
  angle[2] += PI/225.0;
  if (missed<10){
  yPos[2] = yPos[2] - speed;
  }
  if ((mouseX <= xPos[2]+180 && mouseX >= xPos[2]+100) && (mouseY <= yPos[2]+140 && mouseY >= yPos[2]+50)  && (missed<10)){
    image(pop,xPos[2]+40,yPos[2],200,200);
    in.rewind();
    in.play();
    yPos[2]=int(random(640,750));
    speed=speed+0.05;
    score=score+1;
  }
  if (yPos[2]<-160){
    yPos[2] = int(random(640,750));
    missed=missed+1;
  }

  //BALLOON 4
  if (yPos[3]>=600){
    x[3] = int(random(-50,450));
  }
  xPos[3] = x[3] + (sin(angle[3]) * 50.0);
  image(yellowball, xPos[3], yPos[3], BallW, BallH);
   //Speed of Balloon sway
  angle[3] += PI/245.0;
  if (missed<10){
  yPos[3] = yPos[3] - speed;
  }
  //If the mouse is over the specified area, then display pop image and move ballon image below
  if ((mouseX <= xPos[3]+180 && mouseX >= xPos[3]+100) && (mouseY <= yPos[3]+140 && mouseY >= yPos[3]+50) && (missed<10)){
    image(pop,xPos[3]+40,yPos[3],200,200);
    in.rewind();
    in.play();
    yPos[3]=int(random(640,750));
    speed=speed+0.05;
    score=score+1;
  }
  if (yPos[3]<-160){
    yPos[3] = int(random(640,750));
    missed=missed+1;
  }
  text("Score: "+score, 15, 35); 
  fill(255,0,0);
  text("Missed: " + missed, 440, 35); 
  fill(0,255,0);
  if (missed>=10){
    inTwo.pause();
    inThree.rewind();
    inThree.play();
    fill(255,255,0);
    text("GAME OVER - Press Any Key", 105, 300); 
   noLoop();
  }
  //Mouse settings that make the image turn in the direction of the mouse movement
  imageMode(CENTER);
    noCursor();
    //If mouse moves, then calculate the angle and set the image to that angle
  if (mouseX != pmouseX){
    dartangle = atan2(mouseY-pmouseY, mouseX-pmouseX);
    translate(mouseX, mouseY);
    rotate(dartangle + PI/2);
    image(MyDart,0, 0, 90, 65);
  } //or else, show the last position and direction of the mouse
  else {
     translate(mouseX, mouseY);
    rotate(dartangle + PI/2);
    image(MyDart,0, 0, 90, 65);
  }
}
//If game has ended, clicking will restart the game and all parameters reset
void mousePressed(){
  loop();
  if (missed>=10){
    inThree.pause();
    missed=0;
    score=0;
    speed=1;
    yPos[0] = 660;
    yPos[1] = 650;
    yPos[2] = 680;
    yPos[3] = 740;
        inTwo.rewind();
      inTwo.play();
  }
}
//If game has ended, hitting a key will restart the game and all parameters reset
void keyPressed(){
  loop();
  if (missed>=10){
    inThree.pause();
    missed=0;
    score=0;
    speed=1;
    yPos[0] = 660;
    yPos[1] = 650;
    yPos[2] = 680;
    yPos[3] = 740;
        inTwo.rewind();
      inTwo.play();
  }
}
//Stop sound players when game is stopped
void stop() {
  in.close();
 inTwo.close();
  inThree.close();
minim.stop();
super.stop();
}


