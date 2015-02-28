
PImage img;
float x;
float y;

void setup () {
  size(500, 375);
  background(0);
  img = loadImage ("Chloe.jpg");
  x = width/2;
  y = height/2;
}

void draw() {
  loadPixels();
  img.loadPixels();
  
  float newx = constrain(x + random(-20,20),0,width-1);
  float newy = constrain(y + random(-20,20),0,height-1);
  
  
  int midx = int((newx + x) / 2);
  int midy = int((newy + y) / 2);
  
  
  color c = img.pixels[(width-1-midx) + midy*img.width];
  
  
  stroke(c);
  strokeWeight(5);
  line(x,y,newx,newy);
  
  
  x = newx;
  y = newy;
}

