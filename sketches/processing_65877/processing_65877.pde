
/*int planeY;
int c1;
int c2;
int c3;
int c4;
int c5;
void setup()
{
  planeY=50;
  c1 = 100;
  c2 = 305;
  c3 = 520;
  c4 = 821;
  c5 = 987;
  size(300, 100);
}
void draw()
{
  background(50, 150, 255);
  if (keyPressed)
  {
    if (key == 's')
    {
      if (planeY<92)
        planeY = planeY+1;
    }
  }
  if (keyPressed)
  {
    if (key == 'w')
    {
      if (planeY>7)
      {
        planeY = planeY-1;
      }
    }
  }
  noStroke();
  fill(255);
  ellipse(c1, 50, 80, 50);
  ellipse(c2, 83, 80, 50);
  ellipse(c3, 62, 100, 60);
  ellipse(c4, 70, 80, 50);
  ellipse(c5, 70, 80, 50);
  ellipse(c1+1000, 50, 80, 50);
  ellipse(c2+1000, 83, 80, 50);
  ellipse(c3+1000, 62, 100, 60);
  ellipse(c4+1000, 70, 80, 50);
  ellipse(c5+1000, 70, 80, 50);
  ellipse(c1+2000, 50, 80, 50);
  ellipse(c2+2000, 83, 80, 50);
  ellipse(c3+2000, 62, 100, 60);
  ellipse(c4+2000, 70, 80, 50);
  ellipse(c5+2000, 70, 80, 50);
  ellipse(c1+3000, 50, 80, 50);
  ellipse(c2+3000, 83, 80, 50);
  ellipse(c3+3000, 62, 100, 60);
  ellipse(c4+3000, 70, 80, 50);
  ellipse(c5+3000, 70, 80, 50);
  ellipse(c1+4000, 50, 80, 50);
  ellipse(c2+4000, 83, 80, 50);
  ellipse(c3+4000, 62, 100, 60);
  ellipse(c4+4000, 70, 80, 50);
  ellipse(c5+4000, 70, 80, 50);
  //Airplane
  fill(255);
  noStroke();
  triangle(110, planeY, 110, planeY-10, 130, planeY);
  triangle(115, planeY, 115, planeY-10, 135, planeY);
  rectMode(CORNER);
  rect(110, planeY-10, 10, 10);
  ellipse(150, planeY, 80, 13);
  stroke(0, 0, 0);
  fill(245);
  ellipse(160, planeY, 35, 5);
  ellipse(120, planeY-2, 17, 3);
  noFill();
  ellipse(150, planeY, 80, 13);
  line(110, planeY, 110, planeY-10);
  line(110, planeY-10, 119, planeY-10);
  line(119, planeY-10, 123, planeY-5);
  c1 = c1 - 3;
  c2 = c2 - 3;
  c3 = c3 - 3;
  c4 = c4 - 3;
  c5 = c5 - 3;
}
Code *2 Below
*/
PFont font;
int planeY;
int c1;
int c2;
int c3;
int c4;
int c5;
float jitter;
void setup()
{
  font = createFont("FFScala", 20);
  textFont(font);
  strokeWeight(2);
  noSmooth();
  planeY=100;
  c1 = 200;
  c2 = 610;
  c3 = 1040;
  c4 = 1642;
  c5 = 1974;
  size(600, 200);
}
void draw()
{
  background(50, 150, 255);
  jitter=random(258,262);
  if (keyPressed)
  {
    if (key == 's')
    {
      if (planeY<184)
        planeY = planeY+2;
    }
  }
  if (keyPressed)
  {
    if (key == 'w')
    {
      if (planeY>14)
      {
        planeY = planeY-2;
      }
    }
  }
  text("Yay!!!",jitter,planeY+3);
  if(c5+8000 >= 300)
  {
  noStroke();
  fill(255);
  ellipse(c1, 100, 160, 100);
  ellipse(c2, 166, 160, 100);
  ellipse(c3, 124, 200, 120);
  ellipse(c4, 140, 160, 100);
  ellipse(c5, 140, 160, 100);
  ellipse(c1+2000, 100, 160, 100);
  ellipse(c2+2000, 166, 160, 100);
  ellipse(c3+2000, 124, 200, 120);
  ellipse(c4+2000, 140, 160, 100);
  ellipse(c5+2000, 140, 160, 100);
  ellipse(c1+4000, 100, 160, 100);
  ellipse(c2+4000, 166, 160, 100);
  ellipse(c3+4000, 124, 200, 120);
  ellipse(c4+4000, 140, 160, 100);
  ellipse(c5+4000, 140, 160, 100);
  ellipse(c1+6000, 100, 160, 100);
  ellipse(c2+6000, 166, 160, 100);
  ellipse(c3+6000, 124, 200, 120);
  ellipse(c4+6000, 140, 160, 100);
  ellipse(c5+6000, 140, 160, 100);
  ellipse(c1+8000, 100, 160, 100);
  ellipse(c2+8000, 166, 160, 100);
  ellipse(c3+8000, 124, 200, 120);
  ellipse(c4+8000, 140, 160, 100);
  ellipse(c5+8000, 140, 160, 100);
  //Airplane
  triangle(220, planeY, 220, planeY-20, 260, planeY);
  triangle(230, planeY, 230, planeY-20, 270, planeY);
  rectMode(CORNER);
  rect(220, planeY-20, 20, 20);
  ellipse(300, planeY, 160, 26);
  stroke(0, 0, 0);
  fill(235);
  ellipse(310, planeY, 70, 10);
  ellipse(240, planeY-2, 34, 6);
  noFill();
  ellipse(300, planeY, 160, 26);
  line(220, planeY, 220, planeY-20);
  line(220, planeY-20, 238, planeY-20);
  line(238, planeY-20, 247, planeY-11);
  c1 = c1 - 6;
  c2 = c2 - 6;
  c3 = c3 - 6;
  c4 = c4 - 6;
  c5 = c5 - 6;
  }
  else
  {
    planeY=100;
}
}
void stop()
{
}

