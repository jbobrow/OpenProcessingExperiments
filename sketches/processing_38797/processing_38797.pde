
//hw6 CMU 48-757 
//copywrite 2011 Zack Jacobson-Weaver
color col;


void setup()
{
  size(400,400);
  background(0,0,0,10);
  col = color(random(256), random (256), random(256));
  frameRate(50);  
  noCursor();
  smooth();
}

void drawTarget(int x, int y, int circleSize)
{
  ellipseMode(CENTER);
  fill(col,256,random(256));
  ellipse(x, y, circleSize, circleSize);
  noStroke();
  fill(random(256),random(256),random(256));
  ellipse(x,y,circleSize/2.5, circleSize/2.5);
  
  rectMode(CENTER);
  fill(col,random(128),col);
  rect(x+circleSize/2, y+circleSize/2, circleSize/4, circleSize/4);
  fill(col,random(128),col);
  rect(x-circleSize/2, y-circleSize/2, circleSize/4, circleSize/4);
  fill(col,random(128),col);
  rect(x+circleSize/2, y-circleSize/2, circleSize/4, circleSize/4);
  fill(col,random(128),col);
  rect(x-circleSize/2, y+circleSize/2, circleSize/4, circleSize/4);
}

void draw()
{

int y=0; //start position for first drawTarget 
 int x=0;
 int x1=0;
 int y1=0;

  
while (x<= height)
{
  //diag bottomleft to top right
  drawTarget(x+25,y+375,100);
  
  y= y-50; //position for each successive drawTarget
  x=x+50;
  
  //diag topleft to bottom right
drawTarget(x1+25, y1+25, 100);
  
  x1=y1+50;
  y1=x1;
}
  


 
}
      
                
