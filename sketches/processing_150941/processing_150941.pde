
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM Mirae
// ID: 201420064

import ddf.minim.*;

Minim minim;
AudioPlayer song;

float xoff;
float xPos = 0; 


void setup() {

  size(1280, 720, P3D);
  background(0);
  
  minim = new Minim (this);
  song = minim.loadFile("Waiting phase one.mp3");
  song.play ();
}

void draw() {

  float d = song.mix.level() * 250;
  float nc = noise(xoff)*width/2.5;
 

  for (int i = 1; i < width; i+=10) {
    for (int j = 1; j < height; j+=10) {
      pushMatrix();
      translate(i, j, 0);
      stroke(100);
      box(1,1 ,1 );
      popMatrix();
      xPos++;
    }
  }

  lights();
  for (int i = 30; i < width; i+=200) {
    for (int j = 60; j < height; j+=200) {
      pushMatrix();
      translate(i, j, -200);
      rotateX(radians(d));
      rotateY(radians(d));
      stroke(200,500,500);
      noFill();
      box(100, 100, 100);
      popMatrix();
   
    }
  }
  
   for (int i = 30; i < width; i+=200) {
    for (int j = 60; j < height; j+=200) {
      pushMatrix();
      translate(i, j, -200);
      rotateX(radians(d));
      rotateY(radians(d));
      stroke(200,500,300);
      noFill();
      box(30, 30, 30);
      popMatrix();
   
    }
  }
  
}
void keyPressed() {
  if (key=='s') saveFrame("Images/"+hour()+minute()+"_####.jpg");
  if (keyCode==SHIFT){
  background(0);
  }
 
}

