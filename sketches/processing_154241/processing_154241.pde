
float mouthSize;
float pacX;
float pacY;
float velocity;
float pacSize;
float x1, x2, x3;

void setup() {

  x1 = random(700);
  x2 = random(700);
  x3 = random(700);

  size(750, 750);
  background(0);
  mouthSize = PI/5;
  pacX = 100;
  pacY = height/2;
  velocity = 1;
  pacSize = 10;
}

void draw() {
  if (dist(mouseX, mouseY, pacX, pacY) < 100)
    println("You win!");

  if (pacX > 850)
    pacX = -100;

  pacX += velocity;
  pacY = height/2;

  background(0);

  //Here is a loop that draws 10 dots:
  stroke(255, 255, 255);
  strokeWeight (5) ;
  for (int dotX = 0; dotX <= 650; dotX += 75) {
  if (pacX < dotX ) point (dotX, height/2);
  }

  fill(210, 50, 50);
  stroke( 0, 0, 0);
  strokeWeight(1);
  arc(pacX, pacY, 50, 50, mouthSize, 2*PI-mouthSize);
}

