
//homework7
//copyright Joel McCullough Pittsburgh PA 15221
//instructions:
//move cursor to manipulate the shape movement
//press any key to resest
float x,y,dia, deltaX,deltaY,velocityX,velocityY,distanceX,distanceY;
color col;
void setup()
{
  size(400,400);
  x = width/2;
  y = height/2;
  deltaX=4;
  deltaY=2;
  col = color(0,62,74,9);
  dia=100;
  noCursor();
  strokeWeight(6);
   
}
 
void draw()
{
  prepScreen();
  moveCircle();
  drawCircle();  
  printtext();
}
void reset()//reset the motion
{
  if(keyPressed == true)
  {
    x=width/2;
    y=height/2;
    deltaX=0;
    deltaY=0;
  }
   
}
void showVelocity()//calculate the velocity
{
  velocityX = deltaX;
  velocityY = deltaY;
   
  distanceX= dist(x,y,width,y);
  distanceY= dist(x,y,x,height);
   
    text( velocityX ,215,325);
    text( velocityY,200,350);
   
  
}
void printtext()
{
  fill(232,223,119);
  textSize(20);
  text("vertical speed:",width*1/8,height*7/8);
  text("horizontal speed:",width*1/8,height*13/16);
  showVelocity();
  reset();
   
}
 
 void initials()
{
   
  noFill();
   
//initials vectors
  beginShape();
    //j
      stroke(0,19,114);
      curveVertex(x-dia/5,y+dia/10);//1
      curveVertex(x-dia/2,y+dia/10);//1
      curveVertex(x-dia/7,y-dia/2);//4
      curveVertex(x-dia/6,y+dia/4);//5
      curveVertex(x-dia/2.2,y+dia/4);//3
      curveVertex(x+dia/10,y-dia/10);//2
      curveVertex(x+dia/10,y-dia/10);//2
      
  endShape(); 
   
  beginShape();
     //d
     stroke(219,103,39);
     curveVertex(x,y-dia/2);
     curveVertex(x,y-dia/2);
     curveVertex(x,y);
     curveVertex(x+dia/4,y-dia/4);
     curveVertex(x,y-dia/2);
     curveVertex(x,y-dia/2);
  endShape();
 
 
  beginShape();
      //m
    stroke(245,255,83);
      curveVertex(x+dia/2.8,y+dia/3);//2
      curveVertex(x+dia/2.8,y+dia/3);//2
      curveVertex(x+dia/2.5,y-dia/3);//1
     curveVertex(x+dia/4,y-dia/8);//5
     curveVertex(x+dia/10,y-dia/2);//4
     curveVertex(x+dia/10,y+dia/2);//3
     curveVertex(x+dia/10,y+dia/2);//3
  endShape();
   
}
 
void changedir()
{
  //y direction change
  if(pmouseY>height/2)
  {
      deltaY=-deltaY;
  }
   
  //x direction change
  if(pmouseX> width/2)
  {
      deltaX=-deltaX;
  }
}
 
 
void accelX()
{
  if(pmouseX>width/2)
  {
      deltaX= pmouseX/width+10;
  }
  else
  {
     
      deltaX=5;
  }
}
void accelY()
{
  if(pmouseY>height/2)
  {
    if(pmouseY>height*3/4)
    {
      deltaY= pmouseY/height*2+12;
    }
      else
        {
          deltaY= pmouseY/height+8;
        }
   }
   
  else
  {
    if(pmouseY<height/4)
    {
        deltaY=pmouseY/height*.4+2;
    }
    else
    {
        deltaY=pmouseY/height*.4+5;
    } 
  }
}
  
  
void moveCircle()
{
  x = x + deltaX/2;
  y = y +deltaY/2;
  //too far right://going to the right and down
  if(x > width+dia/2)
  {
      x = -dia/2;
      y=y+50;
  }
  //too far left://going to the left and up
  if(x < -dia/2)
  {
     x = width+dia/2;
     y = y-50;
  }
  if(y >height)
  {
      y=dia/2;
  } 
  else if (y<0)
  {
      y=height;
  }
  accelX();
  accelY();
  changedir();
}
 
void drawCircle()
{
  fill(110,232,59);
  noStroke();
  ellipse(x,y,dia,dia);
  stroke(0);
  initials();
}
void prepScreen()
{
  noStroke();
  fill(col);
  rect(0,0,width,height);
}

