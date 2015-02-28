
//Wenda Lewis Teh
//WK11 Assignment

float rotation = 0;
float a;

void setup() {
  size(600, 600);
  background(255);
}

void draw() {
  pushMatrix();
  stroke(255);
  translate(300, 300);
  rotate(radians(rotation));
  fill(200, 120, map(second(), 0, 59, 0, 255), 60);
  a = map(second(), 0, 59, 0, width/3.5); 
  rect(-15 +a, -15 +a, 30, 30);
  rect(0 +a, 0 +a, 30, 30);
  rotation -= 10;
  popMatrix();
}



