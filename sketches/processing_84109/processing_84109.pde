
import hypermedia.video.*; 
import gifAnimation.*;     
import java.awt.Rectangle;

final static int SCALE = 4;
 
OpenCV cam;
PImage[] frames;
boolean paused;
boolean active;
 
void setup()
{
  size(320, 240);
  cam = new OpenCV();
  cam.capture(width / SCALE, height / SCALE);
  cam.cascade("haarcascade_frontalface_default.xml");
  frames = Gif.getPImages(this, "H.gif");
  active = true;
  
  
}
 
void draw()
{
  cam.read();
  cam.flip(OpenCV.FLIP_HORIZONTAL);
  image(cam.image(), 0, 0, width, height);
  tint(mouseX,mouseY,150,100);
  if(!active) return;
  Rectangle[] faces = cam.detect();
  for(int i = 0; i < faces.length; i++)
  {
    Rectangle face = faces[i];
    int r = SCALE * (face.width + face.height) / 2;
    int x = SCALE * (int)face.getCenterX() - r / 2;
    int y = SCALE * (int)face.getCenterY() - r / 2;
    PImage img = frames[frameCount % frames.length];
    image(img, x, y, r, r);
  }
}
 
void keyPressed()
{
  if(key == ' ') active = !active;
  if(key == 'P' || key == 'p')
  {
    if(!(paused = !paused)) loop();
    else noLoop();
  }
}



