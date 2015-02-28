
//Ara Lee
//aral
//copyright Ara Lee, September 2013, Pittsburgh, PA
//hw4
//257

//float x,y,wd,ht,i,a;

void setup()
{
  size(400,400);
  background(255);
  textSize(24);
}

void draw()
{
  if (mousePressed) //draw with ellipses
  {
    ellipse(mouseX,mouseY,2*(30+pmouseX-mouseX+.3*mouseY),2*(30+pmouseY-mouseY+.3*mouseX));
    fill(random(255),random(255),random(255),10);
  }
  else
  {
    fill(255,255,255,10);
    rect(0,0,400,400);
  }
}

void keyPressed()
{
  if (key==' ')
  {
    //background(200);
    fill(0);
    text("HELLO",160,200);
  }
  else if(key=='\n')
  {
    background(random(255),random(255),random(255));
  }
}


