
int c = 100;
float a=50;
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


Minim m;
AudioPlayer soundwave;
  
void setup(){
  background (255);
  size(500,500);
  smooth();
  m = new Minim(this);
   soundwave = m.loadFile("firework4.wav");
   
 
}

void draw(){
  fill(255, 5);
  rect(-5, -5, width + 5, height + 5);

}

void mousePressed() {
  soundwave.rewind();
  soundwave.play();
  noStroke();
  fill(255,random(0,255),0, 200);
  a = random(25,75);
  ellipse(mouseX ,mouseY , c,c);
  triangle(mouseX-a,mouseY-a,mouseX+a, mouseY-a, mouseX, mouseY-a*4);
  triangle(mouseX+a,mouseY+a,mouseX-a, mouseY+a, mouseX, mouseY+a*4);
  triangle(mouseX-a,mouseY-a,mouseX-a, mouseY+a, mouseX-a*4, mouseY);
  triangle(mouseX+a,mouseY+a,mouseX+a, mouseY-a, mouseX+a*4, mouseY);
  triangle(mouseX-a,mouseY,mouseX, mouseY+a, mouseX-a*2, mouseY+a*2);
  triangle(mouseX+a,mouseY,mouseX, mouseY-a, mouseX+a*2, mouseY-a*2);
  triangle(mouseX-a,mouseY,mouseX, mouseY-a, mouseX-a*2, mouseY-a*2);
  triangle(mouseX+a,mouseY,mouseX, mouseY+a, mouseX+a*2, mouseY+a*2);
}

