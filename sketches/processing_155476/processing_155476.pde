
int directionX = 0, directionY = 0;
float x=720, y=397, speed=10;


void setup(){
  size(1440, 794); 
  background(255);
 
}

void draw(){
  fill(mouseY, 0, mouseX);
  noStroke();
  rect(x, y, 25, 25);
  x=x+speed*directionX;
  y=y+speed*directionY; 
    if ((x>width-12.5) || (x<12.5))
  {   
    directionX=-directionX;
  }
  if ((y>height-12.5) || (y<12.5))
  {   
    directionY=-directionY;
  } 
   fill(0);
   PFont f = createFont("Arial", 48);
  textAlign(CENTER);
  textFont(f);
  textSize(24);
  text("Use arrow keys to control the square", 720, 50); 
  text("Change colour by moving mouse", 720, 80);
  
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      //if (directionX>0) { 
      directionX=-1;
      directionY=0;
      //}
    }
    else if (keyCode == RIGHT)
    {
      //if (directionX<0) {  
      directionX=1;
      directionY=0;
      //}
    }
    else if (keyCode == UP)
    {
      //if (directionY<0) {
      directionY=-1;
      directionX=0;
      //}
    }
    else if (keyCode == DOWN)
    {
      //if (directionY<0) { 
      directionY=1;
      directionX=0;
      //}
    }
    else if (keyCode == SHIFT)
    {
      //if (directionY<0) { 
      directionY=0;
      directionX=0;
      //}
    }
  }
}


