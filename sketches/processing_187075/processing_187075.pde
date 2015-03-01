
// kwong hoi lam rita (53576740)
// this game is inspired by the film "the amazing sprider man 2". In this game you have to fight with the Electro
// click on him to attack, save the world!!!!!!

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

import ddf.minim.*;

Minim minim;
AudioPlayer amazing; // background music
AudioPlayer se;
float [] p1= new float [6]; //to set a random location of the light 
float [] p2= new float [6]; //to set a random location of the light 
float v= 0; //the location of sprider
boolean v2=true;
PImage spider;
PImage bg; // the backgorund
PImage emo;
PImage light;
PImage m;
PImage win;
PImage again;
PImage[] hp = new PImage [8]; // the pistuer for the hp bar
float x1; //x1,y1 is for moving the character(emo)
float y1; //x1,y1 is for moving the character(emo)

boolean v3=true;
int v1=0;
void setup() {
  size(1000, 1000);
  minim =  new Minim(this);
  amazing =  minim.loadFile("amazing.mp3"); // the background music
  amazing.play();
  m = loadImage("mouse.png");
  bg= loadImage("bg.png");
  spider= loadImage("ef.png");
  emo= loadImage("emo.png");
  light= loadImage("light.png");
  win= loadImage("win.png");
  again= loadImage("again.png");


  hp[0]= loadImage("hp1.png");
  hp[1]= loadImage("hp2.png");
  hp[2]= loadImage("hp3.png");
  hp[3]= loadImage("hp4.png");
  hp[4]= loadImage("hp5.png");
  hp[5]= loadImage("hp6.png");
  hp[6]= loadImage("hp7.png");
  hp[7]= loadImage("hp8.png");
  //a series pics of the hp bar

  frameRate(1);
}

void draw() {

  cursor(m, 0, 0); // to set the mouse become a spider logo

  p1[0]= random(100, 250);
  p1[1]= random(200, 360);
  p1[2]= random(350, 600);
  p1[3]= random(300, 350);
  p1[4]= random(400, 490);
  p1[5]= random(700, 750);

  p2[0]= random(300, 450);
  p2[1]= random(650, 700);
  p2[2]= random(500, 600);
  p2[3]= random(400, 500);
  p2[4]= random(200, 250);
  p2[5]= random(850, 950);
  // to make the light moving randomly in a specific range

  x1= random(500, 700);
  y1= random(200, 550);
  // to set the Electro to move randomly to increase the difficulty

  imageMode(CORNER);
  image(bg, 0, 0, 1000, 1000);
  if (v3==true) {
    image(emo, x1, y1, 300, 350); // x1,y1 is for moving the character(emo)

    image(hp[v1], 600, 10, 300, 100);
  }
  for (int i=0; i<6; i++) {
    image (light, p1[i], p2[i], 100, 100);
  }

  pushMatrix();
  translate(250, 0);
  rotate(v);
  image(spider, -180, 0, 350, 500);
  popMatrix(); // to not affect other elements




  if (v<PI/8) {
    v2=true;
  }
  if (v2==true) {
    v=v+PI/8;
  }
  if (v>PI/8) {
    v2=false;
  }
  if (v2==false) {
    v=v-PI/8;
  }
  //to  move the sprider with same oringin
  if (v3==false) {
    background(win);
    imageMode(CENTER);
    // if the electro is dead, a picture will show u are won
  }
}

void mouseClicked() {

  if (mouseX>=x1 && mouseY>=y1 && mouseX<=(x1+300) && mouseY<=(y1+350)&&v3==true && v1<=7) {
    v1++;
    se = minim.loadFile("se.mp3"); // the event sound, only play when mouseclicked
    se.play();
  }

  if (v1>=7) {
    v3=false;
  }
  // the hp bar will decresae when mouseclicked emo(the blue character)
}



