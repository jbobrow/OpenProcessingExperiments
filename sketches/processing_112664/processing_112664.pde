
float angle = 0;
float counter = 0;
float s = 1;
float scaleSpeed = .05;
float radius = 150;
float midX = 150;
float midY = 150;

void setup()
{
  size (300,300);
    background(#98DDFF);
}

void draw()
{

  rectMode(CENTER);
  
  counter = counter + 0.0167;
  
  if(s > 2|| s <0)
  {
    scaleSpeed = -scaleSpeed;
  }
  
    s += scaleSpeed;
    angle += .05;
    pushMatrix();
    ellipseMode(CORNER);
    translate(width/2,height/2);
    rotate(angle);
    scale(s);
    noStroke();
    fill(#FA98FF,25);
    ellipse(0,0, 200,200);
    popMatrix();
 
 if (counter > 4) 
  {
  angle += .1;
  pushMatrix();
  translate(width/2,height/2);
  rotate(angle);
  stroke(#BF00FA,5);
  fill(#2B29FC,2);
  rect(0,0,100,100);
  popMatrix();
  }  

else
  {
  smooth();
  noStroke();
  noFill();
  ellipse(midX, midY, radius * 4, radius * 4);
  
  float x = 0;
  float y = 0;
  radius = 20;
  stroke(#D1FFB7,50);
  strokeWeight(10);
  float sadX = -999;
  float sadY = -999;
  for (float angle = 0; angle <= 1440; angle += 8)
    {
    println("x: " + x +"y: " + y);
    radius += .8;
    float rad = radians(angle);
    x = midX + (radius * cos(rad));
    y = midY + (radius * sin(rad));
    if (sadX > -999)
      {
        line(x,y,sadX,sadY);
      }
   sadX = x;
  sadY = y;
    }
  }
}


