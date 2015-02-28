
int xspeed = 24;
int yspeed = 12;
int radius = 25;
int xPosition = radius;
int yPosition = radius;

void setup() { 
  size(500,500);
  background(245,230,250);
}

void draw() {

  
  
  stroke(200,190,190);
  fill(random(255), random(255), random(255), 100);
  float radius = random (55);
  ellipse (xPosition,yPosition,radius*2,radius*2);
  xPosition = xPosition + xspeed;
  
  yPosition = yPosition + yspeed;
  
  if (xPosition > width-radius || xPosition < radius) {
   xspeed = xspeed * -1;
  } 
  if (yPosition > height-radius || yPosition< radius) {
    yspeed = yspeed *-1;
  }
  
}
                
                                                
