
//Eugene Liang, UserInput, CP1, Mods 16-17
//


/**
press mouse then:<br>
hold r for red ellipse<br>
hold b for blue ellipse<br>
hold g for green ellipse<br>
hold space for eraser<br>
hold q for reset<p>

try mixing colors to get other colors<br>
red and green makes orange<br>
red and blue makes purple<br>
etc<br>
have fun!
*/

void setup()
{
  size(500,500);
  background(255,255,255);
  frameRate(15);
}

void draw()
{
  if (mousePressed == true)
  {
    if (keyPressed == true && key == 'r')
  {
    ellipseRed();
  }
  if(keyPressed == true && key == 'b')
  {
    ellipseBlue();
  }
  if(keyPressed == true && key == 'g')
  {
    ellipseGreen();
  }
  if(keyPressed == true && key == ' ')
  {
    ellipseErase();
  }
  if(keyPressed == true && key == 'q')
  {
    Reset();
  }
  }
  
}



//ellipseReset
void Reset()
{
  background(255,255,255);
}


//ellipseErase
void ellipseErase()
{
  fill(255,255,255);
  noStroke();
  ellipse(mouseX,mouseY,50,50);
}


//ellipseBlue
void ellipseBlue()
{
  fill(0,0,255,75);
  noStroke();
  ellipse(mouseX,mouseY,50,50);
}


//ellipseRed
void ellipseRed()
{
  fill(255,0,0,75);
  noStroke();
  ellipse(mouseX,mouseY,50,50);
}


//ellipseGreen
void ellipseGreen()
{
  fill(0,255,0,75);
  noStroke();
  ellipse(mouseX,mouseY,50,50);
}
