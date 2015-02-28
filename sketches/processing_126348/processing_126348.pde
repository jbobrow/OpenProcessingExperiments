
// Brisa MP  Copy@left (2011) 

//import codeanticode.gsvideo.*;
import processing.video.*;                // MAC

//GSCapture cam;
Capture cam;                              // MAC


// variable random 
float x; 
float xx; 

float theta = 0.0;



void setup() {

  
  size(800,600,P3D);
  background(10);
  
  //cam = new GSCapture(this, 320, 240);
  cam = new Capture(this, 320, 240);        // MAC
  
   tint(200, 250, 250, 30); // luz, color , transparencia imagen 
   frameRate(5); // velocidad de la imagen
  
}

void draw() {
  
  translate(width/2, height/5);
  rotateY(theta);
  
  if (cam.available() == true) {
    
    
    cam.read();
    image(cam, 0, 0,width,height);
    theta += 0.02;
    
   

  }
  

}
