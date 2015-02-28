
float x = 40;
float y = 40;
float change = 1;
float geschwindigkeit = 1.09;
float colR = mouseY;
float rad = 60;
 
void setup() {
  size(800, 600);
  smooth();
  colorMode(RGB,600,255,255);
}
void draw() {
 
  fill(460,200,200,40);
  rect(0,0,width,height);
  x= x+change * mouseY*0.1;
  y = y*geschwindigkeit;
 
  if ((y >= height) || (y <= 1)) {
    geschwindigkeit=1/geschwindigkeit;
  }
 
  if ((x >= width) || (x <= 4)) {
    change =-change;
    
  }
  colR = mouseY;
  // Display circle at x location
  noStroke();
  fill(colR,20,60);
  ellipse(x, y, rad, rad);
}

void mousePressed() {
rad = rad*1.2; 
}

void keyPressed() {
rad= 30;
}

