
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/40283*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
PImage img0;
//integers

int keyX = 57;
int keyY = 425;

PImage b;
PImage c;
PImage d;
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioPlayer pop;



//setup

void setup(){
  size (628,591);
  noCursor();
 
  smooth();
  b = loadImage("meat.png");
  c = loadImage("grab.png");
  d = loadImage("grabbing.png");
 img0 = loadImage("above.png");
   m = new Minim(this);
  pop = m.loadFile("sizzle.wav");
}

float x = 0;
float y = 200;
float z = 100;
float fl = 255;



//draw loop

void draw(){
  background(img0);
   
  x = 240;
  y = 450;
  
 image (b, keyX,keyY);

  //if (mousePressed ==false){
  //image (c, mouseX-8, mouseY-8);
  //}
  //if (mousePressed ==true){
  //image(d, mouseX-8,mouseY-8);
  //}
 
  
  if (mousePressed == true && dist(mouseX,mouseY,keyX,keyY)<20){
    keyX=mouseX-10;
    keyY=mouseY-10;
  }
  
 
            //repeat hand functions so that they are on top, probably a cleaner way to do this...
        if (mousePressed ==false){
          image (c, mouseX-8, mouseY-8);
  }
  if (mousePressed ==true){
    image(d, mouseX-8,mouseY-8);
  }
  
  if (dist(mouseX,mouseY,x,y)<40){
    if (z <= 5){
    pop.loop(0);
    
    fl = 55;
    z = z + 100;}}
    
  if (z > 5){z = z * 0.9;}
  if (fl < 255){fl = fl + 5;}
}
    
        




