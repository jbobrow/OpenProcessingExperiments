
float mouthSize;
float pacX;
float pacY;
float velocity;
float pacsize;
float x1, x2, x3;


void setup() {
  size(750, 750);
  background(0);
  mouthSize = PI/6;
  pacX = 100;
  pacY = height/2;
  x1 = random(700);
  x2 = random(700);
  x3 = random(700);
  velocity = 10;
  
}

void draw() {
  if  (dist(mouseX, mouseY, pacX, pacY) < 100)
  println("you win");
  if (pacX > width +100)
  pacX = -100;
  background (0);
  int s = second(); 
  int m = minute();  
  fill(255);
  ellipse(x1, height/2, 40, 40);
  ellipse(x2, height/2, 40, 40);
  ellipse(x3, height/2, 40, 40);
  stroke(255); 
  strokeWeight(5);
  for (int dotX = 0; dotX <= 075; dotX += 75)
  point(dotX, height/2);
  pacX += velocity;
  fill(255, 255, 0);
  arc(pacX, pacY, 200, 200, mouthSize, 2*PI - mouthSize);
}
