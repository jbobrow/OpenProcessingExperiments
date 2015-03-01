
//variables\\
int CircleX = 200;
int CircleY = 200;
float CircleL = 380;
float CircleW = 380;
float Transparency = 0;
float rate = 5;
//variables\\

//setup\\
size (400,400);
background (255);
//setup\\

//execution\\
for (int counter = 0; counter < 80; counter = counter + 1) {
  fill(0,0,0,Transparency);
  stroke(0,0,0,Transparency);
  ellipse(CircleX,CircleY,CircleL,CircleW);
  CircleL = CircleL - rate;
  CircleW = CircleW - rate;
  Transparency = Transparency + 0.2;
}
//execution\\
