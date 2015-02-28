
float transX, transY, transZ ;  // axis translation amounts
float rotX, rotY, rotZ         ;  // axis rotation amounts
float rotDeltaX, rotDeltaY, rotDeltaZ     ;  // amount of rotation change for each input

void setup()
{
  background(255);
  size(600, 600, P3D);
  transX=0;
  transY=0;
  transZ=0;
  rotX = 0;
  rotY = 0;
  rotZ= 0;
  rotDeltaX = 0;
  rotDeltaY = 0;
  rotDeltaZ = 0;
}

void draw( )
{
  pushMatrix( );
  danPrepareWindow( );
  yourPrepareWindow( );
  drawInitial( );
  popMatrix( );
  lights();
  showStats( );
}

void drawInitial()
{

  noStroke();
  fill(255, 100);
  translate(0, 0, 0);
  box(30, 200, 30);


  noStroke();
  translate(0, -100, 0);
  box(300, 40, 30);

  noStroke();
  translate(30, 220, 0);
  box(300, 40, 30);

  noStroke();
  translate(140, -90, 0);
  box(30, 200, 30);

  noStroke();
  translate( 0, -120, 0);
  box(30, 30, 30);
}

void yourPrepareWindow( )
{
  directionalLight(100, 100, 100, 300, 300, 300);
  translate(transX, 0, 0);
  translate(0, transY, 0);
  translate(0, 0, transZ);
  rotX += rotDeltaX;
  rotateX(radians(rotX));

  rotY += rotDeltaY;
  rotateY(radians(rotY));

  rotZ += rotDeltaZ;
  rotateZ(radians(rotZ));
}


void mouseDragged( )
{
  if (mouseButton == LEFT )
  {
    if (pmouseX < mouseX )
    {
      transX+=3;
    }
    if (pmouseX > mouseX )
    {
      transX-=3;
    }
    if (pmouseY > mouseY)
    {
      transY-=3;
    }
    if (pmouseY < mouseY)
    {
      transY+=3;
    }
  }

  if (mouseButton == RIGHT )
  {
    if (pmouseY > mouseY)
    {
      transZ+=3;
    }
    if (pmouseY < mouseY)
    {
      transZ-=3;
    }
  }
}


void keyPressed( )
{
  if ( key == 'X' )  
    rotDeltaX+=.1;
  else if (key =='x')
    rotDeltaX-=.1;

  if ( key == 'Y' ) 
    rotDeltaY+=.1;
  else if (key =='y') 
    rotDeltaY-=.1;

  if ( key == 'Z' )  
    rotDeltaZ+=.2;
  else if (key =='z') 
    rotDeltaZ-=.2;

  else if ( key == ' ')
  {
    transX= 0;
    transY= 0;
    transZ= 0;
  }

  else if ( key =='b')
  {
    rotX = 0;
    rotY = 0;
    rotZ = 0;
    rotDeltaX=0;
    rotDeltaY=0;
    rotDeltaZ=0;
  }
}

void showStats( )
{
  fill( 255, 100);
  textSize( 20 );
  textAlign( CORNER );
  text("D", width*.5, height*.9);
  textSize( 10 );
  text("Rotation X: " + abs(round(rotX)) +  ", Y: " + abs(round(rotY)) +  ", Z: " + abs(round(rotZ)), width*.5, height*.95);
  text("Translation X: " + round(transX) +  ", Y: " + round(transY) +  ", Z: " + round(transZ), width*.5, height*.975);
}


void danPrepareWindow( )
{

  background( 50, 100 );
  translate( width/2, height/2, 0 );

  strokeWeight( 5 );
  stroke( 100, 10);
  line( 0, 0, 200, 0, 0, -200 );  // Z axis line
  stroke( 255, 90 );
  line( 0, 200, 0, 0, -200, 0 );  // Y axis line
  stroke( 255, 90 );
  line( 200, 0, 0, -200, 0, 0 );  // X axis line
}

