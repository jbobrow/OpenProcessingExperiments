
int mysize = 100;
float xpos = width/2 ;
float ypos = height/2;

void setup()
{
  size(700,400);
  background(0,0,0,0);
  strokeWeight(2);
  stroke(0,0,0);
  smooth();
  fill(255,255,255,255);
  
}

void draw()
{
  ellipse(xpos, ypos, mysize, mysize);
  
  xpos = xpos+(mouseX-xpos)/25.0;
  ypos = ypos+(mouseY-ypos)/25.0;
}

void mousePressed()
{
  if(mouseButton == LEFT){
    mysize = mysize+20;
  }
  
  if(mouseButton == RIGHT){
    mysize = mysize-20;
  }
}

void mouseMoved()
{
  
 // if(mouseX < width/2)
 // {mysize = mysize + 5;}
 // if(mouseX > width/2)
  //{mysize = mysize - 5;}
}

