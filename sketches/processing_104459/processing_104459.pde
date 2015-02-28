
float xpos,ypos, yincrease, xincrease;
float gravity = .98;
float time = 0;
float yvel = 0,xvel = 0;
int xdir,ydir;
int facediameter = 100;
int faceradius;
int eyeoffset = 15;
int mouthoffset = 20;
int eyeradius = 20;
int mouthxradius = 40;
int mouthyradius = 10;
float friction = -2;
int jump = 5;
int walk = 10;
float bound = 0;

void setup()
{
 size(320,240);
 frameRate(60);
 smooth();
 xpos = width/2;
 ypos = height/2;
 faceradius = facediameter/2;
}

void draw()
{
  background(0,0);
  //time++;
  xincrease = 0;
  yincrease = 0;
    if(keyPressed)
    {
      if(key == 'w')
      {
        bound = (height - (1.5)*faceradius);
        if (ypos > bound)
        {
          yincrease = -jump;
        }
      }
      if(key == 'a')
        xincrease = -walk;
      if(key == 'd')
        xincrease = walk;
    }
      
  yvel = yvel + gravity + yincrease;
  ypos = ypos + yvel;
  xpos = xpos + xvel + xincrease;
  
  if(ypos + faceradius >= height)
  {
    ypos = height - faceradius;
    yvel = -yvel;
    yvel = yvel - friction;
  }
  
  if(xpos + faceradius >= width)
  {
    xpos = width - faceradius;
    xvel = -xvel;
  }
  
  if(xpos - faceradius <= 0)
  {
    xpos = faceradius;
    xvel = -xvel;
  }
  drawFace(xpos,ypos);
}


void drawFace(float xpos, float ypos)
{
  // draw face
  fill(#ffff00); //color yellow
  ellipse(xpos, ypos, facediameter,facediameter); 
  
  //draw right eye
  fill(#0000ff);//color blue
  ellipse(xpos + eyeoffset, ypos - eyeoffset, eyeradius, eyeradius); 
  
  //draw left eye
  fill(#0000ff);//color blue
  ellipse(xpos - eyeoffset, ypos - eyeoffset, eyeradius, eyeradius); 
  
  //draw mouth
  fill(0); //color black
  ellipse(xpos + 0, ypos + mouthoffset, mouthxradius, mouthyradius);
}
