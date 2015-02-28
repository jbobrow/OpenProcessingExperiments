
// Welcome to Jason's Program
boolean qPressed, wPressed, ePressed, rPressed, uPressed, iPressed, oPressed;

void setup()
{
  size(800, 700);
  smooth();
  background(255);
  fill(random(0, 255), random(0, 255), random(0, 255));
}
void draw()
{
  text("Press Q for circles, Press W for squares, Press E for triangles, Press R for lines, Press T to change color of shapes, Press Y to stop script", 15,30);
  text("Press U to draw random cirlces, Press I to draw random squares, Press O to draw random lines, Press C or V to clear ( V to clear with color )",15,50);
  if (qPressed)
  {
    noStroke();
    ellipse(pmouseX, pmouseY, 20, 20);
  }
  if (wPressed)
  {
    noStroke();
    rect(pmouseX, pmouseY, 20, 20);
  }
  if (ePressed)
  {
    noStroke();
    triangle(pmouseX, pmouseY-15, pmouseX+10, pmouseY, pmouseX-10, pmouseY);
  }
  if (rPressed)
  {
    strokeWeight(2);
    stroke(random(0, 255), random(0, 255), random(0, 255));
    line(pmouseX-5, pmouseY+7, pmouseX+5, pmouseY-7);
  }
  if (uPressed)
  {
    noStroke();
    ellipse(random(0, 800), random(0, 700), 20, 20);
  }
  if (iPressed)
  {
    noStroke();
    rect(random(0, 800), random(0, 700), 20, 20);
  }
  if (oPressed)
  {
    strokeWeight(2);
    stroke(random(0, 255), random(0, 255), random(0, 255));
    line(random(0, 800), random(0, 700), random(0, 800), random(0, 700));
  }
}
void keyPressed()
{
  if (key == 'q')
  {
    qPressed=true;
    wPressed=ePressed=rPressed=false;
  }
  if (key == 'w')
  {
    wPressed=true;
    qPressed=ePressed=rPressed=false;
  }
  if (key == 'e')
  {
    ePressed=true;
    qPressed=wPressed=rPressed=false;
  }
  if (key == 'r')
  {
    rPressed=true;
    qPressed=wPressed=ePressed=false;
  }
  if (key == 't')
  {
    fill(random(0, 255), random(0, 255), random(0, 255));
  }
  if (key == 'v')
  {
    background(random(0, 255), random(0, 255), random(0, 255));
    qPressed=wPressed=ePressed=rPressed=uPressed=iPressed=oPressed=false;
  }
  if (key == 'c')
  {
    background(255);
    qPressed=wPressed=ePressed=rPressed=uPressed=iPressed=oPressed=false;
  }
  if (key == 'u')
  {
    uPressed=true;
    iPressed=oPressed=false;
  }
  if (key == 'i')
  {
    iPressed=true;
    uPressed=oPressed=false;
  }
  if (key == 'o')
  {
    oPressed=true;
    iPressed=uPressed=false;
  }
  if(key == 'y')
  {
    qPressed=wPressed=ePressed=rPressed=uPressed=iPressed=oPressed=false;
  }
}


