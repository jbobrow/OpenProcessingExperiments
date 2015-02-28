


//VIDEOSTUFF 1 //////////////////////////////////////////
import processing.video.*;
Capture camera;



//square et image

//PImage img;


void setup()
{
size (600,600);
//VIDEOSTUFF 2 //////////////////////////////////////////
  String[] devices = Capture.list();
  println(devices);
  
  
//VIDEOSTUFF 3 //////////////////////////////////////////
  camera = new Capture(this, 320, 240, devices[0]);



//img = loadImage("gbor01.jpg");
}

void draw()

{
  
  
  
  //VIDEOSTUFF 4 //////////////////////////////////////////
    if (camera.available()) {
    camera.read();
    

//VIDEOSTUFF 5 //////////////////////////////////////////
   //camera.filter(INVERT);
    image(camera, 160, 100);
  
  
image(camera,mouseX,mouseY,random(0,50),random(0,50));
}

}
void keyPressed()
{
   println(key);
  if (key =='s');// pour sauvegarder l image
saveFrame("pict######.png");
}


