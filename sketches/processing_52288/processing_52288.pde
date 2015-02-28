
import ddf.minim.*;

float centerAngle;
float centerDiam; // central pillar

float carDiam;   // ride pods (the faces) that rotate around the center 
float carAngle;
float carCycle;

Minim minim;
AudioPlayer player; 

PImage img1;
PImage img2;
PImage img3;
PImage img4;

void setup() {
  size(800, 800);
  minim = new Minim(this);
  player = minim.loadFile("bennyhill.mp3");
  centerAngle= 0; 
  centerDiam= 60;
  carDiam = 30;
  carAngle= 0;
  carCycle= 200;
  img1 = loadImage("Immortal2.png");
  img2 = loadImage("Immortal3.png");
  img3= loadImage("immortal4.png");
  img4= loadImage("varg.png");
}

void draw() {
  background(200, 0, 200);
  translate(width/2, height/2);
  noStroke();
  
  fill(255, 255, 0);
  ellipse( 0, 0, centerDiam, centerDiam); //rides center pillar

  
  rotate(carAngle);
  
  translate(carCycle, 0);
  
 // fill(0, 255, 255);
 // ellipse(0, 0, carDiam, carDiam);
  image(img1, 0, 0);
  
  image(img2, -250, -300);
 // fill(0, 255, 255);
 // ellipse( -200, -200, carDiam, carDiam);
  
  image(img3, -250, 150);
 // fill(0, 255, 255);
 // ellipse (-200, 300, carDiam, carDiam);
  
  image(img1, -500, 0);
  //fill(0, 255, 255);
  //ellipse(-400, 0, carDiam, carDiam);
}

void mouseMoved(){
  carAngle += 0.1;
  player.play();
}


    


