
int radius = 70;
int i = 10;
int k = 12;
int velX = 1;
int velY = 1;
int width = 700;
int height = 700;

void setup () {
  size(width,height);
  background(0);
  frameRate(20);
  
  
}

void draw() {
  if (keyPressed == true) {
  fill(255);
  } else {
  fill(#239866,20);
  }
  noStroke();
  smooth ();
  fill (random( 0, 255), mouseY+k*42, random( 0, 255) , 60);
  ellipse (mouseX,mouseY,70,random(radius));
  
  i += velX;
  k += velY;
  
  fill( random( 0, 255), random( 0, 255), random( 0, 255), 60);
  //rect( random(i*velX), random(k*velY), 50, 50);
  rect( random(690*velX), random(650*velY), 50, 50);
  
}

