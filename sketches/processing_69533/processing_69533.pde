
//WillS Comp. Prog. 1 Simple Animation
int x=10;
void setup()
{
  size(500, 500);
  smooth();
}
void draw()
{
  stars();
  rocketShip();
}
void stars()
{
  noStroke();
  fill(255);
  background(0);
  ellipse(50, 50, 10, 10);
  ellipse(100, 470, 8, 8);
  ellipse(290, 315, 7, 7);
  ellipse(420, 100, 11, 11);
  ellipse(10, 340, 6, 6);
  ellipse(470, 400, 8, 8);
  ellipse(160, 90, 7, 7);
  ellipse(310, 430, 10, 10);
  ellipse(65, 170, 9, 9);
  ellipse(160, 380, 6, 6);
  ellipse(300, 30, 7, 7);
  ellipse(280, 180, 9, 9);
  ellipse(160, 240, 8, 8);
  ellipse(440, 265, 6, 6);
}
void rocketShip()
{
  if(x>600)
  {
    x=0;
  }
  stroke(0);
  x=x+3;
  fill(214, 214, 214);
  beginShape();
  vertex(x, 240);
  vertex(x+30, 240);
  vertex(x+30, 260);
  vertex(x, 260);
  endShape(CLOSE);
  triangle(x+30, 240, x+30, 260, x+60, 250);
  fill(32, 224, 222);
  ellipse(x+32, 250, 11, 11);
  noStroke();
  fill(250, 100, 25);
  triangle(x, 240, x, 260, x-22, 265);
  triangle(x, 240, x, 260, x-22, 235);
  triangle(x, 240, x, 260, x-30, 250);
  stroke(0);
  fill(126, 6, 8);
  triangle(x, 240, x+25, 240, x-10, 225);
  triangle(x, 260, x+25, 260, x-10, 275);
  noStroke();
  fill(209, 6, 6);
  triangle(x, 255, x, 245, x-20, 250);
  triangle(x, 255, x, 245, x-15, 260);
  triangle(x, 255, x, 245, x-15, 240);
  fill(0);
  ellipse(x+8, 250, 3, 3);
  ellipse(x+18, 250, 3, 3);
}
