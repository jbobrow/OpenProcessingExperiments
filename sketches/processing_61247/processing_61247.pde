
float x = 40;
float y = 40;
float change = 1;
float geschwindigkeit = 1.09;
float colorBall = 255;

  
void setup() {
  size(600, 600);
  smooth();
}


void draw() {
  background(152,206,187);
  x= x+change * mouseY * 0.1;
  y = y*geschwindigkeit;

  
  if ((y >= height) || (y <= 1)) {
    geschwindigkeit=1/geschwindigkeit;
  }
  
  if ((x >= width) || (x <= 4)) {
    change =-change;  
  }
  
  noStroke();
  fill(colorBall);
  ellipse(x, y, 50,50);

}


void mousePressed() {
  colorBall = random(255);
 }

