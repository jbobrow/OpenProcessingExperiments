
//CClab homework Week 2
//Aneta Genova
//original source: http://libraries.seltar.org/motion/



import seltar.motion.*;
Motion Pendel;

void setup()
{
  size(800,800);  
  Pendel = new Motion(width/8,height/8);
  Pendel.setDamping(0.99);
  smooth();
}

void draw()
{
  if(!mousePressed) background(255);  
  stroke(150);
  fill(255);
  Pendel.springTo(mouseX,mouseY);
  Pendel.move();
  
  line(mouseX,mouseY,Pendel.getX(),Pendel.getY());
  ellipse(Pendel.getX(),Pendel.getY(),250+Pendel.getDistance(),250+Pendel.getDistance());
}

