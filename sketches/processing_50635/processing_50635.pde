
//homework #4 - 48257 S'12
//melissa goh copyright 2012

//mouse over the circles
//click circles for a flash of colour
//use up and down keys to make circles larger or smaller

float x1, y1, x2, y2, x3, y3;
float dia;


void setup()
{
  size(400, 400);
  background(113, 89, 74);
  textSize(48);
  fill(255);
  smooth();
  frameRate(10);
  dia = 50;
  x1 = 100;
  y1 = 100;
  x2 = 200;
  y2 = 200;
  x3 = 300;
  y3 = 300;
}

void draw()
{
  noStroke();
  fill(113, 89, 74, 50);
  rect(0, 0, width, height);
  fill(255, 30);
  ellipse(x1, y1, dia, dia);
  ellipse(x1, y2, dia, dia);
  ellipse(x1, y3, dia, dia);
  ellipse(x2, y1, dia, dia);
  ellipse(x2, y2, dia, dia);
  ellipse(x2, y3, dia, dia);
  ellipse(x3, y1, dia, dia);
  ellipse(x3, y2, dia, dia);
  ellipse(x3, y3, dia, dia);
}

void mousePressed()
{
  if (mouseX > x1 - dia/2 && mouseX < x1 + dia/2 && mouseY > y1 - dia/2 && mouseY < y1 + dia/2)
  {
    fill(random(255), random(255), random(255));
    ellipse(x1, y1, dia, dia);  
  }
  
  if (mouseX > x2 - dia/2 && mouseX < x2 + dia/2 && mouseY > y1 - dia/2 && mouseY < y1 + dia/2)
  {
    fill(random(255), random(255), random(255));
    ellipse(x2, y1, dia, dia);  
  }
  
  if (mouseX > x3 - dia/2 && mouseX < x3 + dia/2 && mouseY > y1 - dia/2 && mouseY < y1 + dia/2)
  {
    fill(random(255), random(255), random(255));
    ellipse(x3, y1, dia, dia);  
  }
  
  if (mouseX > x1 - dia/2 && mouseX < x1 + dia/2 && mouseY > y2 - dia/2 && mouseY < y2 + dia/2)
  {
    fill(random(255), random(255), random(255));
    ellipse(x1, y2, dia, dia);  
  }
  
  if (mouseX > x2 - dia/2 && mouseX < x2 + dia/2 && mouseY > y2 - dia/2 && mouseY < y2 + dia/2)
  {
    fill(random(255), random(255), random(255));
    ellipse(x2, y2, dia, dia);  
  }
  
  if (mouseX > x3 - dia/2 && mouseX < x3 + dia/2 && mouseY > y2 - dia/2 && mouseY < y2 + dia/2)
  {
    fill(random(255), random(255), random(255));
    ellipse(x3, y2, dia, dia);  
  }
  
  if (mouseX > x1 - dia/2 && mouseX < x1 + dia/2 && mouseY > y3 - dia/2 && mouseY < y3 + dia/2)
  {
    fill(random(255), random(255), random(255));
    ellipse(x1, y3, dia, dia);  
  }
  
  if (mouseX > x2 - dia/2 && mouseX < x2 + dia/2 && mouseY > y3 - dia/2 && mouseY < y3 + dia/2)
  {
    fill(random(255), random(255), random(255));
    ellipse(x2, y3, dia, dia);  
  }
  
  if (mouseX > x3 - dia/2 && mouseX < x3 + dia/2 && mouseY > y3 - dia/2 && mouseY < y3 + dia/2)
  {
    fill(random(255), random(255), random(255));
    ellipse(x3, y3, dia, dia);  
  }
}

void keyPressed()
{
  if (keyCode == UP)
  {
    dia = dia + 10;
  }
  
  if (keyCode == DOWN)
  {
    dia = dia - 10;
  }
}

void mouseMoved() 
{
  
  if (mouseX > x1 - dia/2 && mouseX < x1 + dia/2 && mouseY > y1 - dia/2 && mouseY < y1 + dia/2)
  {
    fill(255, 20);
    ellipse(x1, y1, dia + 20, dia + 20); 
  }
  
    if (mouseX > x2 - dia/2 && mouseX < x2 + dia/2 && mouseY > y1 - dia/2 && mouseY < y1 + dia/2)
  {
    fill(255, 20);
    ellipse(x2, y1, dia + 20, dia + 20);  
  }
  
  if (mouseX > x3 - dia/2 && mouseX < x3 + dia/2 && mouseY > y1 - dia/2 && mouseY < y1 + dia/2)
  {
    fill(255, 20);
    ellipse(x3, y1, dia + 20, dia + 20);  
  }
  
  if (mouseX > x1 - dia/2 && mouseX < x1 + dia/2 && mouseY > y2 - dia/2 && mouseY < y2 + dia/2)
  {
    fill(255, 20);
    ellipse(x1, y2, dia + 20, dia + 20);  
  }
  
  if (mouseX > x2 - dia/2 && mouseX < x2 + dia/2 && mouseY > y2 - dia/2 && mouseY < y2 + dia/2)
  {
    fill(255, 20);
    ellipse(x2, y2, dia + 20, dia + 20);  
  }
  
  if (mouseX > x3 - dia/2 && mouseX < x3 + dia/2 && mouseY > y2 - dia/2 && mouseY < y2 + dia/2)
  {
    fill(255, 20);
    ellipse(x3, y2, dia + 20, dia + 20);  
  }
  
  if (mouseX > x1 - dia/2 && mouseX < x1 + dia/2 && mouseY > y3 - dia/2 && mouseY < y3 + dia/2)
  {
    fill(255, 20);
    ellipse(x1, y3, dia + 20, dia + 20);  
  }
  
  if (mouseX > x2 - dia/2 && mouseX < x2 + dia/2 && mouseY > y3 - dia/2 && mouseY < y3 + dia/2)
  {
    fill(255, 20);
    ellipse(x2, y3, dia + 20, dia + 20);  
  }
  
  if (mouseX > x3 - dia/2 && mouseX < x3 + dia/2 && mouseY > y3 - dia/2 && mouseY < y3 + dia/2)
  {
    fill(255, 20);
    ellipse(x3, y3, dia + 20, dia + 20);  
  }
}



