
//Jennifer Kang - Homework 6
//jmkang@andrew.cmu.edu
//©jennifer kang

// if 'w' is pressed, toad hits right page and bounces back towards left
// if 's' is pressed, toad moves faster
// as you move mouse to the right, image of toad spreads out 

float tx, ty, td, txSpeed, tySpeed;
float px, py, pSize, pxSpeed, pySpeed;
float x, y, wd, ht;
PImage wrap; 
PImage bounce; 

void setup ( )
{
  size (400, 400);
  smooth ( );
  background (255,0);
  tx=100;
  ty=200;
  td=30;
  txSpeed=2;
  tySpeed=2;
  px = 2;
  py = 200;
  pSize = 30;
  pxSpeed = 2;
  x=100;
  y=100;
  wd=200;
  ht=200;
  
  bounce=loadImage("toad.png");
  imageMode (CENTER);
}
  

void draw() {
  background(255);
  drawImage(px,py,pSize);
  moveImage();
  //drawellipse (40,30,60);
  figure(tx, ty, td);
  movefigure();
  


}


void drawImage( float px, float py, float pSize)
{
   fill( 0, 0, 255 );
   image(bounce, px,py,pSize*1.5,pSize*1.5);
}

void figure (float tx, float ty, float td)
{
  fill(250,22,22);
  noStroke ( );
  ellipse (tx, ty, td, td);
  
}

void movefigure ()
{
  ty=ty+tySpeed;
  if (ty>height*.5) 
  {
    tySpeed=-tySpeed;
  }
  else if (ty<0)
  {
    tySpeed =-tySpeed;
  }
  else if (ty>400)
  {
    tySpeed = -tySpeed;
  }
  else if (ty<0)
  {tySpeed = -tySpeed;}
   
  tx=tx+txSpeed;
  if (tx>width*.5) 
  {
    txSpeed=-txSpeed;
  }
  else if (tx<0)
  {
    txSpeed =-txSpeed;
  }
  else if (tx>400)
  {
    txSpeed = -txSpeed;
  }
  else if (tx<0)
  {txSpeed = -txSpeed;
}
}


void moveImage()
{
  px=px+pxSpeed;
  if (px>400)
  {
    pxSpeed = -pxSpeed;
  }
  else if (px<0)
  {
    pxSpeed=-pxSpeed;
  }
  else if (py<0)
  {
    pySpeed=-pySpeed;
  }
  else if (py>400)
  {
    pySpeed = -pySpeed;
  }
}
   

  {
    px = px + pxSpeed;
    if (px>width)
   {
     px=0; 
   }
  {
      px = px + pxSpeed;
    if (px>width)
   
     px=0; 
   }
  }
  
 

void keyPressed() 
{
    if (key == 's');
   {pxSpeed ++;
   } 

    
    if (key == 'w');
    {pySpeed ++;}  
    
    if (key == 'a');
    {pySpeed --;}
    
}

////void mouseDragged ()
//{
//  
// if (mouseX>pmouseX)
// {
//   pxSpeed = pxSpeed + 1;
// }
// else if (mouseX<pmouseX)
// {
//   pxSpeed = pxSpeed - 1;
// }
// 
//}
 




