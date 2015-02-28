
/*
 * Sketch Board
 */
float s=25;
float r=random(225), g=random(225), b=random(225);
boolean mouseRight=false, mouseLeft=false;


void setup()
{
  size(800, 800);
  noStroke();
  smooth();
  background(random(255), random(255), random(255));
}

void draw()
{
  changefill();
  grow();
  fill(r, g, b);
  ///////////////////////////////shape produced//////////////////////////////////////
  if (mouseRight) rect(mouseX-s/2, mouseY-s/2, s*1.5, s*1.5);

  else ellipse(mouseX, mouseY, s, s);

  //////////////////////////////////pop out//////////////////////////////////////////
  if (mouseLeft)
  {
    if (mouseRight)
    {
      fill(random(255), random(255), random(255));
      rect (mouseX-random(50), mouseY-random(50), s/2, s/2);

      fill(random(255), random(255), random(255));
      rect (mouseX+random(50), mouseY-random(50), s/2, s/2);

      fill(random(255), random(255), random(255));
      rect (mouseX-random(50), mouseY+random(50), s/2, s/2);

      fill(random(255), random(255), random(255));
      rect (mouseX+random(50), mouseY+random(50), s/2, s/2);
    }
    else 
    {
      fill(random(255), random(255), random(255));
      ellipse (mouseX-random(50), mouseY-random(50), s/2, s/2);

      fill(random(255), random(255), random(255));
      ellipse (mouseX+random(50), mouseY-random(50), s/2, s/2);

      fill(random(255), random(255), random(255));
      ellipse (mouseX-random(50), mouseY+random(50), s/2, s/2);

      fill(random(255), random(255), random(255));
      ellipse (mouseX+random(50), mouseY+random(50), s/2, s/2);
    }
  }
  /////////////////////////////////draw instruction box///////////////////////////////////////
  instructions();
}
//////////////////////////////////space bar to change background color////////////////////////
void keyPressed()
{
  if (key ==' ') background(random(255), random(255), random(255));
}
///////////////////////////////////////////////////////////////////////////////////////////////
void mousePressed()
{
  ///////////////////////////////////right click///////////////////////////////////
  if (mouseButton == RIGHT)
  {
    if (mouseRight) mouseRight=false;

    else mouseRight=true;
  }
  /////////////////////////////////left click///////////////////////////////////
  if (mouseButton == LEFT) mouseLeft=true;

}

void mouseReleased()
{
  if (mouseButton == LEFT) mouseLeft=false;
}


void changefill()
{
  ////////////////////////////////////red//////////////////////////////////////////
  if (mouseX < 400 && mouseY < 400) r=r+10;

  ///////////////////////////////////green//////////////////////////////////////////
  if (mouseX > 400 && mouseY < 400) g=g+10;

  ////////////////////////////////blue//////////////////////////////////////////////
  if (mouseX < 400 && mouseY > 400) b=b+10;

  println( r + "," + g + "," + b);
  println( mouseX +"," + mouseY);

  ////////////////////////////////all three colors//////////////////////////////////
  if (mouseX > 400 && mouseY > 400)
  {
    r=r+10;
    g=g+10;
    b=b+10;
  }
  /////////////////////////////////reset colors//////////////////////////////////////
  if (r > 255) r = random(225);
  if (g > 255) g = random(225);
  if (b > 255) b = random(225);
}
//////////////////////////////////size/////////////////////////////////////////////
void grow()
{
  s = random(20);
}
//////////////////////////////////instructions////////////////////////////////////
void instructions()
{
  fill(255);
  rect(0, 700, 800, 100); 
  fill(0);
  text("Press SPACEBAR to clear screen and change color of background.", 50, 725);
  text("Right click to change shape.", 50, 750);
  text("Left click to see shapes pop out.", 50, 775);
}


