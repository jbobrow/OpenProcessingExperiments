
//variables\\
int CircleX = 200;
int CircleY = 200;
int CircleL = 380;
int CircleW = 380;
float R = random(255);
float G = random(255);
float B = random(255);
//variables\\

//setup\\
size (400,400);
background (255);
//setup\\

//execution\\
for (int counter = 0; counter < 20; counter = counter + 1) {
  fill(R,G,B);
  ellipseMode(CENTER);
  ellipse(CircleX,CircleY,CircleL,CircleW);
  R = random(255);
  G = random(255);
  B = random(255);
  CircleL = CircleL - 20;
  CircleW = CircleW - 20;
}
