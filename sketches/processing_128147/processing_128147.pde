
/*@pjs preload="appleW.png";*/

PImage img;
int eSize = 3;
int c;
int x, y;

void setup(){
  img=loadImage("appleW.png");
  size(450,450);
  background(255);
  fill(0,100,150);
  smooth();
  
  for(int y = 0; y <= height; y +=10){     
  for(int x = 0; x <= width; x += 10){  
    ellipse(x, y, eSize, eSize);
  }
}

  c = 0;
  x = width/2;
  y = height/2;
}

void draw(){

  image(img, 160,160);
  
  tint(c);
}

void mouseMoved() {
  c += 1;
  if(c > 255) {  
    c = 255;
  }
}
 
void mouseDragged() {  
  c -= 1;
  if(c <0) {  
    c = 0;
  }
}


