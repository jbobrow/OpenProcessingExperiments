
/*
Daniel Li
 3rd Period
 9/9/11
 
 -  Press 'Left'/'Right' Click to draw
 -  Use '1', '2', '3' to change colors
 -  Press 'CTRL' to draw random triangles
 -  Press 'SHIFT' to draw squares (random sizes) 
 based on mouse position
 -  Press 'BACKSPACE' to clear drawing
 -  Press '4' to erase
 
 */
boolean triangle1, rect1, backgroundClear;
float x1, y1;

void setup()
{
  background(255);
  size(1000, 750);
  smooth();
  triangle1=rect1=backgroundClear=false;
}

void keyPressed()
{
  if (keyCode == CONTROL) triangle1 = true;
  if (keyCode == BACKSPACE) backgroundClear = true;
  if (keyCode == SHIFT) rect1=true;
}

void keyReleased()
{
  if (keyCode == CONTROL) triangle1 = false;
  if (keyCode == BACKSPACE) backgroundClear = false;
  if (keyCode== SHIFT) rect1=false;
}

void draw()
{

  color black = color(0);
  color white = color(255);
  color black1 = color(0);
  color white1 = color(255);

  if (key == '1')
  {
    black = color(255);
    white = color(0);
  }

  if (key == '2')
  {
    black = color(0);
    white = color(255);
  }

  if (key == '3')
  {
    black = color(random(0, 255), random(0, 255), random(0, 255));
    white = color(random(0, 255), random(0, 255), random(0, 255));
  }

  if (key == '4')
  {
    noStroke();
    fill(255);
    ellipse(mouseX,mouseY,75,75);
  }


  if (triangle1) 
  {
    noStroke();
    fill(random(0, 255), random(0, 255), random(0, 255), random(25, 100));
    triangle(mouseX+random(-50, 100), mouseY+random(-50, 100), mouseX+random(-50, 100), mouseY+random(-50, 100), mouseX+random(-50, 100), mouseY+random(-50, 100));
  } 
  if (rect1) 
  {
    stroke(black);
    fill(white);
    rect(mouseX, mouseY, random(7, 25), random(7, 25));
  } 

  if (backgroundClear) 
  {
    background(255);
  }

  if (mousePressed && (mouseButton == LEFT))
  { 
    stroke(white1);
    fill(black, random(25, 100));
    ellipse(mouseX, mouseY, random(10, 100), random(20, 75));
  }

  if (mousePressed && (mouseButton == RIGHT))
  {
    stroke(black1);
    fill(white, random(25, 100));
    ellipse(mouseX, mouseY, random(10, 100), random(20, 75));
  }

  ellipse(random(0, 1000), random(0, 750), 30, 30);
}


