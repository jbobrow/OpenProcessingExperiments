
int circleY;
int circleX;
int vel;
int velX;
PFont font;
PFont font2;

void setup(){
  size(500,500);
  noStroke();
  smooth();
  
  circleY = 0;
  vel = 3;
  
  circleX = 0;
  velX = 2;
  
  font = loadFont("Arial-Black-48.vlw");
 font2 = loadFont("Palatino-Bold-48.vlw");
  
}

void draw() {
  background(255);
  
  fill(255,200,0);
  ellipse(circleX, circleY, 20, 20);
 
 circleY += vel; // same as circleY = circleY + vel
 circleX += velX; // same as circleY = circleY + vel

if ((circleY <0) || (circleY > height)){
 vel  = vel*-1; // meaning vel = -3

} 
  
  if((circleX < 0) || (circleX > width)) {
  velX *= -1;
}
  
  if(mousePressed) 
{
    background(velX);
    
  
  vel  = vel*-1;
  velX *= -1;
  fill(155,200,0);
  textFont(font, 32); 
    text("ERROR - EVACUATE", 150, 50);
    fill(55,20,0);
  textFont(font2, 32); 
    text("ERROR!#2648502493502534549562406", 0, 450);
}
}

