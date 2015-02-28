
PShape s;
float xoff, yoff;
poof p;
int mode = 1;

void setup()
{
  size(1024,768);
  background(0);
  smooth();
  s = loadShape("abstract_square.svg");
  p = new poof();
}



void draw()
{
  
  fill(0,15+10*sin(frameCount/40));
  rect(0,0,width,height);
  for(int i = 0; i < 3; ++i)
  {
    switch(mode)
    {
      case 1:
        p.update();
        break;
      case 2:
        s.rotate(random(TWO_PI));
        shape(s,random(-30,width),random(-30,height),random(20,130),random(20,130));
    }
  }
  
}

void keyPressed()
{
  if(key == '1')
  {

    mode = 1;
  }
  else if(key == '2')
  {
    mode = 2;
  }
  //noLoop();
  //save("Jordan_export4.png");
  
}

void mousePressed()
{
  loop();
}

class poof
{
  float xpos,ypos;
  poof()
  {
    xpos = random(-10,width);
    ypos = random(-10,height);
  }
  
  void update()
  {
    xpos = random(-10,width);
    ypos = random(-10,height);
    float poof_scale = random(0.5,2.3);
    fill(232,216,68,20);
    noStroke();
    for(float i = 0.1; i < 1.55; i += 0.01)
    {
      ellipse(xpos,ypos,poof_scale*tan(i),poof_scale*tan(i));
    }
  }
}

