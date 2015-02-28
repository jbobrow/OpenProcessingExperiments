
void setup(){
  
  size(400, 400);
  smooth();
  background (255);
  colorMode (RGB);
  frameRate (1000);
}


float x = -255;
float y = 50;


void draw(){
  
  println("x = " + x);  
  println("y = " + y);
}

void mouseDragged (){
  
  x++;
  y=y-(0.25);
  while (y<0) {
    y = 0;
  }

  fill (abs(x)*2, abs(x), abs(x));
  ellipse (mouseX, mouseY, y, y);
}


void mouseReleased (){
  
  x = -255;
  y = 50;
}
