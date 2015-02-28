
//Lauren Ruoff copyright 2014 
//lruoff
//Homework 6

//if keyPressed is "X" = x axis rotation delta increased in the positive direction
//if keyPressed is "x" = x axis rotation delta increased in the negative direction
//if keyPressed is "Y" = y axis rotation delta increased in the positive direction
//if keyPressed is "y" = y axis rotation delta increased in the negative direction
//if keyPressed is "Z" = z axis rotation delta increased in the positive direction
//if keyPressed is "z" = z axis rotation delta increased in the negative direction
//if keyPressed is 's' or 'S' = All rotation deltas are set to zero and rotations stop
//if keyPressed is " " = All translation variables are set to zero BUT rotations continue

/*mouseButton == LEFT && mouse is dragged rightward
    x translation is increased -- initial moves to the right
    
  mouseButton == LEFT && mouse is dragged leftward
    x translation is decreased – Initial moves to the left
    
  mouseButton == LEFT && mouse is dragged upward
    y translation is decreased -- initial moves up
    
  mouseButton == LEFT && mouse is dragged downward
    y translation is increased – Initial moves down
    
  mouseButton == RIGHT && mouse is dragged upward
    z translation is decreased -- initial moves closer
    
  mouseButton == RIGHT && mouse is dragged downward
    z translation is decreased – Initial moves away */
    
// global variables

float transX, transY, transZ               ;  // SX xis translation amounts
float rotX, rotY, rotZ                      ;  // X axis rotation amounts
float rotDeltaX, rotDeltaY, rotDeltaZ       ;  // amount of X axis rotation change for each input
float r, g, b;


void setup( )
{
   size( 600, 600, P3D );
   textSize( 24 );
   textAlign( CENTER );
   noStroke();
   
   rotDeltaX  = 0;  
   rotDeltaY = 0;
   rotDeltaZ = 0;
}

void draw( )
{
   pushMatrix( );
     jimsPrepareWindow( );
     yourPrepareWindow( );
     drawInitial( );
   popMatrix( );
   // The pushMatrix( ) / popMatrix( ) pair are used
   // so the stats will always be drawn in the same place on
   // the graphics window.
   showStats( );  
}

void drawInitial( )
{  
  fill(255, 100, 100);
//vertical L
   pushMatrix();
     translate(0, -60, 0);
     box(50, 200, 50);
  popMatrix(); 
 //horizontal L 
  pushMatrix();
    translate(75, 25, 0);
    box(100, 30, 50);
  popMatrix();  
//top serifs
  pushMatrix();
    translate(0, -145, 0);
    box(90, 30, 50);
  popMatrix();
//bottom left serif
  pushMatrix();
    translate(-35, 25, 0);
    box(20, 30, 50);
  popMatrix();
//right serif
  pushMatrix();
    translate(110, -10, 0);
    box(30, 40, 50);
  popMatrix();
  
 fill(200, 200, 0);
 //border
   pushMatrix();
     translate(0, -50, 50);
     box(5, 145, 4);
   popMatrix();
   pushMatrix();
     translate(40, 25, 50);
     box(120, 5, 4);
   popMatrix();     
} 


void yourPrepareWindow( )
{
  translate( transX, transY, transZ );
  rotX += rotDeltaX;
  rotateX( radians( rotX ) );
  rotY += rotDeltaY;
  rotateY( radians(rotY));
  rotZ += rotDeltaZ;
  rotateZ( radians(rotZ)); 
}


void mouseDragged( )
{ 
  if (mouseButton == LEFT ){
     if (pmouseX < mouseX )
       { transX += 1; }
        
     if ( pmouseX > mouseX )
       { transX -= 1; }
       
     if ( pmouseY < mouseY )
       { transY += 1; }
       
     if (pmouseY > mouseY)
       { transY -= 1; }
  }
       
   if (mouseButton == RIGHT ){
     if(pmouseY < mouseY)
       { transZ += 1; }
       
     if(pmouseY > mouseY)
       { transZ -= 1; }
   }
} 


void keyPressed( )
{
    if ( key == 'X' )
      { rotDeltaX += 1; }
      
    if (key == 'x')
      { rotDeltaX -=1; }
      
    if (key == 'Y')
      { rotDeltaY +=1; }
      
    if (key == 'y')
      { rotDeltaY -=1; }
    
    if (key == 'Z')
      { rotDeltaZ +=1; }
    
    if (key == 'z')
      { rotDeltaZ -=1; }
      
    if (key == 's' || key == 'S')
      { rotDeltaZ = 0;
        rotDeltaY = 0;
        rotDeltaX = 0;
      }
    if (key == ' ') 
      { transX = 0;
        transY = 0;
        transZ = 0;
      }
}


void showStats( )
{
   fill( 255 ); 
   text("Rotations",  width*.5, height*(.05));
   text("X: "+ rotX + "  Y: " + rotY + "  Z: " + rotZ, width*.5, height*(.1));
   text("deltaX: " + rotDeltaX + "  deltaY: " + rotDeltaY + "  deltaZ: " + rotDeltaZ, width*.5, height*(.15));
   text("Translations", width*.5, height*(.9));
   text("X: " + transX + "  Y: " + transY + "  Z: " + transZ, width*.5, height*(.95)); 
}


void jimsPrepareWindow( )
{
    // change these next two lines at your own risk --  do so and... live dangerously... myhhhhaaaaaaaaaa
    background( 0 );  
    // moves (0, 0, 0 ) point to the window center
    translate( width/2, height/2, 0 );
   
    directionalLight( 255, 255, 255, 0, 0, -1 );
} 


