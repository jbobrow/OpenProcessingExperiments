

// HW_6
// copyright Yasha Mir
// October 1st 2013
// Exploring 3D with tools from the first five homeworks

//Directions

//'X' and 'x' to rotate on the X axis
//'Y' and 'y' to rotate on the Y axis
//'Z' and 'z' to rotate on the Z axis
//Space to reset location
//'s' to stop rotation
//Click the right mouse and drag to zoom
//Click the left mouse and drag to move
 
 
float transX        ; 
float transDeltaX   ; 
float rotX          ; 
float rotDeltaX     ; 
float transY        ;
float rotY          ;
float rotDeltaY     ;
float transZ        ;
float rotZ          ;
float rotDeltaZ     ;
float transDeltaConstant = 4;
String rot ;
String trans ;
 
 
void setup( )
{
   size( 600, 600, P3D );
 
   rotX = 0;
   rotY = 0;
   rotZ = 0;
   rotDeltaX = 0;
   rotDeltaY = 0;
   rotDeltaZ = 0;
   transX = 0;
   transY = 0;
   transZ = 0;
 
}
 
void draw( )
{
   pushMatrix( );
     jimsPrepareWindow( );
     yourPrepareWindow( );
     drawInitial( );
   popMatrix( );
 
   showStats( );
     
}
 
 
void drawInitial( )
{ 
     // remove the next four lines:
     fill( 200, 200, 0 );
     stroke( 0 );
     strokeWeight( 1 );
      
     // CENTER
     //center box
     pushMatrix();
       translate (0,0,0);
       box(50);
     popMatrix();
     // top 2 M
     pushMatrix();
       translate (-75,-75,0);
       box(50);
     popMatrix();
     pushMatrix();
       translate (+75,-75,0);
       box(50);
     popMatrix();
     // center 2 M
     pushMatrix();
       translate (-75,+25,0);
       box(50);
     popMatrix();
     pushMatrix();
       translate (+75,+25,0);
       box(50);
     popMatrix();   
          // last 2 M
     pushMatrix();
       translate (-75,+125,0);
       box(50);
     popMatrix();
     pushMatrix();
       translate (+75,+125,0);
       box(50);
     popMatrix(); 
      
     //FRONT
     //center box
     pushMatrix();
       translate (0,0,100);
       box(25);
     popMatrix();
     // top 2 M
     pushMatrix();
       translate (-75,-75,100);
       box(25);
     popMatrix();
     pushMatrix();
       translate (+75,-75,100);
       box(25);
     popMatrix();
     // center 2 M
     pushMatrix();
       translate (-75,+25,100);
       box(25);
     popMatrix();
     pushMatrix();
       translate (+75,+25,100);
       box(25);
     popMatrix();   
          // last 2 M
     pushMatrix();
       translate (-75,+125,100);
       box(25);
     popMatrix();
     pushMatrix();
       translate (+75,+125,100);
       box(25);
     popMatrix();
      
     //BACK
     //center box
     pushMatrix();
       translate (0,0,-100);
       box(25);
     popMatrix();
     // top 2 M
     pushMatrix();
       translate (-75,-75,-100);
       box(25);
     popMatrix();
     pushMatrix();
       translate (+75,-75,-100);
       box(25);
     popMatrix();
     // center 2 M
     pushMatrix();
       translate (-75,+25,-100);
       box(25);
     popMatrix();
     pushMatrix();
       translate (+75,+25,-100);
       box(25);
     popMatrix();   
          // last 2 M
     pushMatrix();
       translate (-75,+125,-100);
       box(25);
     popMatrix();
     pushMatrix();
       translate (+75,+125,-100);
       box(25);
     popMatrix();
        
}
 
void yourPrepareWindow( )
{
  directionalLight(130, 232, 91, 0, +1, -1);
   
  translate(transX,0,0);
  rotateX(radians(rotX));
  rotateX(radians(rotDeltaX));
  rotX+=rotDeltaX;
     
  translate(0,transY,0);
  rotateY(radians(rotY));
  rotateY(radians(rotDeltaY));
  rotY+=rotDeltaY;
   
  translate(0,0,transZ);
  rotateZ(radians(rotZ));
  rotateZ(radians(rotDeltaZ));
  rotZ+=rotDeltaZ;
     
}
 
 
void mouseDragged( )
{
  if (mouseButton == LEFT )
  {
     if (pmouseX < mouseX )
    {
      transX+=1;
    }
     else  if (pmouseX > mouseX ) 
     {
       transX-=1;
     }
     else if (pmouseY < mouseY )
    {
      transY+=1;
      println(transY);
    }
     
  else  if (pmouseY > mouseY ) 
    {
      transY-=1;
    }
   //else if (pmouseY < mouseY )  transY-=1; here is where the problem is 
  }
 
 else if (mouseButton == RIGHT)
   {
     if (pmouseY < mouseY )
     {
      transZ-=1;
     }
     else  if (pmouseY > mouseY ) 
     {
       transZ+=1;
     }
   }
}
 
void keyPressed( )
{
    if ( key == 'X' )  rotDeltaX+=.2;//2/10th of a degree rotation
    else if (key=='x') rotDeltaX-=.2;
    if ( key == 'Y' )  rotDeltaY+=.2;
    else if (key=='y') rotDeltaY-=.2;
    if ( key == 'Z' )  rotDeltaZ+=.2;
    else if (key=='z') rotDeltaZ-=.2; 
    if ( key == 's' ) 
    {
      rotDeltaX=rotDeltaX*0;
      rotDeltaY=rotDeltaY*0;
      rotDeltaZ=rotDeltaZ*0;
    }
    else if (key ==' ')
    {
      translate (0,0,0);    
    }   
} 
 
 
void showStats( )
{
  fill( 142,237,105 );
  textSize( 15 );
 
  rot = "Rotation (X= " + (rotX) + ", Y= " + (rotY) + ", Z= " + (rotZ) + ")";
  trans = "Translation (X= " + (transX) + ", Y= " + (transY) + ", Z= " + (transZ) + ")";
   
  text(rot, 160, 530,3);
  text(trans, 140, 550,5);  
}
 
 
void jimsPrepareWindow( )
{
    
    background( 0 ); 
    translate( width/2, height/2, 0 );
 
}



