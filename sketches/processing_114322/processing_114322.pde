
//HW7-Movement and Collisions
//Coral Pais, Carnegie Mellon University
//Reproduction of the following code without consent is prohibited

/*
   Program instructions:
   Keep the pumpkin in the window with the help of the two bars
   Slide the lower bar using the mouse
   Move the upper bar using the LEFT and RIGHT key
   
   Change the speed of the pumpkin using the UP and DOWN keys
   Change the speed of the leaf using the + and - keys
   Watch the changing colors of the leaf during collision
   
   Press space to restart
     
*/


float x1, y1, sz1, dx1, dy1;
float x2, y2, w2,h2;
float x3, y3, w3,h3;
float x4, y4, sz4, dx4, dy4;
float dx,dy;
int leaf;

PImage plank1, plank2, pumpkin,background, redleaf,yellowleaf,orangeleaf;

void setup ( )
{
  
  size (600,600);
  x1=100;
  y1=100;
  sz1=80;
  dx1=random(2,5);
  dy1=random(2,5);
  
  
  x2=200;  //Upper Plank
  y2=10;
  w2=150;
  h2=25;
    
  
  x3=200; //Lower Plank
  y3=590;
  w3=150;
  h3=25;
  
  
  x4=100;  // Leaf
  y4=390;
  sz4=70;
  dx4=random(2,7);
  dy4=random(2,7);
  
  
  rectMode (CENTER);
  imageMode (CENTER);
  
  plank1=loadImage ("plank.png");
  plank2=loadImage ("plank.png");
  pumpkin=loadImage ("pumpkin.png");
  background= loadImage ("fallleaves.png");
  redleaf= loadImage ("redleaf.png");
  yellowleaf= loadImage ("yellowleaf.png");
  orangeleaf= loadImage ("orangeleaf.png");
  
  leaf=0;
  
}

void draw ( )
{
  prepScreen ( );
  
  drawpmpkin ( );
  movepmpkin ( );
  
  drawUPlank ( );
  moveUPlank ( );
  
  drawLPlank ( );
  moveLPlank ( );
  
  drawLeaf ( );
  moveLeaf ( );
  
  checkCollision( );
  checkGameOver ();
  
  
}

void prepScreen ( )
{
  
 image (background, width/2,height/2, width, height);
    
}



void drawpmpkin ( )
{
  
   
  pushMatrix ( );
  translate (x1, y1);
  image (pumpkin, 0 ,0, sz1, sz1);
  popMatrix ( );
}




void drawUPlank ( )
{
   
  pushMatrix ( );
  translate (x2, y2);
  image (plank1, 0 ,0, w2, h2);
  popMatrix ( );
}


void drawLPlank ( )
{
   
  pushMatrix ( );
  translate (x3, y3);
  image (plank2, 0 ,0, w3, h3);
  popMatrix ( );
}


void drawLeaf ( )
{
  if (leaf%3==0)
  {
  image (redleaf, x4 ,y4, sz4, sz4);
  }
  
  else if (leaf%3==1)
  {
  image (yellowleaf, x4 ,y4, sz4, sz4);
  }
  
  else if (leaf%3==2)
  {
  image (orangeleaf, x4 ,y4, sz4, sz4);
  }
  
  
  
}

void movepmpkin ( )
{
  x1+=dx1;
  if (x1> width ||  x1<0)
  {
    dx1=-dx1;
  }
  
  if ( y1<0 )
  {
    dy1=-dy1;
  }
  y1+=dy1;
  
  
  
}


void moveUPlank ( ) 
{
  
  if (x2 > width )
  {
    x2=width;
  }
  
  if (x2 <0)
  {
    x2= 0;
    
  }
     
}


void moveLPlank ( ) 
{
  x3=mouseX;
      
  
}

void moveLeaf ( ) 
{
  x4+=dx4;
  if (x4- (sz4/2) > width )
  {
    x4=-(sz4/2);
  }
  
  if (x4+ (sz4/2) <0)
  {
    x4=width+ (sz4/2);
    
  }
  
  y4+=dy4;
  if (y4- (sz4/2) > height )
  {
    y4=-(sz4/2);
  }
  
  if (y4+ (sz4/2) <0)
  {
    y4=height+ (y4/2);
    
  }
  
    
}


void checkCollision( )
{
  
  //pumpkin and planks
    if (y1-(sz1/2) <= y2+(h2/2) && (x1+(sz1-20.0)*0.5)>=x2-(w2*0.5) && x1-sz1/2<=x2+(w2/2))
  {
    dy1=-dy1;
    dx1=-random (0,3);
    
  }
  
  if (y1+((sz1-10)/2) >= y3-((h3+10)/2) && (x1+(sz1-20.0)*0.5)>=x3-(w3*0.5) && x1-sz1/2<=x3+(w3/2) )
  {
    dy1=-dy1;
    dx1=-random (0,3);
  }
  
  //pumpkin and leaf
  float d = dist( x1, y1, x4, y4 );
  float colDist = sz1/2 + sz4/2;
   if ( d <= colDist )
   {
     dx=dx1;
     dx1=dx4;
     dx4=dx;
     dy=dy1;
     dy1=dy4;
     dy4=dy;
     
     leaf++;
     
   }
  
  
}

void checkGameOver ( )
{
  
  if (y1>height || y1< 0)
  {
    textSize (18);
    fill (255);
    textAlign(CENTER);
    text ("'FALL' OUT ", width*0.5, height*0.5);
    text ("Press space to restart", width*0.5, height*0.5+15);
    noLoop ( );
  }
  
  
}


void keyPressed ( )
{
  if (key==' ')
  {
    
    x1=100;
    y1=100;
    dx1=random(2,6);
    dy1=random(2,6);
    loop ( );
  }
  
  if (key=='+')
    {
      dx4=dx4*1.1;
      dy4=dy4*1.1;
    }
    
    if (key=='-')
    {
      dx4=dx4*0.9;;
      dy4=dy4*0.9;
    }
  
  if (key == CODED) 
  {  
    if (keyCode==RIGHT)
    {
      x2=x2+10;
    }
    
    if (keyCode==LEFT)
    {
      x2=x2-10  ;
    }
    
    if (keyCode==UP)
    {
      dx1=dx1*1.1;
      dy1=dy1*1.1;
    }
    
    if (keyCode==DOWN)
    {
      dx1=dx1*0.9;;
      dy1=dy1*0.9;
    }
    
    
  }
  
}







