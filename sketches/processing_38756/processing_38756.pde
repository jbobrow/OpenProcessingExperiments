
//HW7 - Computing for arts with Processing
//Copyright Ziad Ewais (zewais) - 09/21/2011 - CMU
float x, y, w, h, deltaX, deltaY, mX, mY, speed;

void setup()
{
  size(400, 500);
  x = 100;
  y = 0;
  w = 200;
  h = 200;
  deltaX = 2;
  deltaY = 2;
  speed = 5;
  textSize(24);
}

void draw()
{
  bg();
  mouseMap();
  //speedChange();
  initials(x,y,w,h);
  redrawInitials();
  mouseText();
}

void mouseText()
{
  fill(255);
  text("Horizontal Speed: " + nf(deltaX,1,3) , 20 , 440);
  text("Vertical Speed: " + nf(deltaY,1,3), 20 , 465); 
  text("Speed Factor: " + nf(speed,1,1), 20, 490);
}

void mouseMap()
{
  mX = map(mouseX, 0, width, -speed, speed);
  mY = map(mouseY, 0, height, -speed, speed);
  deltaX = mX;
  deltaY = mY;
}

void bg()
{
  noStroke();
  fill(0,40);
  rect(0,0,width,height - 100);
  fill(0);
  rect(0,height - 100,width,100);
}

void redrawInitials()
{
  x = x + deltaX;
  y = y + deltaY;
  if(x > width)
  {
    x = -w;
  }
  if(x < -w)
  {
    x = width;
  }
  if(y > height)
  {
    y = -h;
  }
  if(y < -h)
  {
    y = height;
  }
  
}


void speedChange()
{
  if(keyPressed && keyCode == UP && speed <= 10)
  {
    speed = speed + .2;
  }
  if(keyPressed && keyCode == DOWN && speed > 0)
  {
    speed = speed - .2;
  }
}

void keyPressed()
{
  x = 100;
  y = 100;
  speed = 0;
}

void mouseMoved()
{
  while(speed < 5)
  {
    speed++;
  }
}
void initials(float x, float y, float w, float h)
{
  smooth();
  stroke(255,177,52);
  fill(255,0,0);
  beginShape();
  
  curveVertex(x , y + .1 * h);
  curveVertex(x , y + .1 * h); 
  curveVertex(x + .15 * w, y + .12 * h);
  curveVertex(x + .3 * w, y + .1 * h);
  curveVertex(x + .4 * w, y + .12 * h);
  curveVertex(x + .3 * w, y + .25 * h);
  curveVertex(x + (1.0 / 6) * w, y + .6 * h);
  curveVertex(x + .11 * w, y + .9 * h);
  curveVertex(x + .40 * w, y + .9 * h);
  curveVertex(x + .42 * w, y + .95 * h);
  curveVertex(x + .40 * w, y + h);
  curveVertex(x + .05 * w , y + h);
  curveVertex(x - .05 * w , y + .92 * h);
  curveVertex(x + .20 * w , y + .25 * h);
  curveVertex(x + (1.0 / 6) * w , y + .22 * h);
  curveVertex(x  , y + .22 * h);
  curveVertex(x , y + .1 * h);
  curveVertex(x , y + .1 * h); 
  
  endShape();
  
  //E
  
  fill(255,100,50);
  beginShape();
  
  curveVertex(x + .65 * w , y + .1 * h);
  curveVertex(x + .65 * w , y + .1 * h);
  curveVertex(x + .8 * w , y + .15 * h);
  curveVertex(x + w, y + .1 * h);
  curveVertex(x + 1.05 * w , y + .4 * h);
  curveVertex(x + .8 * w , y + .3 * h);
  curveVertex(x + .8 * w , y + .5 * h);
  curveVertex(x + .9 * w , y + .5 * h);
  curveVertex(x + .95 * w , y + .45 * h);
  curveVertex(x + .95 * w , y + .65 * h);
  curveVertex(x + .8 * w , y + .6 * h);
  curveVertex(x + .8 * w , y + .8 * h);
  curveVertex(x + .8 * w , y + .9 * h);
  curveVertex(x + w , y + .8 * h);
  curveVertex(x + 1.05 * w , y + .9 * h);
  curveVertex(x + w , y + h);
  curveVertex(x + .7 * w , y + h);
  curveVertex(x + .65 * w , y +  .85 * h);
  curveVertex(x + .65 * w , y + .1 * h);
  curveVertex(x + .65 * w , y + .1 * h);
  
  endShape();
  
  //H
  
  fill(255,255,0);
  beginShape();
  
  curveVertex(x + .3 * w , y);
  curveVertex(x + .4 * w , y);
  curveVertex(x + .4 * w , y + .5 * h);
  curveVertex(x + .6 * w , y + .5 * h);
  curveVertex(x + .6 * w , y);
  curveVertex(x + .7 * w , y);
  curveVertex(x + .7 * w , y + h);
  curveVertex(x + .6 * w , y + h);
  curveVertex(x + .6 * w , y + .7 * h);
  curveVertex(x + .4 * w , y + .7 * h);
  curveVertex(x + .4 * w , y + h);
  curveVertex(x + .3 * w , y + h);
  curveVertex(x + .3 * w , y);
  curveVertex(x + .4 * w , y);
  curveVertex(x + .4 * w , y);
  
  
  endShape();
}



