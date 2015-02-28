
//Sam Friedlander
//COPYWRITE nov 6 2013
// saw the eye game: you can only colide 
//with the eye if the saw is fast enough
//get 10 CARNAGE hits to kill the beast 
//(this is the visually dramatic encounter feedback)

//use W,A,S,D to move the saw
//use E, to speed up saw
//use Q, to slow down saw
//use F, to stop moving, but be weary it will slow down the saw
//use R, to reset

float x1,y1, sz1, dx1, dy1;
float x2, y2,sz2,dx2, dy2;
float rotspeed, carnage, z;
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
  
  rotspeed= 2;
  carnage=0;
  z = 500;
  
  
  
}

void draw()
{
prepWindow( );
  theEye();
  moveFig2( );
 drawFig2( );
checkCollision( );
showCarnage();
showTime();
killeye();
println(rotspeed);
   
}

void theEye()
{
  if (carnage<10)
  {
  moveFig1( );
 drawFig1( );
  }
}

void killeye()
{
  if (carnage > 10 && z>0)
  {
  pushMatrix();
    translate (width/2, height/2);
    noFill();
    ellipse(0, 0, width/2, height/2);
    line(width*-.10,0 , width*.10, height*-.10);
    line(width*-.10,height*-.10, width*.10, 0);
   
    arc(0,40,50,50,PI,TWO_PI);
    popMatrix();
    text ("YOU KILLED THE BEAST", width*.4, height/6);
    z--;
  }
  else if (z==0)
  {
    carnage=0;
    z=500;
  }
}

void showCarnage()
{

  fill (0);
  text ("CARNAGE:    " + carnage, width*.35, height*.98);
 
}
 
void showTime()
{
  fill (0);
  text ("TIME: " + millis()/1000, width*.2, height*.98);
  fill(255);
}


void checkCollision()
{
  float d =dist(x1,y1,x2,y2);
  float colision = sz1/2 + sz2/2;
  if (d < (colision) && rotspeed<.125)
  {
  float temp = dx1;
  dx1 = dx2;
  dx2 = temp;
  
  temp = dy1;
  dy1=dy2;
  dy2= temp;
  carnage++;
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
  rotate(radians(frameCount/rotspeed));
  
   arc(0, 0, sz2, sz2/2, 0, PI, OPEN);
    arc(0, 0, sz2, sz2/2, PI, 2*PI, OPEN);
    arc(0, 0, sz2/2, sz2, 0, PI, OPEN);
    arc(0, 0, sz2/2, sz2, PI, 2*PI, OPEN);
  
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
  if (key == 'f')
  {
    dx2 = 0;
    dy2 = 0;
    rotspeed = 2;
  }
  if (key == 'e')
  {
    rotspeed = rotspeed*.5;
    
  }
   if (key == 'q')
  {
    rotspeed = rotspeed/.5;
    
  }
}




