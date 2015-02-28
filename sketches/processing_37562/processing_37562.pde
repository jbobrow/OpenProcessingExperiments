
//homework 5
//copyright Erica Gatts | September 2011 | Pittsburgh, PA 15214

float x, y, w;
color col, col2;

void setup()
{
  size(400, 400);
  smooth();
  background(random(256), random(256), random(256));
  x = width/2;
  y = height/2;
  w = width;
  col = color(random(256), random(256), random(256));
  col2 = color(random(256), random(256), random(256));
}

void draw()
{
  //while loop that makes a groovy rectangular pattern
  while (w > 0) 
  { 
    stroke(.25); 
    fill(random(256), random(256), random(256), random(50)); 
    rect(x, y, w, w); 
    w = w - 10;
    x = x - 10;
    y = y - 10;
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


                
                
