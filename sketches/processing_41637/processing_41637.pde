
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;

int total = 0;
float firework = 0.0;
float xincrement = 0.2;
float n=0;
float crack=0;

AudioPlayer[] play = new AudioPlayer[total];
 
void setup() {
 size(700, 400);
 background(255);
 smooth();
 
 m = new Minim (this); 
 
}
 
void draw(){
  
  fill(255,10);
  noStroke();
  rect(0, 0, 700, 400);
  stroke(0);
 
}
 
  
void mouseReleased() {
  
  if (mouseButton == LEFT) {
  stroke(0);
  
  crack=random(width/2+200,width/2+400);
  beginShape(LINES);
   
  for (int i= int(random(-width/2,width/2)) ; i<crack; i++) { 
  strokeWeight(random(1, 4));
    n = noise(firework)*(height);
    firework += xincrement;
    vertex(i, n);  
  }
  endShape();
 }
}

void mousePressed () {
  if (mouseButton == LEFT) {
  stroke(0);
  
  crack=random(width/2+200,width/2+400);
  beginShape(LINES);
   
  for (int i= int(random(-width/2,width/2)) ; i<crack; i++) { 
  strokeWeight(random(1, 4));
    n = noise(firework)*(height);
    firework += xincrement;
    vertex(i, n);
  }  
 } 
  //if(mouseButton == RIGHT) 
  //{
   total = total + 1;
   play = (AudioPlayer[])expand(play,total);
   play[total -1] = m.loadFile("21914__halleck__neck-crack.wav");
   play[total- 1].play(); 
 //}
}



