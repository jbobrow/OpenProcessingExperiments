
//import processing.opengl.*;
 
//import processing.core.*;
public Robot robot;
PImage img;

void setup()
{
 colorMode(RGB,255);
 hint(ENABLE_OPENGL_4X_SMOOTH);
 
 hint(DISABLE_OPENGL_ERROR_REPORT);
 loadPixels();
 textureMode(NORMALIZED);
 frameRate(30);
 size(255,255,P3D);    //OPENGL does not display correctly
 
 
 
   textureMode(NORMALIZED);
   try
{
 
 robot = new Robot();
BufferedImage bufferedImage = robot.createScreenCapture(
new Rectangle(new Dimension(screen.width, screen.height)));
 
img   = new PImage(bufferedImage);

 
}
catch (AWTException e) {
e.printStackTrace();
}
 

}

void draw(){
  BufferedImage bufferedImage = robot.createScreenCapture(
new Rectangle(new Dimension(screen.width, screen.height)));
 
img   = new PImage(bufferedImage);
 image(img,0,0); 
}

