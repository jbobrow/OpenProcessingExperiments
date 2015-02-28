
float x = 102;
float y = 3;
float z = 399;
float YY = 3;
void setup() {
  frameRate(32);
  size (500, 500);
  background(100);
  cursor(CROSS);
}

void draw() {
  strokeWeight(4);
  rectMode(CENTER);
  fill(0, 4);
  noStroke();
  rect(0, 0, 5000, 5000);
  noFill();
  stroke(146,166,237,40);
  rect(width/2, x, mouseX/1.2, mouseY/2.3, mouseX/3);
  x=x+y;

  if (x>=400||x<=100) {
    y=y*-1;
  }
  

  stroke(214,237,146,40);
  rect(width/2, z, mouseX/1.2, mouseY/2.4, mouseX);
  z = z+YY;
  if (z>=400||z<=100) {
    YY=YY*-1;
  }
}

