
//Hao-Yun Mei
//Copyright_Hao-Yun Mei_Carnegie Mellon University

float x,y,wd,ht,easingCoefficient;

void setup()
{ size (400,400);
  x = width;
  y = height;
  wd = random(10,100);
  ht = random(10,100);
  easingCoefficient = 0.1;
  smooth();
  background(255);
  noStroke();
  frameRate(5);
  
}

void draw()
{
  
  fill(random(255),random(255), random(255), 150);
  rect(mouseX-30, mouseY-30, random(10,100), random(10,100));
 println(frameCount);
 
}
 //if(keyPressed) saveFrame ("hw3.jpg");


