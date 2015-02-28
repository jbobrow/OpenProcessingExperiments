

//-----------------------------------------------------------------------------
// sketch:   PG_ConicalCameraMove.pde
// descr.:   Demonstrate conical camera steering using key and mouse input.
// note:     At the moment it's not possible to do it with PEasyCam.
// date:     v1.0  2011-11-28
// links:    https://forum.processing.org/topic/peasycam-conical-movement
//
// Press left mouse button to rotate object.
// Press right mouse button to zoom object.
// key commands:
//   left/right   rotate object left/right
//     up/down    turn object up/down
//     + / -      zoom in/out
//     blanc      animation rotation right/left/off
//-----------------------------------------------------------------------------
import processing.opengl.*;   // use opengl for 3d-graphics

// camera steering and viewing
float zoom = 0.0;
float horizontalAngle = 0.0;
float verticalAngle = PI/4;
int spinCamera = 1;
// speed
float zoomSpeedCamera = 400;   
float rotationSpeedCamera = 0.2; // radiants per second
float rotationSpeedObject = 2.0;

//--------------------------------------------------------
void changeHorizontalAngle (float deltaAnglePerSecond)  // 0° .. 360°
{ 
  horizontalAngle += deltaAnglePerSecond / frameRate;
  if (horizontalAngle > 2*PI) horizontalAngle -= 2*PI;
  if (horizontalAngle < 0) horizontalAngle += 2*PI;
}
//--------------------------------------------------------
void changeVerticalAngle (float deltaAnglePerSecond)  // -90° .. +90°°
{ 
  verticalAngle = constrain(verticalAngle + deltaAnglePerSecond / frameRate, -PI/2, +PI/2);
}
//--------------------------------------------------------
void changeZoom (float deltaValuePerSecond)
{ 
  zoom = constrain (zoom + deltaValuePerSecond / frameRate, -300, 222);
}
//--------------------------------------------------------
void keyPressed() 
{
  switch (key)
  {        case ' ': spinCamera = (spinCamera+2)%3-1; 
    break; case '+': changeZoom (zoomSpeedCamera);
    break; case '-': changeZoom (-zoomSpeedCamera);
  }  
  switch (keyCode)
  {        case  LEFT: changeHorizontalAngle (+rotationSpeedObject);
    break; case RIGHT: changeHorizontalAngle (-rotationSpeedObject);
    break; case    UP: changeVerticalAngle (+rotationSpeedObject);
    break; case  DOWN: changeVerticalAngle (-rotationSpeedObject);
    break; case    33: changeZoom (+zoomSpeedCamera);   // pageUp
    break; case    34: changeZoom (-zoomSpeedCamera);   // pageDown
  }
}
//--------------------------------------------------------
void setup()
{
  size (640, 480, !online ? OPENGL : P3D);
  smooth();
  stroke(44);
  strokeWeight(2);
}
//--------------------------------------------------------
void draw()
{
  background(127);
  fill(255,188);
  if (spinCamera != 0) changeHorizontalAngle (spinCamera * rotationSpeedCamera);
  if (mousePressed)
  { if (mouseButton == LEFT)
    { changeHorizontalAngle (0.2 * (mouseX - pmouseX));
      changeVerticalAngle (0.2 * (mouseY - pmouseY));
      fill(255,255,222, 122);
    }
    else if (mouseButton == RIGHT)
    {
      spinCamera = int(5.0*(mouseX - width/2)/width);
      changeZoom ((mouseY - pmouseY) * 0.15 * zoomSpeedCamera);
  }}
  pushMatrix();
    translate(width/2, height/2, zoom);
    rotateX(-verticalAngle);
    rotateY(horizontalAngle);
    //drawings
    box(200,40,180);  
    translate (111,0,80); 
    box(20,40,20);
  popMatrix();
  
  textMode(SCREEN);
  fill(255);
  text("use cursor keys, +/- or mouse to change view."
  + "   h="+int(degrees(horizontalAngle)) 
  + "°   v="+int(degrees(verticalAngle))  
  + "°   z="+int(zoom)
  + "   spin=" + spinCamera, 8,16);
  text(int(frameRate+0.5) + " fps", width - 50, 16);
}


