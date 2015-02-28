
//HW 6
//Lincoln He Oct 1
//copyright Lincoln He, Carnegie Mellon University

float transX, transY, transZ;
float rotX, rotY, rotZ;
float rotDX,rotDY,rotDZ;
float transDX, transDY, transDZ;

void setup()
{
  size(600,600, P3D);
  rotDX=0;
  rotDY=0;
  rotDZ=0;
}

void draw()
{
  background(0);
  pushMatrix();
    jimsPrepareWindow( );
    myPrepwindow();
    //rotateX (radians(frameCount));
    drawInitial();
  popMatrix();
  showStats();
}

void drawInitial()
{
 
 fill(232,90,156);
 noStroke();
 sphere(width*.07);
 translate(width*.1, 0, -width*.07 );
 box (width*.1, width*.5, width*.1);
 translate(-width*.2, 0, width*.14 );
 box (width*.1, width*.5, width*.1);
 
}
 
void myPrepwindow()
{
  lights();
  directionalLight(51,102,126,-1,0,-1);
  
  rotX += rotDX;
  rotateX(radians(rotX));
   
  rotY += rotDY;
  rotateY(radians(rotY));
   
  rotZ += rotDZ;
  rotateZ(radians(rotZ));
  
  translate(transX, transY, transZ);
  transX += transDX;
  transY += transDY;
  transZ += transDZ;
  
}
 
 
 
void mouseDragged()
{
      if ( mouseButton == LEFT )
      {
          if (pmouseY > mouseY)
          {
            transY -= 1; 
          }
          else if (pmouseY < mouseY)
          {
            transY += 1;
          }
          else if (pmouseX < mouseX)
          {
            transX += 1;
          }
          else if (pmouseX > mouseX)
          {
            transX -= 1;
          }
      }
   
  else if (mouseButton == RIGHT)
        {
            if (pmouseY < mouseY)
            {
              transZ -= 1;
            }
            else if (pmouseY > mouseY)
            {
              transZ += 1;
            }
        }
}

void keyPressed()
{
    if ( key == 'X' )  rotDX+=.3;
    else if (key =='x') rotDX-=.3;
     
    if ( key == 'Y' )  rotDY+=.3;
    else if (key =='y') rotDY-=.3;
     
    if ( key == 'Z' )  rotDZ+=.3;
    else if (key =='z') rotDZ-=.3;
     
    if ( key == 's' ) 
    {
      rotX=0;
      rotDX=0;
      rotY=0;
      rotDY=0;
      rotZ=0;
      rotDZ=0;
    }
 
    if ( keyCode == ' ')
        {
        transX=0;
        transDX = 0;
        transY=0;
        transDY = 0;
        transZ=0;
        transDZ = 0;
        }
} 


void jimsPrepareWindow()
{
    // change these next two lines at your own risk -- to on... live dangerously... myhhhhaaaaaaaaaa
    background( 127,237,290 );  
    translate( width/2, height/2, 0 );
    
    /* remove the follow when you are done
    // draw axis lines
    strokeWeight( 3 );
    stroke( 200, 200, 0 ); 
    line( 0, 0, 200, 0, 0, -200 );  // Z axis line
    stroke( 0, 200, 200 );
    line( 0, 200, 0, 0, -200, 0 );  // Y axis line
    stroke( 200, 0, 200 );
    line( 200, 0, 0, -200, 0, 0 );  // X axis line
    */
}  
  
  
void showStats( )
{
   fill(108,41,144);
   textSize(11);
   textAlign(CORNER);
   text("ROTATION X:  " + int(rotX) + "  Y:  " + int(rotY) + "  Z:  " +int(rotZ),width*.05,height*.05);
   text("TRANSLATION X:  " + round(transX) + "  Y:  " + round(transY) + "  Z:  " + round(transZ),width*.05,height*.1); 
  
}






