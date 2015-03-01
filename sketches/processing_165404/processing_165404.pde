
boolean loop, back;
float angle;

void setup()
{
  size(400,400);
  background(255);
}

void draw()
{
  translate(height/2, width/2);
  fill(255-180*angle, 255-60*angle, 255-30*angle);
  noStroke();
  
  if(!(back))
  {
    rotate(angle);
  }
  else
  {
    rotate(-angle);
  }
  
  //rect(-100,-sqrt(200),200,200,30);
  //rect(-100,-sqrt(200),200,1);
  rect(-100,-sqrt(200),2,200);
  
  if(!(back))
  {
    
    if(angle < TWO_PI)
    {
      angle += 0.01;
    }
    else
    {
      angle += 0.01;
      back = true;
    }
  }
  else
  {
    if(angle > 0)
    {
      angle += -0.01;
    }
    else
    {
      angle = 0;
      angle += -0.01;
      back = false;
    }
  }
  
}

void mousePressed()
{
  if(loop)
  {
    noLoop();
    loop = false;
  }
  else
  {
    loop();
    loop = true;
  }
}


