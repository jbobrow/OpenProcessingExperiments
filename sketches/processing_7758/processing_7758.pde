
void setup()
{
  size(400,400);
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

void draw()
{
  //background(0);
  //stroke(255);
    for(int j=0; j<10; j++)
    {
      if(colorM == 1)
      {
        fill(map(mouseX*mouseY,0,width*height,0,360),250,250);
      }
      else if(colorM == 2)
      {
        fill(c,250,250);
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
      { angle += PI/10; }
      else if(angle * prevAngle < 0)
      {
       // angle += PI/1.2;
      }
      else 
      { 
        angle = -angle; 
      }
      if(c >360)
      {c=0;}
      c += 0.1;
      prevAngle = angle;
      println(c);
    }
    angle += PI/divisor;
}

void mousePressed()
{
  fill(0);
  rect(0,0,width,height);
  divisor = random(500);
}

void keyPressed()
{
  if(key == ' ')
  {
    enableStroke = !enableStroke;
    if(enableStroke)
    {
      stroke(0);
      strokeWeight(1);
    }
    else
    {
      noStroke();
    }
  }
  else
  {
    colorM++;
    if(colorM>4)
    colorM = 1;
  }
}

