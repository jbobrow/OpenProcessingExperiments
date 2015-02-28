
//Homework 4
//copyright Alex Fischer ajfische 2012
//move the mouse to change the background color
//click the mouse to create lines
//press spacebar to change drawing mode
//click and drag the mouse to create lines

int count=0;
int m=100;
int z=0;
float r,g,b;

void setup()
{
  size(500,500);
  background(255);
  smooth();
}

void draw()
{
  r=mouseX;
  g=mouseY;
  b=mouseX-mouseY;
  count+=2;
  if(count>m)
  {
    count=2;
  }
  noStroke();  
  fill(r+34,g+28,b-30,50);
  ellipse(width/2,height/2,count*12,count*12);
  
}

void keyPressed()
{
  if (key == ' ')
  {
    z+=1;
  }
}

void mousePressed()
{
  if (z % 2 == 0)
  {
  stroke(random(255),random(255),random(255));
  strokeWeight(2);
  line(mouseX, mouseY, random(500*100), random(500*100));
  stroke(random(255),random(255),random(255));
  line(mouseX, mouseY, random(500*-100), random(500*100));
  stroke(random(255),random(255),random(255));
  line(mouseX, mouseY, random(500*100), random(500*-100));
  stroke(random(255),random(255),random(255));
  line(mouseX, mouseY, random(500*-100), random(500*-100));
  stroke(random(255),random(255),random(255));
  line(mouseX, mouseY, random(500*100), random(500*100));
  stroke(random(255),random(255),random(255));
  line(mouseX, mouseY, random(500*-100), random(500*100));
  stroke(random(255),random(255),random(255));
  line(mouseX, mouseY, random(500*100), random(500*-100));
  stroke(random(255),random(255),random(255));
  line(mouseX, mouseY, random(500*-100), random(500*-100));
  }
}

void mouseDragged()
{
  if (z % 2 == 1)
  {
  stroke(random(255),random(255),random(255));
  strokeWeight(2);
  line(mouseX, mouseY, random(500), random(500));
  }
}



