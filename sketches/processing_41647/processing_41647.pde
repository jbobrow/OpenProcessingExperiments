
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


Minim yehbro;
AudioPlayer beep;

PImage b;

int hasmouseP = 0;
float xpos;
float ypos;

void setup() {
  size(700,400);
  frameRate(50);

  yehbro = new Minim(this);
  beep = yehbro.loadFile("pitchchange.wav");
  smooth();
   
  b = loadImage("data/gradient.jpg");
  
  
}

void draw() {
  //background(255,255,255);

  //GRADIENT
  image(b, 0, -650);  
  
  
  
  //bALL AND LINE
  strokeWeight(2);
  stroke(0,0,0);
  fill(0,0,0);
  //ellipse(350, ypos, 25, 25);
  line(0, ypos, 700, ypos);
  
  if(ypos > 400){
   hasmouseP = 0; 
    
  }
  
  if(hasmouseP == 0){
   xpos = mouseX;
   ypos = mouseY;    
   beep.rewind();
   beep.pause();
  
  }
  else{
    ypos = ypos + 2;
    beep.play();
    
  }
     if(mouseButton == RIGHT){
      hasmouseP = 0; 
     }
}
void mousePressed() {
 hasmouseP = 1; 
 
}

void mouseReleased() {
 // hasmouseP = 0;
}

  
  




