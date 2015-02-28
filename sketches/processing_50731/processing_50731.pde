
//hw #4 responding to the user: part 2
//copyright kyree holmes 2012


float x, y, w, h;
float r,g,b;

void setup()
{
  size(400,400);
  background(200);
  smooth();

x = 200;
y = 200;
w = 75;
h = 50;

}


void draw()
{


}

void mousePressed()
{
  noStroke();
  fill(r,g,b);
  //body
  ellipse(mouseX,mouseY,w,h);
  //(200, 75, 125, 100)
  fill(255);
  //eyes
  ellipse(mouseX*.925, mouseY*.925, w/2, h/4);
  ellipse(mouseX*1.075, mouseY*.925, w/2, h/4);
  //eyeballs
  fill(0);
  ellipse(mouseX*.9, mouseY*.925,w/12, h/10);
  ellipse(mouseX*1.1, mouseY*.925, w/12, h/10);
}

void keyPressed()
{
  if (key == 'k')
  {
  r = 222;
  }

  if (key == 'y')
  {
  r = 150;
  }

  if (key == 'r')
  {
  r = 100;
  }

  if (key == 'e')
  {
  r = 50;
  }

  if (key == 'E')
  {
  r = 25;
  }
}
                                
