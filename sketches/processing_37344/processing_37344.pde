
//homework 5
//copyright: Erica Gatts | September 2011 | Pittsburgh, PA
//"The Fading Bar Code"

float x = 10;
float y = 100;
float y2 = 300;
float space = 5;
float end = 395;
color col = color(random(256), random(256), random(256));
color col2 = color(random(256), random(256), random(256));

void setup()
{
  size(400, 400);
  background(255);
  smooth();
  stroke(random(256), random(256), random(256));
  strokeWeight(3);
  strokeCap(ROUND);
  fill(0);
}

void draw()
  {
  //while loop to draw a series of lines left to right
  //and stops 5 px before edge of screen
  while (x < end)
  {
    line(x, y, x, y2);
    x = x + space;
  }
  //press up arrow to draw translucent rectangle 
  //of random color on top of lines
  if (keyCode == UP)
  {
    col = col;
    noStroke();
    fill(col, 2);
    rect(0, 0, width, height);
  }
  if (keyCode == DOWN && col == col)
  //press down arrow to draw another translucent rectangle 
  //of random color on top of lines
  {
    col = col2;
    noStroke();
    fill(col2, 2);
    rect(0, 0, width, height);
  }
  //saveFrame("hmwk_5.jpg");
}


