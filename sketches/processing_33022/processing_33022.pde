
int diam=40;
float xpos, ypos;


float xspeed=3;//increments
float yspeed=3;//increments

int xdirection=1;
int ydirection=1;

void setup()
{
  size (500,400);
  xpos=width/2;
  ypos=height/2;
  frameRate(40);
  noStroke();
}

void draw()
{

  background(0);
  xpos = xpos + (xspeed * xdirection);
  ypos = ypos + (yspeed * ydirection);

  if(xpos >= width-diam || xpos<0){
      xdirection*=-1;
  }
  
  if (ypos >= height-diam || ypos<0){
      ydirection*=-1;
  }
  
  if (dist(mouseX, mouseY, xpos+diam/2, ypos+diam/2) <= diam/2 ) {
    xdirection*=-1;
    xpos=xpos+5*xspeed*xdirection;
    xpos=constrain(xpos, 0,width-diam);
    ydirection*=-1;
    ypos=xpos+5*yspeed*ydirection;
    ypos=constrain(ypos, 0, height-diam);
  }
  
  ellipse(xpos+diam/2, ypos+diam/2, diam, diam);
  println(xpos + ", " + ypos);
}

