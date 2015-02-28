
import processing.pdf.*;
  
boolean recording;
PGraphicsPDF pdf;

//uses the spirograph code for inspiration
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;         
AudioPlayer mySound;

int freq = 220;
float amp = 0.2;
int samples = 20000; 

color[] Colores = new color[3];

void setup(){
  size(800,800,P3D);
  background (255);
  pdf = (PGraphicsPDF) createGraphics(width, height, PDF, "pause-resume.pdf");

  
  
  minim = new Minim(this);
   mySound = minim.loadFile("Celebration (Benny Benassi Edit Remix).mp3");   //  load your sound into Minum
  mySound.play();
  
  
  
  Colores[0] = color(249,230,0,70);
  Colores[1] = color(255,0,255,70);
  Colores[2] = color(0,249,255,70);
}

//set counters to track rotation
int i = 1; //primary rotation
int j = 1; //rotation at the radius

void draw(){
  noFill();
  
  pushMatrix();
    translate(mouseX,mouseY); 
    rotate(radians(i));          
    translate(100,0);             
      

     color colour =Colores[floor(random(0,3))];
     fill(colour);
    
    box(20,150+mySound.mix.get(0)*200,100);          //draw the ellipse
  popMatrix();
  
  
  j+=10;
  i++;

}
void keyPressed() {
     
if((key=='s')||(key=='S')) {
    saveFrame("####.pdf");
  }
 
}



