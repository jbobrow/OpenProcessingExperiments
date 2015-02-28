
//HW5 - Computing for arts with Processing
//Copyright Ziad Ewais (zewais) - 09/13/2011 - CMU

int i, j, k, x, y;
float h;

void setup()
{
  size(400, 400);
  background(0);
  smooth();
  noFill();
  noCursor();
  strokeWeight(6);
  h = height/2 ;
  x = 0; 
  y = 10;
}


void draw()
{
  background(0);
  i = 0;
  while(i < y)
  {
    stroke(255,255 - (20 * i),0, 255 - (20 * i));
    beginShape();
    curveVertex(0, h + (x * i));
    curveVertex(0, h + (x * i));
    curveVertex(mouseX, mouseY + i * 10);
    curveVertex(width, h + (x * i));
    curveVertex(width, h + (x * i));
    endShape();
    
    beginShape();
    curveVertex(0, h - (x * i));
    curveVertex(0, h - (x * i));
    curveVertex(mouseX, mouseY - i * 10);
    curveVertex(width, h - (x * i));
    curveVertex(width, h - (x * i));
    endShape();
    i++;
  }  
}

void keyPressed()
{
  if(keyCode == UP)
  {
    x++;
  }
  else if(keyCode == DOWN)
  {
    x--;
  }
  else if(keyCode == LEFT && y > 1)
  {
    y--;
  }
  else if(keyCode == RIGHT && y < 11)
  {
    y++;
  }
}

