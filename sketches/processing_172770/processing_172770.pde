
//variables\\
int CircleX = 200;
int CircleY = 200;
int CircleL = 380;
int CircleW = 380;
float R = 255;
float G = 255;
float B = 255;
float rate = 13.46;
//variables\\

//setup\\
size (400,400);
background (255);
//setup\\

//execution\\
for (int counter = 0; counter < 20; counter = counter + 1) {
  fill(R,G,B);
  stroke(R,G,B);
  ellipseMode(CENTER);
  ellipse(CircleX,CircleY,CircleL,CircleW);
  R = R - rate;
  G = G - rate;
  B = B - rate;
  CircleL = CircleL - 20;
  CircleW = CircleW - 20;
}
//execution\\
