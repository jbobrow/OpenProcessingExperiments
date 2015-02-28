
/*@pjs preload="test.png";*/
int eSize;  
int x, y;  
int c;
PImage img;


void setup() {
  size(400, 400);
  noStroke();
  smooth();
  fill(0);
  img = loadImage("test.png");
  img = loadImage("test.png");
  img = loadImage("test.png");
  img = loadImage("test.png");

  
  eSize = 80; 
  c = 0;
  x = width/2;
  y = height/2;
  
 
}

void draw() {
  background(255);
  fill(c);
  ellipse(x, y, eSize, eSize);
}

void mouseMoved() {
  c += 1;
  if (c > 150) {
    c = 150;
    image(img, 0, 0);

    tint(0, 153, 0);     
    image(img, 0, 0);     

    tint(0, 0, 255, 127);     
    image(img, 200, 250, 150, 150);
    image(img, 0, 0);

    tint(0, 153, 0);     
    image(img, 0, 0);     

    tint(0, 0, 255, 127);     
    image(img, 100, 10, 150, 150);
    image(img, 0, 0);

    tint(0, 153, 0);     
    image(img, 0, 0);     

    tint(0, 0, 255, 127);     
    image(img, 100, 250, 150, 150);
    image(img, 0, 0);

    tint(0, 153, 0);     
    image(img, 0, 0);     

    tint(0, 0, 255, 127);     
    image(img, 200, 10, 150, 150);
    
   
  }
} 

void mousePressed() {  
  eSize = 200;
  fill(0);
    for(int y = 0; y <= height; y +=10){      
  for(int x = 0; x <= width; x += 10){   
    line(x, y, eSize, eSize);
  }
}
}

void mouseReleased() { 
  c -= 255;
  if (c <0) {
    c = 0;
  }
  eSize = 80;
}




