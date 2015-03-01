
//Balloon
int xPos=250;
int yPos=150;
//balloon Tail
int linexPos=250;
int lineyPos=150;
int line1=250;
int line2=190;

int xDir=1;
int yDir=1;
void setup()
{
  size(300,300);//window size
}


void draw()
{
  //house
  background(204);
  rect(10,200,100,75);
  rect(15,210,20,20);
  rect(75,250,20,25);
  triangle(10,200,55,170,110,200);
  line(linexPos,lineyPos,line1,line2);
  fill(random(255),random(255),random(255));
  ellipse(xPos, yPos, random(0,75),random(0,75));
  

  xPos=xPos+xDir;
  yPos=yPos+yDir;
  
  if (xPos>width-20 || xPos<20)
  {
    xDir=-xDir;
  }
  
  if (yPos>height-20 || yPos<20)
  {
    yDir=-yDir;
  }
  
  //Tail
  linexPos=linexPos+xDir;
  lineyPos=lineyPos+yDir;
  
  line1=line1+xDir;
  line2=line2+yDir;

  
}

