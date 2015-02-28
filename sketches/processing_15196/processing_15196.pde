
PFont font;

int xx,yy;

int guysize = 20;

void setup()
{
  fill(255);
  size(600,600);
  font = loadFont("font.vlw");
}

void draw()
{
  text("move the mouse to zoom, click to set zoom point",20,20);
  guysize = int(pow(dist(xx,yy,mouseX,mouseY),.7))+1;
  background(255);
  
  for(int i = xx; i< width+50; i+= guysize*2)
  {
    for(int j = yy; j < height+50; j+= guysize*5)
    {
      guy(i,j,guysize,guysize);
    }
    for(int j = yy; j > 0-guysize*3; j-= guysize*5)
    {
      guy(i,j,guysize,guysize);
    }
  }
  
  for(int i = xx; i> 0; i-= guysize*2)
  {
    for(int j = yy; j < height+50; j+= guysize*5)
    {
      guy(i,j,guysize,guysize);
    }
    for(int j = yy; j > 0-guysize*3; j-= guysize*5)
    {
      guy(i,j,guysize,guysize);
    }
  }
  
  println(guysize);
}

void mouseClicked()
{
  xx = mouseX;
  yy = mouseY;
}


void guy(int xpos, int ypos, int xoff, int yoff)
{
  ellipseMode(CENTER);
  stroke(int(random(255)),int(random(255)),int(random(255)));
  ellipse(xpos,ypos,xoff,yoff);
  stroke(0);
  line(xpos,ypos+(yoff/2),xpos,ypos+((yoff*2)+(yoff/2)));
  line(xpos,ypos+((yoff*2)+(yoff/2)),xpos-(xoff/2),ypos+((yoff*3)+(yoff/2)));
  line(xpos,ypos+((yoff*2)+(yoff/2)),xpos+(xoff/2),ypos+((yoff*3)+(yoff/2)));
  line(xpos,ypos+(yoff/2),xpos-(xoff/2),ypos+(yoff*2));
  line(xpos,ypos+(yoff/2),xpos+(xoff/2),ypos+(yoff*2));
}


