
//Homework7
//Vishal Agrawal
//vishala@andrew.cmu.edu
//copyright (C) 2012

float wX, wY, wSpeed, wDia;
float bX, bY, bXSpeed, bYSpeed, bDia;
float count;
PFont font;

void setup()
{
  size(500, 500);
  smooth();
  wX = random(wDia/2,width-(wDia/2));
  wDia = 100;
  wY = random(wDia/2,height-(wDia/2));
  wSpeed = 0;
  bX = random(wDia/2,width-(wDia/2));
  bY = random(wDia/2,height-(wDia/2));
  bDia = 100;
  bXSpeed = 1;
  bYSpeed = 1;
  count = 0;
  
  //load font
  font = loadFont("f1.vlw"); 
  textFont(font); 
  textSize(15);
  
}
 
void draw()
{
  refresh();
  wrap();
  bounce();
  checkCollision();
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
  target(wX, wY, wDia/2);
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

void target(float x, float y, float dia)
{
  noStroke();
  fill(#ff0000);
  ellipse(x, y, dia, dia);
  fill(#ffffff);
  ellipse(x, y, 3*dia/4, 3*dia/4);
  fill(#ff0000);
  ellipse(x, y, dia/4, dia/4);
}

void mousePressed()
{
  if(wSpeed == 0)
  {
    wSpeed = 1;
  }
  else
  {
    wSpeed = 0;
  }
}

void checkCollision()
{
  if(abs(bX-wX)<=bDia/2 && abs(bY-wY)<=bDia/2)
  {
    fill(255, 0, 0, 10);
    rect(0, 0, width, height);
    count++;
    wX = random(wDia/2,width-(wDia/2));
    wY = random(wDia/2,height-(wDia/2));
    bX = random(wDia/2,width-(wDia/2));
    bY = random(wDia/2,height-(wDia/2));
  }
  fill(#000000);
  text("Number of Collisions: " + (int) count, 15, 30);
  text("Timer: " + (int) millis()/1000, 15, 60);
}
