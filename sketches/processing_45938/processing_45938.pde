


void setup() {
  size(800, 600);
  background (255, 127, 5);
  smooth();
  frameRate(6);
}



void draw() {

  //translate(0, -height/2);

  translate (random(width),random(height));

  float posX = (random(width));
  float posY = (random(height));
   strokeWeight (10);
  stroke (random(255),random(255),random(255),50);
  line (posX, posY, random(width), random(height));
  stroke (random(255),random(255),random(255),50);
  line (posX, posY, random(width), random(height));
  stroke (random(255),random(255),random(255),50);
  line (posX, posY, random(width), random(height));
  stroke (random(255),random(255),random(255),50);
  line (posX, posY, random(width), random(height));
  stroke (random(255),random(255),random(255),50);
  line (posX, posY, random(width), random(height));
    fill(0, 0, 0, 255);
  ellipse (posX, posY, 50, 50);
 
}


