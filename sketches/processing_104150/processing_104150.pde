
////GSwP 5.4 Track the Mouse
//
//void setup()
//{
//  size(480, 120);
//  fill(0, 102);
//  smooth();
//  noStroke();
//}
//
//void draw()
//{
//  ellipse(mouseX, mouseY, 9, 9);
//}

////GSwP 5.5 The Dot Follows You
//
//void setup()
//{
//  size(480, 120);
//  fill(0, 102);
//  smooth();
//  noStroke();
//}
//
//void draw()
//{
//  background(204);
//  ellipse(mouseX, mouseY, 9, 9);
//}

////GSwP 5.6 Draw Continuously
//
//void setup()
//{
//  size(480, 120);
//  strokeWeight(4);
//  stroke(0, 102);
//  smooth();
//}
//
//void draw()
//{
//  line(pmouseX, pmouseY, mouseX, mouseY);
//}

////GSwP 5.7 Set Thickness on the Fly
//
//void setup()
//{
//  size(480, 120);
//  smooth();
//  stroke(0, 102);
//}
//
//void draw()
//{
//  float weight = dist(mouseX, mouseY, pmouseX, pmouseY);
//  strokeWeight(weight);
//  line(pmouseX, pmouseY, mouseX, mouseY);
//}

////GSwP 5.8 Easing Does It
//
//float x;
//float easing = 0.1;
//
//void setup()
//{
//  size(480, 120);
//  smooth();
//}
//
//void draw()
//{
//  float targetX = mouseX;
//  x += (targetX - x) * easing;
//  ellipse(x, 40, 12, 12);
//  println(targetX + " : " + x);
//}

//GSwP 5.9 Smooth Lines with Easing

float x;
float y;
float px;
float py;
float easing = 0.3;

void setup()
{
  size(480, 120);
  smooth();
  stroke(0, 102);
}

void draw()
{
  float targetX = mouseX;
  x += (targetX - x) * easing;
  float targetY = mouseY;
  y += (targetY - y) * easing;
  float weight = dist(x, y, px, py);
  strokeWeight(weight);
  line(x, y, px, py);
  py = y;
  px = x;
}
