
// Samantha Ticknor
//sticknor
//copyright 2013

float diam, x, y, flame;
PImage stars;

void setup()
{
 size(400, 400);
 diam = 20;
 flame = 1;
 stars = loadImage("stars.jpg");
}


void draw()
{
 background(stars);
 frameRate(20);
 drawRocket(diam, mouseX, mouseY, flame);
 if (flame == 1) {flame = 2;}
 else {flame = 1;}
 
}


void drawRocket(float diam, float x, float y, float flame){
  noStroke();
  fill(222, 222, 222);
  triangle(x, y, x-diam, y+2*diam, x+diam, y+2*diam);
  fill(11, 52, 40);
  ellipse(x, y+diam, .7*diam, .7*diam);
  fill(179, 203, 196);
  ellipse(x, y+diam, .5*diam, .5*diam);
  if (flame == 1){
    fill(255, 230, 103);
    triangle(x-.5*diam, y+2*diam, x-.5*diam, y+2.5*diam, x+.5*diam, y+2*diam);
    triangle(x-.5*diam, y+2*diam, x+.5*diam, y+2.5*diam, x+.5*diam, y+2*diam);
  }
  fill(255, 158, 54);
  triangle(x-.5*diam, y+2*diam, x+.5*diam, y+2*diam, x, y+2.5*diam); 
}

void mouseClicked(){
  if (diam < 40){diam = diam+2;}
}

void keyPressed(){
  if (key == 's'){
    if (diam > 20){diam = diam-2;}
  }
}

