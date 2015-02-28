
//Homework6
//Vishal Agrawal
//vishala@andrew.cmu.edu
//copyright (C) 2012

float wX, wY, wSpeed, wDia;
float bX, bY, bXSpeed, bYSpeed, bDia;

void setup()
{
  size(500, 500);
  smooth();
  wX = random(wDia/2,width-(wDia/2));
  wDia = 100;
  wY = random(wDia/2,height-(wDia/2));
  wSpeed = 1;
  bX = random(wDia/2,width-(wDia/2));
  bY = random(wDia/2,height-(wDia/2));
  bDia = 100;
  bXSpeed = 1;
  bYSpeed = 1;
}
 
void draw()
{
  refresh();
  wrap();
  bounce();
}

void bounce()
{
  bX +=  bXSpeed;
  bY +=  bYSpeed;
  if( bX > width - (bDia/2) ||  bX < bDia/2 )
  {
    bXSpeed = -bXSpeed;
  }
  if( bY > height - (bDia/2) || bY < bDia/2 )
  {
    bYSpeed = -bYSpeed;
  }
  initials(bX, bY, bDia, bDia);
}

void refresh()
{
  fill(255, 10);
  rect(0, 0, width, height);
}
void wrap()
{
  wX += wSpeed;
  wY += wSpeed;
  if(wX >= width+wDia)
  {
    wX = -wDia/2;
  }
  if(wY >= height+wDia)
  {
    wY = -wDia/2;
  }
  initials(wX, wY, wDia, wDia);
}
 
void initials(float x, float y, float dia, float dia2)
{
    //set stroke weight
  strokeWeight(7);
  stroke(#5C2369);
   
  //draw circle
    noFill();
  ellipse(x, y, dia, dia2);
   
  beginShape();
    vertex(x-(dia/2), y);
    vertex(x-(dia/2), y);
    vertex(x, y+(dia2/2));
    vertex(x, y+(dia2/2));
  endShape();
   
  beginShape();
    vertex(x, y+(dia2/2));
    vertex(x, y+(dia2/2));
    vertex(x, y-(dia2/2));
    vertex(x, y-(dia2/2));
  endShape();
   
  beginShape();
    vertex(x, y-(dia2/2));
    vertex(x, y-(dia2/2));
    vertex(x+(dia/2), y);
    vertex(x+(dia/2), y);
  endShape();
   
  beginShape();
    curveVertex(x, y);
    curveVertex(x, y);
    curveVertex(x+(dia/3), y-(dia2/6));
    curveVertex(x+(dia/3), y-(dia2/6));
  endShape();
}

