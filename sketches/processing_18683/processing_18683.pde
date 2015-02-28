
float posX=135;
float posY=135;


void setup() {
  size(250,250);
  smooth();
}

void draw() {
  frameRate(15);
  background(0);
  fill(random(255),random(255),random(255));
  bezier(posX,posY,random(height),random(width),random(height),random(width),random(height),random(width));
  
 
}


