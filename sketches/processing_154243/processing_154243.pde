
float mouthSize;
float pacX;
float pacY;
float velocity;
float x1, x2,x3;


void setup() {
  size(750, 750);
  background(0);
  mouthSize = PI/5;
  pacX = 100;
  pacY = height/2;
  x1 = random(700);
  x2 = random(700);
  x3 = random(700);
  velocity = 1;
  fill(255, 255, 0);
}

void draw() {

  if (dist(mouseX, mouseY, pacX, pacY) < 100)
    println("You win");

  if (pacX > width + 100)
    pacX = -100;

  println(dist(mouseX, mouseY, pacX, pacY));
  background(0);

  ellipse(x1, height/2, 40, 40);
  ellipse(x2, height/2, 40, 40);
  ellipse(x3, height/2, 40, 40);
  
  if (dist(x1, height/2, pacX, pacY) <100)
  x1 = 800;
  
  if (dist(x2, height/2, pacX, pacY) <100)
  x2 = 800;
  
  if (dist(x3, height/2, pacX, pacY) <100)
  x3 = 800;
  
  
  //here is a loop that draws ten dots:
  for (int dotX = 0; dotX <= 675; dotX += 75) {
    point(dotX, height/2);
  }

  pacX += velocity;
  arc(pacX, pacY, 200, 200, mouthSize, 2*PI - mouthSize);
}

