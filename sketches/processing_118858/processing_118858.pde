
float transX, transY, transZ ;  // axis translation amounts
float rotX, rotY, rotZ         ;  // axis rotation amounts
float rotDeltaX, rotDeltaY, rotDeltaZ     ;  // amount of rotation change for each input

void setup()
{background(255);
  size(600,600, P3D);
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
     rachelPrepareWindow( );
     yourPrepareWindow( );
     drawInitial( );
   popMatrix( );
   lights();
   showStats( );
}

void drawInitial()
{
  noFill();
  stroke(255);
  strokeWeight(1.5);
  box(300,400,30);
  
  noStroke();
  fill(2, 50);
  translate(0, 0, 0);
  box(30, 200, 30);
  
  noStroke();
  fill(2, 50);
  translate(0, -100, 0);
  box(200, 30, 200);
  
  noStroke();
  fill(2,50);
  translate(-30,220,0);
  box(30,30,30);
  
  noStroke();
  fill(2,50);
  translate(-60,0,0);
  box(30,30,30);
  
  stroke(255,0,0);
  noFill();
  translate(30,30,0);
  box(30,30,30);
  
  noStroke();
  fill(255,0,0,80);
  translate(0,0,35);
  box(30,30,30);
  
  noStroke();
  fill(255,0,0,80);
  translate(0,0,-65);
  box(30,30,30);
  
  
}

void yourPrepareWindow( )
{
  directionalLight(250,250,250,300,300,300);
  translate(transX,0,0);
  translate(0,transY,0);
  translate(0,0,transZ);
  rotX += rotDeltaX;
  rotateX(radians(rotX));
    
  rotY += rotDeltaY;
  rotateY(radians(rotY));
    
  rotZ += rotDeltaZ;
  rotateZ(radians(rotZ));
}
  
// Expand this to satisfy the specificaions;
void mouseDragged( )
{
  if (mouseButton == LEFT )
{
     if (pmouseX < mouseX )
       {transX+=3;}
     if (pmouseX > mouseX )
       {transX-=3;}
     if (pmouseY > mouseY)
       {transY-=3;}
     if (pmouseY < mouseY)
       {transY+=3;}
}
   
  if (mouseButton == RIGHT )
{
    if (pmouseY > mouseY)
       {transZ+=3;}
    if (pmouseY < mouseY)
       {transZ-=3;}
}}
  
// Expand this to satisfy the specificaions:
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
     
     else if ( key =='s')
   {
    rotX = 0;
    rotY = 0;
    rotZ = 0;
    rotDeltaX=0;
    rotDeltaY=0;
    rotDeltaZ=0;
  }
}
  
// Change any part or all of this and expand it to
// satisfy the specifications:
void showStats( )
{
   fill( 0, 90);
   textSize( 24 );
   textAlign( CORNER );
   text("J", width*.5, height*.9);
   textSize( 12 );
   text("Rotation X: " + abs(round(rotX)) +  ", Y: " + abs(round(rotY)) +  ", Z: " + abs(round(rotZ)), width*.5, height*.95);
   text("Translation X: " + round(transX) +  ", Y: " + round(transY) +  ", Z: " + round(transZ), width*.5, height*.975);
}
  
  
void rachelPrepareWindow( )
{
  // change these next two lines at your own risk -- to on... live dangerously... myhhhhaaaaaaaaaa
    background( 200 );
    translate( width/2, height/2, 0 );
  }
