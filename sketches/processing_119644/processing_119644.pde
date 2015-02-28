
//Sam Friedlander
//Copywrite october 10th 2013
//bounce and wrap

float x1,y1, sz1, dx1, dy1;
float x2, y2,sz2,dx2, dy2;
float travangle;
color col1, col2;

void setup()
{ 
  size (600,600);
  
  x1 = random(50,width-50);
  y1 = random(50,height-50);
  sz1= random (80,120);
  dx1 = random(1, 4);
  dy1 = random(1,4);
  col1 = color (0);
 
  
  x2 = random(50,width-50);
  y2 = random(50,height-50);
  sz2= random (40,60);
  dx2 = random(1, 4);
  col2 = color (0);
  
  travangle = random (0,3);
  
  
}

void draw()
{
prepWindow( );
  moveFig1( );
 drawFig1( );
  moveFig2( );
 drawFig2( );
checkCollision( );
   
}

void checkCollision()
{
  float d =dist(x1,y1,x2,y2);
  float colision = sz1/2 + sz2/2;
  if (d < (colision))
  {
  float temp = dx1;
  dx1 = dx2;
  dx2 = temp;
  
  temp = dy1;
  dy1=dy2;
  dy2= temp;
  }

  
}

void prepWindow()
{
  fill(230,90);
  rect(0,0,width,height);
  
}
  
void moveFig1( )
{
   x1 += dx1;
   y1 += dy1;
   if ( x1+(sz1/2) > width || x1-(sz1/2) < 0 )
   { 

     dx1 = -dx1; 
   }   
   
   if ( y1+(sz1/2) > height || y1-(sz1/2) < 0 )
   { 

     dy1 = -dy1; 
   }   
}

void moveFig2( )
{
  
   y2 += dy2;
   x2 += dx2;
   if ( y2-(sz2/2) > height ) 
   {y2 = 0;
 } else if (y2+(sz2/2) < 0)
 {
   y2 = height -(sz2/2);
 }
 
 
  if ( x2-(sz2/2) > width ) 
   {x2 = 0;
 }  else if (x2+(sz2/2) < 0)
 {
   x2 = width -(sz2/2);
 }
 
 
}
 
 
void drawFig1( )
{
  float eye = frameCount % 60;
  noFill();
  strokeWeight(.005);
  stroke(col1);
  pushMatrix();
  translate(x1,y1);
  rotate(radians(frameCount/2));
  
 if (eye <= 30)
 {
   arc(0, 0, sz1, sz1/2-(eye*2), 0, PI, OPEN);
    arc(0, 0, sz1, sz1/2-(eye*2), PI, 2*PI, OPEN);
     ellipse(0,0,sz1/2-(eye*2),sz1/2-(eye*2));
 } else
 {
  arc(0, 0, sz1, (sz1/20)-(sz1/20-eye), 0, PI, OPEN);
    arc(0, 0, sz1,(sz1/20)- (sz1/20-eye), PI, 2*PI, OPEN);
     ellipse(0,0,(sz1/20)-(sz1/20-eye), (sz1/20)-(sz1/20-eye));
 }
  ellipse(0,0,sz1,sz1);
  
  popMatrix();
}

void drawFig2()
{
   
  noFill();
  strokeWeight(.005);
  stroke(col1);
  pushMatrix();
  translate(x2,y2);
  rotate(radians(frameCount/2));
  
   arc(0, 0, sz2, sz2/2, 0, PI, OPEN);
    arc(0, 0, sz2, sz2/2, PI, 2*PI, OPEN);
  ellipse(0,0,sz2,sz2);
   ellipse(0,0,sz2/2,sz2/2);
   popMatrix();
}

void keyPressed ()

{
  if (key == 'r')
  {
   x1 = random(25,width-50);
  y1 = random(25,width-50);
  sz1= random (60,120);
  dx1 = random(2, 4);
  dy1 = random(2,6);
  col1 = color (0);
 
  
  x2 = random(25,width-50);
  y2 = random(25,width-50);
  sz2= random (50,60);
  dx2 = random(2, 5);
  col2 = color (0); 
  
  }
  if (keyCode == DOWN)
  {
    dy1++;
  }
  if (keyCode == UP)
  {
    dy1--;
  }
  if (keyCode == RIGHT)
  {
    dx1++;
  }
  if (keyCode == LEFT)
  {
    dx1--;
  }
  
   if (key == 's')
  {
    dy2++;
  }
  if (key == 'w')
  {
    dy2--;
  }
  if (key == 'd')
  {
    dx2++;
  }
  if (key == 'a')
  {
    dx2--;
  }
  
}




