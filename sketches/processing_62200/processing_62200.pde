
float x = 50;
float y = 50;
float geschwindigkeitX = random(1);
float geschwindigkeitY = random(25);

void setup() {
  size(500, 500);
  smooth();
  // frameRate(10);
}
void draw() {
  
  fill(random(255),random(255),random(255), 5);
 
  x = x + geschwindigkeitX;
  y = y + geschwindigkeitY;
  if ((x > width-50) || (x < 50)) {
    geschwindigkeitX = geschwindigkeitX * -1;
    geschwindigkeitX = geschwindigkeitX * random(0.9, 1.1);
  }
  noStroke();
  fill(mouseX, 0, 0, 20);
  ellipse(x, y, random(50), random(50));

  if ((y > height-50) || (y < 50)) {
    geschwindigkeitY = geschwindigkeitY * -1;
    geschwindigkeitY = geschwindigkeitY * random(0.9, 1.1);
  }
  noStroke();
  fill(0, 0, mouseY, 20);
  ellipse(x, y, random(50), random(50));
  
  println(x);
}



void mousePressed() {
  saveFrame("thumbnail.png");
}


