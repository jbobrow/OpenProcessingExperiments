
//Homework 6
//All right reserved to Chia-Fang Lue
//'X' rotates in the x axis in the positive direction.
//'x' rotates in the x axis in the negative direction.
//'Y' rotates in the y axis in the positive direction.
//'y' rotates in the y axis in the negative direction.
//'Z' rotates in the z axis in the positive direction.
//'z' rotates in the z axis in the negativee direction.
//Press left mouse button and move up and down changes the y translation,
//move left and right changes the x translation.
//Press right mouse button and move up and down changes the z translation.

float transX, transY, transZ;
float transDeltaX, transDeltaY, transDeltaZ;
float rotX, rotY, rotZ;
float rotDeltaX, rotDeltaY, rotDeltaZ;


void setup()
{
  size( 600, 600, P3D );
  background(150);
  transDeltaX = 0;
  transDeltaY = 0;
  transDeltaZ = 0;
  rotDeltaX = 0;
  rotDeltaY = 0;
  rotDeltaZ = 0;
}

void draw()
{
 background(150);
 pushMatrix();
 myPrepWindow();
 jabiPrepWindow();
 directionalLight(215, 239, 245, -1, 0, -1);
 directionalLight(215, 239, 245, 0, 1, -1);
 directionalLight(215, 239, 245, 1, 0, 0);
 drawInitial();

 popMatrix();
 showStats(); 
}

//My initial 
void drawInitial()
{
  fill( 68, 185, 216);
  stroke(255);
  strokeWeight(1);
  box( width*.1, width*.3, width*.1);
  translate(width*.1, width*.1, -width*.05 );
  box (width*.1, width*.1, width*.2);
  
}

void myPrepWindow() //what's the difference between myPrepWindow & jabiPrepWindow
{
  background(150);
  translate(transX, transY, transZ); 
  transX += transDeltaX;
  transY += transDeltaY;
  transZ += transDeltaZ;
  rotX += rotDeltaX;
  rotY += rotDeltaY;
  rotZ += rotDeltaZ;
  rotateX( radians (rotX));
  rotateY( radians (rotY));
  rotateZ( radians (rotZ));
  
  
}

void jabiPrepWindow()
{
  background(150);
  translate(width/2, height/2, 0);
  
  //the axis line
  /*strokeWeight(2);
  stroke(200, 200, 0);
  line(0, 0, 200, 0, 0, -200); //Z
  stroke(0, 200, 200);
  line(0, 200, 0, 0, -200, 0); //Y
  stroke(200, 0, 200);
  line( 200, 0, 0, -200, 0, 0); //X
  */
}

void showStats()
{
  pushMatrix();
  translate(0, 0, 0);
  textAlign( CENTER, BOTTOM);
  fill(30);
  textSize(16);
  text("Translation: ", width*.2, height*.8 );
  text( " X: " + round(transX), width*.3, height*.8);
  text( " Y: " + round(transY), width*.4, height*.8);
  text( " Z: " + round(transZ), width*.5, height*.8);
  text("Rotation:", width*.2, height*.85);
  text(" X: " + int(rotX%360), width*.3, height*.85);
  text(" Y: " + int(rotY%360), width*.4, height*.85);
  text(" Z: " + int(rotZ%360), width*.5, height*.85); 
  popMatrix();

}

void mouseDragged()
{
  if ( mouseButton == LEFT )
  {
    if (pmouseY > mouseY) 
    {
      transDeltaY =-1  ; // what does it mean?
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
  if ( key == 'X')
  { 
      rotDeltaX +=.1;
   }
   else if (key =='x')
   {
      rotDeltaX -=.1;
   }
   else if (key == 'Y')
   {
      rotDeltaY +=.1;
   }
   else if (key == 'y')
   {
      rotDeltaY -=.1;
   }
   else if (key == 'Z')
   {
      rotDeltaZ +=.1;
   }
   else if (key == 'z')
   {
      rotDeltaZ -=.1;
   }
  
   else if (key == ' ')
   {
    transX = 0;
    transY = 0;
    transZ = 0;
    transDeltaX = 0; 
    transDeltaY = 0;
    transDeltaZ = 0;
   }
  
  else if (key =='s')
  {
    rotX = 0;
    rotY = 0;
    rotZ = 0;
    rotDeltaX = 0;
    rotDeltaY = 0;
    rotDeltaZ = 0; 
  }
}




