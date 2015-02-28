
//import processing.opengl.*;
import peasy.*;

//classes-------------------------------------------------------------------------------------
PeasyCam cam;

//Data
PImage bg,img_01, img_02;

//Global
int resolution, imgWidth, imgHeight, lightX, lightY, lightZ, xResolution, yResolution, res = 0/*,constSize*/;
float b, blur;
PVector dotList[];
int currentImage = 1, startResolution, schwellenwert = 10;
boolean showImage = false, showImageColor = true, showGrid = true, blackBG = false;

void setup()
{
  colorMode (HSB, 360, 100, 100);
  size (720, 576, P3D);
  background (0,0,97);
  
    // IMG DATA ----------------------------------------------------------------
  bg = loadImage ("bg.png");
  img_01 = loadImage("malerei006.jpg");
  img_02 = loadImage("malerei018.jpg");
  //constSize = img_01.height;
  blur = 1.3;
  
  // Camera ----------------------------------------------------------------
  cam = new PeasyCam(this, width/2, height/2, 0,650);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(8000);
  
  setSetup();  
  setupDotList();
  createDots();
}

void draw()
{
  if (blackBG == false) background (bg); else background (5);
  setLights();
  if (showImage == false) createLook();
  if (showImage == true) showCurrentImage ();
}

void showCurrentImage ()
{
  float startForVideoX = width/2-imgWidth/2;
  float startForVideoY = height/2-imgHeight/2;
  image (img_01,startForVideoX,startForVideoY );
}


