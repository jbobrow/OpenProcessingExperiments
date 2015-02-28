
void setup()
{
  size(500,500);
  smooth();
  background(0);
  colorMode(HSB);
  noStroke();
  fill(255);
}

float x;
float y;
float angle = 0;
float prevAngle;
float c = 360; 
float divisor = 300;
boolean enableStroke = false;
boolean colorFill = true;
int colorM = 1;
boolean fadeMode = true;

void draw()
{
  //background(0);
  //stroke(255);
  if(fadeMode)
  {
    fill(0,20);
    rect(0,0,width,height);
  }
  
    for(int j=0; j<10; j++)
    {
      if(colorM == 1)
      {
        fill(c,250,250);
      }
      else if(colorM == 2)
      {
        fill(map(mouseX*mouseY,0,width*height,0,360),250,250);
      }

      else if(colorM == 3)
      {
        fill(255);
      }
      else if(colorM == 4)
      {
        fill(random(201,205),250,250);
      }
      x = 0.7*angle*sin(angle);
      y = 0.7*angle*cos(angle);
      
      ellipse(x+width/2, y+height/2,10,10);
      if(angle <= width/1.2)
      { angle += PI*10/divisor; 
      if(angle * prevAngle < 0)
      {
        if(!fadeMode)
        {
          fill(0);
        }
  rect(0,0,width,height);
  divisor = random(75);
       // angle += PI/1.2;
      }
      }
      else 
      { 
        if(!fadeMode)
        {
          fill(0);
        }
  rect(0,0,width,height);
  divisor = random(200);
        angle = -angle; 
      }
      if(c >360)
      {c=0;}
      c += 0.2;
      prevAngle = angle;
      println(c);
    }
    angle += PI/divisor;
}

void mousePressed()
{
  fill(0);
  rect(0,0,width,height);
  divisor = random(350);
}

void keyPressed()
{
  if(key == ' ')
  {
    fadeMode = !fadeMode;
  }

  else
  {
    colorM++;
    if(colorM>4)
    colorM = 1;
  }
}

