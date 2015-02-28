
import ddf.minim.*;

PImage star;
Minim minim;
AudioSample machine;
float pi=3.14;
void setup(){
  size(800, 600);
  star = loadImage("earth.jpg");
  minim = new Minim(this);
  machine = minim.loadSample("space.wav");
  
}

void draw(){
  image(star, 0, 0, 800, 600);
  fill(56,130,131);
  stroke(#386783);
  if(mousePressed){
  beginShape();
  ellipse(300,100, 20, 20);
  rect(320,130,20,20,5);
  ellipse(300,200, 20, 20);
  rect(320,230,20,20,5);
  ellipse(300,300, 20, 20);
  rect(320,330,20,20,5);
  ellipse(300,400, 20, 20);
  rect(320,430,20,20,5);
  ellipse(300,500, 20, 20);
  endShape();
}
}

void keyPressed(){
  if( key == 's') machine.trigger();
  loop();
}

   


