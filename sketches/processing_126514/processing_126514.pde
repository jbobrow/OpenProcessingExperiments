
PImage img; 
PFont f;
import ddf.minim.*;
AudioPlayer player;
Minim minim;


void setup() {
  size (1000,750);
  img = loadImage ("salita_con_neve.JPG");
  background(img);
  imageMode( CENTER); 

 f = createFont("Futura",40); 

minim = new Minim(this);
  player = minim.loadFile("Coldplay - Christmas Lights.mp3");
  player.play();
}


void draw() {
float posX=random(width);
float posY=random(height);
fill(random (255), random(255),random (255));
ellipse (posX,posY,random (0,10), random (0,10));

fill(255);
noStroke ();
ellipseMode(CENTER);
ellipse(width/2,height/2,60,60);
ellipse(width/2,485,100,160);
fill (0);
ellipse(490,370,6,6);
ellipse(510,370,6,6);
noStroke ();
fill(255,86,8);
triangle(500,377,500,387,525,383);
rectMode (CENTER);
fill(216,0,4);
rect(500,405,50,10);
rect(493,425,10,40);
rect(480,425,10,40);
strokeWeight (2);
stroke (0);
fill (0);
line(420,445,455,445);
line(545,445,580,445);
noStroke();
fill(255);
ellipse(420,445,15,15);
ellipse(580,445,15,15);
fill(216,0,4);
triangle(475,355,500,330,525,355);
ellipse(500,330,20,20);

textFont(f);
fill(0);
textAlign(CENTER);
text("MERRY CHRISTMAS TO YOU ALL!",width/2,650);
}







