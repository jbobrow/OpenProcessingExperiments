
//hw 7 CMU 48-757 copywrite Zack Jacobson-Weaver
// Move the cursor to line the foo fighter up with the target.  Press any key to
//return to center.

float x,y,circleSize,deltaX,deltaY;
color col;
color txt;

void setup()
{
  size(400,400);
  //background(0,0,0,10);
  y=height/2;
  x=width/2;
  deltaX=0;
  deltaY=0;
  col = color(random(256), random (256), random(256));
  circleSize = width/3;
  frameRate(50);  
  noCursor();
  smooth();
  txt = color(240,240,0);
  textAlign(CENTER);
  textSize(18);
}

void draw()
{
  clearTarget();
  drawTarget(x,y,50);
  moveWrap();
  speedoX();
  speedoY(); 
}

void drawTarget(float x, float y, int circleSize)
{
  ellipseMode(CENTER);
  noStroke();
  fill(col,256,random(256),60);
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

void moveWrap( )//speed increases (a.k.a. deltaX increases) as mouse
                //moves from left to right
{
   x = x + deltaX; 
  
   if (mouseX > pmouseX)
   {
     deltaX++;
   }
   
   if (mouseX< pmouseX)
   {
    deltaX--; 
   }
   //next is wrapping, if the x position of the ellipse is 
   //exceeds 400, it moves the that position to 0 to start 
   //over again.   
   if ( x > width + circleSize/2)
   {
      x = -circleSize/2 ;
     }
   
   if ( x < -circleSize/2)
   {
      x = width + circleSize/2;
     }
     
     //speed increases (a.k.a. deltaY increases) as mouse
     //moves from bottom to top
     y = y + deltaY;
     
     if(mouseY > pmouseY)
     {
      deltaY++; 
     }
     if(mouseY < pmouseY)
     {
      deltaY--;
     }
     
     if ( y > height + circleSize/2)
   {
      y = -circleSize/2 ;
     }
   
   if ( y < -circleSize/2)
   {
      y = height + circleSize/2;
     }
}
   
   void clearTarget( )
{
  //redraws background after each target delatXY
  fill( 0, 0, 0, 35 );
  background(0);
  stroke(255,0,0);
  strokeWeight(5);
  noFill();
  ellipse(width/2, height/2,width/9,height/9); 
}

void keyPressed( )
{
   if(keyPressed)
  {
   x=width/2;
   y=height/2;
   deltaX=0;
   deltaY=0;
  }
} 

  void speedoX()
  {
   fill(txt);
  text("XSpeed =" + abs (deltaX), width/6, height-20); 
  }
  
  void speedoY()
  {
   fill(txt);
  text("YSpeed =" + abs (deltaY), width/1.2, height-20); 
  }
  
  



