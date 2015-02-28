
import ddf.minim.*;

Minim minim;
AudioPlayer song;
float x;
float y;
float yspeed = 0;
float xspeed = 0;
int balldiameter = 10;
float ballradius = balldiameter/2;
float distance;
float space = 10;
float counter = 50;
float diameter = 5;
void setup() {
  size (400,400);
  

  ellipseMode(CENTER);
  smooth();
noStroke();
  x = width/2;
  y = height/2;
}
void draw(){

  
  mouseChecks();
  boundaryChecks();
  ballFunctions();
   

}

 
void mouseChecks() {
  if (mousePressed == true) {
    x = mouseX;
    y = mouseY;
    yspeed = mouseY - pmouseY;
    xspeed = mouseX - pmouseX;
  }
}
 
void boundaryChecks() {
  if (y >= height - ballradius) {
    y = height - ballradius;
    yspeed = -yspeed/1.15;
  }
  if (y <= ballradius) {
    y = ballradius;
    yspeed = -yspeed/1.35;
  }
  if (x >= width -ballradius) {
    x = width -ballradius;
    xspeed = -xspeed/1.10;
  }
  if (x <= ballradius) {
    x = ballradius;
    xspeed = -xspeed/1.10;
  }
}
 
void ballFunctions() {
  if (balldiameter < 2) {
    balldiameter = 2;
  }
  if (balldiameter > 400) {
    balldiameter = 400;
  }
  ballradius = balldiameter/2;
 background(0);
ellipse (x,y,balldiameter,balldiameter);
  for (float x = 0; x < 100; x = x + 1)
  {
    for (float y = 0; y < 150; y = y + 3)
    {
distance = dist(mouseX,mouseY,5,5);
    fill(255);
  
 
   
  
  
  
    if (distance< 100)
    {
      fill (250,243,28);
    }
    if (distance >100)
    {
      fill(168,47,245);
    }
    if (distance >200)
    {
      fill (113,56,2);
    }
    if (distance >300)
    {
      fill (5,77,21);
    }
  
      ellipse(x * counter, y *space , diameter, diameter);
  }
  }
   
  counter = counter + 0.2;
  

  if (counter > 100)
  {
    counter = 10;
  }
  
   
  
 yspeed = yspeed += 0.2;
  xspeed = xspeed/1.005;
  y = y + yspeed;
 x = x + xspeed;
}
void mouseMoved() {
  diameter = diameter + 10;
  if (diameter > 20){
    diameter= 10;
   
        
      
}
    
}



