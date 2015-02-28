
//valentine contribution....for my wife.....ok I forgot to buy real flowers!
//I was busy studying processing!!
//Click the mouse to see the message!

int diam;
float r,g,b;
float X,Y;
void setup()
{
size (500,500);
  background(255);
}

void draw()
{
  frameRate(2);
  background(255);
  if (mousePressed)
  {
    messageOfLove();
  }
  else
  {
  aideenFlower();
  }
  
}


void aideenFlower()
{
  background(255);
  diam = width/5;
  X = width/2;
  Y = height/2;
  r = random (255);
   g = random (255);
    b = random (255);
  
  fill (255,255,b);
  ellipse (X,Y,diam, diam);
  fill(r,g,b);
   ellipse (X,Y - diam,diam, diam); 
    ellipse (X,Y + diam,diam, diam); 
    ellipse (X - diam,Y,diam, diam);
     ellipse (X + diam,Y,diam, diam);
     stroke  (0,255,0);
     line(X,height,X, height*4/5);
     
}

void messageOfLove()
{
  background (255);
  textSize(20);
  text ("Be My Valentine", width*2/5,height/2);
}
