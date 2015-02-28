
//hw10 CMU 48-575 copywrite Zack Jacobson-Weaver 2011
// User Input keys: A  C  Z  X  S  Up  Down  Left  Right
//A: moves the figure away
//C: moves the figure closer
//Z: moves the figure away 500 pixels
//X: moves the figure back to previous Z location
//S: stops all motion
//Up: Moves the figure up
//Down: Moves the figure down
//Left: Moves the figure left
//Right: Moves the figure right (duh!)
//Three Sliders: Rotate the figure on X,Y, and Z axes
//Stop and Reset Buttons:  I think you'll figure these out.
// CLUE: Try holding the mouse down and crossing over the
//       all three sliders.  Great effects.  Enjoy!
color  col;

float x,y,z,deltaX,deltaY,deltaZ,previousZ,
rotX,rotY,rotZ;

int xbarX, xbarY, xbarWd, xbarHt;
int ybarX, ybarY, ybarWd, ybarHt;
int zbarX, zbarY, zbarWd, zbarHt;

int stopX, stopY;
int resetX,resetY;
int butnSize;

int alphaZ = 100;




void setup()
{
   size(600,600,P3D);
  
   background(0,0,0,10);
   lights();
 
   col= color(random( 256),random( 256),random( 256));
   
   x= 0;
   y= 0;
   z= 0;
   
   previousZ=0;
   deltaX = 0;
   deltaY = 0;
   deltaZ = 0;
   
   xbarX = int(width*.97); 
   xbarY = int(height*.59);
   xbarWd = int(width*.02);
   xbarHt = int(height*.4);
   
   ybarX = int(width*.94); 
   ybarY = int(height*.59);
   ybarWd = int(width*.02);
   ybarHt = int(height*.4);
   
   zbarX = int(width*.91); 
   zbarY = int(height*.59);
   zbarWd = int(width*.02);
   zbarHt = int(height*.4);
   
   stopX = int(width*.95); 
   stopY = int(height*.3);
   resetX = int(width*.91);
   resetY = int(height*.4);
   butnSize = int(width*.08);
   
   
  
  
}

void draw()
{

  resetStopButtons();
  
  xSlider(xbarX, xbarY, xbarWd, xbarHt);
  ySlider(ybarX, ybarY, ybarWd, ybarHt);
  zSlider(zbarX, zbarY, zbarWd, zbarHt);
  
  stats();
  
  mapMouseX( );
  mapMouseY( );
  mapMouseZ( );
  
  gameBoard( );
  drawZ();
  
  translateZ();
  rotatez();
  
  buttonsActive();
  
  
  
  
}


void drawZ()
{
  translate(width/2,height/2,0);
  rotateX(rotX/57);
  rotateY(rotY/57);
  rotateZ(rotZ/57);
  noStroke();
  fill(col,random(256), 0, 30);
  lights();
  translate(x ,y , z);
  sphere(height/10);
  fill(col*3,random(256),random(256) , alphaZ);
  translate(x-width/8,y+height/8,z-height/8);
  sphere(height/8);
  fill(random(256),random(256),col*2 , alphaZ);
  translate(x + width/8,y + height/8,z + height/8);
  sphere(height/8);
  fill(random(256),col, col*4, alphaZ);
  translate(x + width/8,y + height/8,z + height/8);
  sphere(height/8);
  fill(random(256),random(256), col*5, alphaZ);
  translate(x + width/200,y -height/2.2,z + height/20);
  sphere(height/10);
  fill(col*6,random(256),255 , alphaZ);
  translate(x - width/8,y - height/8,z - height/8);
  sphere(height/11);
  fill(255,random(256), col*7, alphaZ);
  translate(x - width/8,y - height/8,z - height/8);
  sphere(height/12);
  fill(col*8,random(256), 0, alphaZ);
  translate(x - width/8,y - height/8,z - height/8);
  sphere(height/13);
}


// Clears the background each time thru the loop
void gameBoard( )
{
  noStroke();
  fill( 0, 0, 0, 5 );
  rect(0,0,width,height);
}

void resetStopButtons()
{
  fill(255,0,0,20);
  ellipse(stopX,stopY,butnSize,butnSize);
  fill(255,20);
  ellipse(stopX,stopY,butnSize*.8,butnSize*.8);
  fill(255,0,0);
  ellipse(stopX,stopY,butnSize*.6,butnSize*.6);
  
  rectMode(CORNER);
  fill(3,200,11,20);
  rect(resetX ,resetY,butnSize,butnSize);
  fill(255,20);
  rect(resetX + butnSize*.1,resetY+ butnSize*.1,butnSize*.8,butnSize*.8);
  fill(3,210,11);
  rect(resetX + butnSize*.2,resetY + butnSize*.2,butnSize*.6,butnSize*.6);
  textSize(36);
  fill(196,240,199);
  text("=", resetX + butnSize*.22 , resetY+ butnSize*.73);
  
}

boolean stopButton(float x, float y, float wd, float ht)
{
  if (mouseX >= x && mouseX <= x+wd &&
    mouseY >= y && mouseY <= y+ht) {
    return true;
  }
  else {
    return false;
  }
}

boolean resetButton(float x, float y, float wd, float ht)
{
  if (mouseX >= x && mouseX <= x+wd &&
    mouseY >= y && mouseY <= y+ht) {
    return true;
  }
  else {
    return false;
  }
  
}

void buttonsActive()
{
  if (mousePressed && stopButton(stopX-10, stopY-10, butnSize +10, butnSize +10) == true)
  {
    deltaX = 0;
    deltaY = 0;
    deltaZ = 0;
    
    
  }
  else if (mousePressed && resetButton(resetX, resetY, butnSize, butnSize) == true) 
  {
    deltaX = 0;
    deltaY = 0;
    deltaZ = 0;
    x = 0;
    y = 0;
    z = 0;
    rotX = 0;
    rotY = 0;
    rotZ = 0;
  }
}




void xSlider(int xbarX, int xbarY, int xbarWd, int xbarHt)
{
  noStroke();
  fill(4,27,147,10);
  rect(xbarX,xbarY,xbarWd,xbarHt);
  
  stroke( 255, 255, 0 );
  strokeWeight( 5 );
  float y = map( rotX, -360, 360, xbarY- xbarHt/2 + 5, xbarY + xbarHt/2 - 5);
  line (xbarX, y + xbarHt/2, xbarX + xbarWd,y + xbarHt/2);
 
  fill( 255, 255, 0 ); 
  textSize(18);
  text("X",xbarX+2,xbarY,0); 
}

void mapMouseX( )
{
  if(mousePressed && mouseX >= xbarX && mouseX <= xbarX + xbarWd && mouseY > zbarY - 5)
  {
     rotX = int( map( mouseY, xbarY, xbarY + xbarHt, -360, 360 ) ); 
     if ( rotX < -360 )
     {
         rotX = -360; 
     }
     else if ( rotX > 360 )
     {
         rotX = 360 ; 
     }
     
     rotX =  rotX ;
     
     fill( 255, 255, 0 ); 
     textSize(18);
     text("X rotation =" + int (rotX), zbarX -100, zbarY- 20, 0);
  } 
}


void ySlider(int ybarX, int ybarY, int ybarWd, int ybarHt)
{
  noStroke();
  fill(4,27,147,10);
  rect(ybarX,ybarY,ybarWd,ybarHt);
  
  stroke( 255, 255, 0 );
  strokeWeight( 5 );
  float y = map( rotY, -360, 360, ybarY- ybarHt/2 + 5, ybarY + ybarHt/2 - 5);
  line (ybarX, y + ybarHt/2, ybarX + ybarWd,y + ybarHt/2);
 
  fill( 255, 255, 0 ); 
  textSize(18);
  text("Y",ybarX+2,ybarY,0); 
}

void mapMouseY( )
{
  if(mousePressed && mouseX >= ybarX  && mouseX <= ybarX + ybarWd && mouseY > zbarY - 5 )
  {
     rotY = int( map( mouseY, ybarY, ybarY + ybarHt, -360, 360 ) ); 
     if ( rotY < -360 )
     {
         rotY = -360; 
     }
     else if ( rotY > 360 )
     {
         rotY = 360 ; 
     }
     
     rotY =  rotY ;
     
     fill( 255, 255, 0 ); 
     textSize(18);
     text("Y rotation =" + int (rotY), zbarX -100, zbarY- 20, 0);
  } 
}


void zSlider(int zbarX, int zbarY, int zbarWd, int zbarHt)
{
  noStroke();
  fill(4,27,147,10);
  rect(zbarX,zbarY,zbarWd,zbarHt);
  
  stroke( 255, 255, 0 );
  strokeWeight( 5 );
  float y = map( rotZ, -360, 360, zbarY- zbarHt/2 + 5, zbarY + zbarHt/2 - 5);
  line (zbarX, y + zbarHt/2, zbarX + zbarWd,y + zbarHt/2);
 
  fill( 255, 255, 0 ); 
  textSize(18);
  text("Z",zbarX+2,zbarY,0); 
}

void mapMouseZ( )
{
  if(mousePressed && mouseX >= zbarX  && mouseX <= zbarX + zbarWd && mouseY > zbarY - 5 )
  {
     rotZ = int( map( mouseY, zbarY, zbarY + zbarHt, -360, 360 ) ); 
     if ( rotZ < -360 )
     {
         rotZ = -360; 
     }
     else if ( rotZ > 360 )
     {
         rotZ = 360 ; 
     }
     
     rotZ =  rotZ ;
     
     fill( 255, 255, 0 ); 
     textSize(18);
     text("Z rotation =" + int (rotZ), zbarX -100, zbarY- 20, 0);
  } 
}


//Allows for movement of all objects with x,y,z coordinates
//using delta'N'.  delta'N' is defined below with key input
void translateZ()
{
  x = x + deltaX;
  y = y + deltaY;
  z = z + deltaZ;
}


//Allows for rotation of elements using x,y,z variable for
//screen location
void rotatez()
{
  translate(width/2, height/2, 0);
  rotateY(radians(rotY));
  rotateX(radians(rotX));
  rotateZ(radians(rotZ));
}


void stats()
{
  textSize(14);
  fill( 255, 255, 0 );
  text("Location", width - width*.1,20) ;
  text("X: " + int(x), width - width*.1,35);
  text("Y: " + int(y), width - width*.1,50);
  text("Z: " + int(z), width - width*.1,65);
  
  text("Speed", width - width*.1,90) ;
  text("X: " + abs (int(deltaX)), width - width*.1,105);
  text("Y: " + abs (int(deltaY)), width - width*.1,120);
  text("Z: " + abs (int(deltaZ)), width - width*.1,135);
}
 
  
// bars for all key press inputs  
  void keyPressed()
{
  if (keyPressed && key == ' ')//space bar
  {
    x = 0;
    y = 0;
    z = 0;
    deltaX = 0;
    deltaY = 0;
    deltaZ = 0;
    rotX = 0;
    rotY = 0;
    rotZ = 0;
  }
   if (key == 'a')
  {
   deltaZ = deltaZ - 1; 
  }
   else if (key == 'c')
  {
    deltaZ = deltaZ + 1;
  }
   else if (key == 's')
  {
    deltaX = 0;
    deltaY = 0;
    deltaZ = 0;
  }
   else if (key == 'z')
  {
    deltaZ = 0;
    previousZ = z;
    z = -500;
  }
   else if (key == 'x')
  {
   z = previousZ;
  }
  
   if (keyCode == UP)
  {
    deltaY = deltaY - 1;
  } 
   else if(keyCode == DOWN)
  {
    deltaY = deltaY + 1;
  }
   else if(keyCode == RIGHT)
  {
    deltaX = deltaX + 1;
  }
   else if(keyCode == LEFT)
  {
    deltaX = deltaX - 1;
  }
}
  
 
  


