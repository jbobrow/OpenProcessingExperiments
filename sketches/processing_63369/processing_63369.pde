
float x = 40;
float y = 40;
float change = 1;
float geschwindigkeit = 1.09;
  
void setup() {
  size(600, 600);
  background(152,206,187);
  smooth();
}


void draw() {
  x= x+change * mouseY * 0.1;
  y = y*geschwindigkeit;

  
  if ((y >= height) || (y <= 1)) {
    geschwindigkeit=1/geschwindigkeit;
  }
  
  if ((x >= width) || (x <= 4)) {
    change =-change;  
  }
  
  stroke(255);
  noFill();
  ellipse(x, y,400,400);

}


void mousePressed() {
  fill(152,206,187);
  rect(0,0,width,height);
 }

