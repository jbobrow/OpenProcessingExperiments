
//By Jim 
float r;
float g;
float b;


void setup()
{
  size(1365, 400);
  background(255, 255, 255);
  strokeWeight(3);
  smooth(); 
  noStroke();
  //frameRate(10); 
  noCursor();
}

void draw()
{
  fill(255, 255, 255, 100);
  rect(0, 0, width, height);

  fill(100, 100, 100);
  textSize(10);
  text(" 1:Blue 2:Green 3:Red \n 4:Purple 5:Pink 6:Turquoise \n 7:Yellow 8:Orange 9:Random \n 0:Black", 0, 20);

  fill(255);
  if (key == '3')
  {
    fill(255, 0, 0);
  }

  if (key == '1')
  {
    fill(0, 0, 255);
  }

  if (key == '2')
  {
    fill(0, 255, 0);
  }

  if (key == '0')
  {
    fill(0, 0, 0);
  }

  if (key == '4')
  {
    fill(155, 17, 148);
  }
  if (key == '5')
  {
    fill(234, 128, 181);
  }
  if (key == '6')
  {
    fill(25, 247, 227);
  }
  if (key == '7')
  {
    fill(252, 252, 33);
  }
  if (key == '8')
  {
    fill(247, 177, 25);
  }
  if (key == '9')
  {
    fill(r, g, b);
  }

  ellipse(mouseX, mouseY, 100, 100);
}

void keyPressed()
{
  r = random(255);
  g = random(255);
  b = random(255);
}

