
// Tommy Wong
// Based on http://processing.org/learning/topics/linear.html

// Colour Palete
// 127, 116, 0 7F7400
// 191, 175, 0 BFAF00
// 255, 255, 0 FFE900 SL Yellow
// 64, 58, 0 403A00
// 229, 210, 0 E5D200

float a = 100;
float b = 100;

void setup() 
{
  size(400, 400);
  stroke(#FFFFFF);
}

void draw() 
{
  background(#FFE900);
  a = a - 0.25;
  if (a < 0) { 
    a = height; 
  }
  line(0, a, width, a);
  fill(#E5D200);
  ellipse(5, a, 10, 10);
  fill(#E5D200);
  ellipse(17.5, a, 15, 15);
  fill(#BFAF00);
  ellipse(35, a, 20, 20);
  fill(#BFAF00);
  ellipse(57.5, a, 25, 25);
  fill(#7F7400);
  ellipse(85, a, 30, 30);
  fill(#7F7400);
  ellipse(117.5, a, 35, 35);
  fill(#7F7400);
  ellipse(155, a, 40, 40);
  fill(#403A00);
  ellipse(200, a, 50, 50);
  fill(#7F7400);
  ellipse(245, a, 40, 40);
  fill(#7F7400);
  ellipse(282.5, a, 35, 35);
  fill(#7F7400);
  ellipse(315, a, 30, 30);
  fill(#BFAF00);
  ellipse(342.5, a, 25, 25);
  fill(#BFAF00);
  ellipse(365, a, 20, 20);
  fill(#E5D200);
  ellipse(382.5, a, 15, 15);
  fill(#E5D200);
  ellipse(395, a, 10, 10);
}



