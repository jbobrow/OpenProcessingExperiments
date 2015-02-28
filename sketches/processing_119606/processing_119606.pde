
//hw 7
//Stephanie Park
//seohyunp@andrew.cmu.edu
//© Stephanie Park, 2013


float x1, y1, dx1, dy1, wd1, ht1;
float x2, y2, dx2, dy2, wd2, ht2;
color col1, col2, col3;
 
 
void setup()
{
  size(400, 400);
  frameRate(50);  
    
  x1 = width*0.25;
  y1 = height*0.25;
  dx1 = 1;
  dy1 = 1;
  wd1 = width*0.2;
  ht1 = height*0.2;
  
  x2 = width*0.25;
  y2 = height*0.25;
  dx2 = 5;
  dy2 = 5;
  wd2 = width*0.05;
  ht2 = height*0.05;
  
  col1 = color(196,147,77);
  col2 = color(245,201,138);
  col3 = color(188,23,26);
}
 
 
void draw()
{
  background (0,0,0);

  drawBread();
  moveBread();
  drawPepperoni();
  movePepperoni();
  detectCollisions();
}


void drawBread()
{
  noStroke();
  fill(col1);
  ellipse(x1, y1, wd1, ht1);
  fill (col2);
  ellipse(x1,y1,wd1*.8,ht1*.8);
}
 
 
void moveBread()
{
  x1 += dx1;
  y1 += dy1;
  if (x1 + wd1*0.3 >= width)
  {
    dx1 *= -2;
  }
  else if (x1 - wd1*0.3 <= 0)
  {
    dx1*= -1;
  }
}


void drawPepperoni()
{
  noStroke();
  fill(col3);
  ellipse(x2*.75, y2*.75, wd2, ht2);
  ellipse (x2*.65, y2*.8,wd2, ht2);
  ellipse (x2*.7, y2*.65,wd2, ht2);
}

 
void movePepperoni()
{
  x2 += dx2;
  y2 += dy2;
  if (x2>width)
  {
    x2 = 0;
  }
  else if (x2<0)
  {
    x2 = width;
  }
  else if (y2< 0)
  {
    y2 = height;
  }
  else if (y2>= height)
  {
    y2 = ht2;
  }
}

 
void detectCollisions()
{
  float d =dist(x1, y1, x2, y2);
  float colDist = wd1*0.5 + wd2*0.5;
  if (d < (colDist))
  {
    fill(col1);
    ellipse ( width*.5, height*.5, width, height);
    fill (col2);
    ellipse(width*.5,height*.5,width*.8,height*.8);
    fill (col3);
    ellipse ( width*.7, height*.7, width*.2,height*.2);
    ellipse ( width*.2, height*.3, width*.2,height*.2);
    ellipse ( width*.6, height*.2, width*.2,height*.2);
    ellipse ( width*.35, height*.73, width*.2, height*.2);
    textSize(width*.2);
    fill (255,227,8);
    text("PIZZAAAA", width*0,height*.5);

  }
}



