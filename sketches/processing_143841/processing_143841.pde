
import processing.video.*;

Capture cam;

void setup() {
  size(800, 800);
  cam = new Capture(this,300,300,15);
  background(255);

  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // Initialize Camera
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }      
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  
  
    // Tinting using mouse location
  tint(255 - mouseY,255 - mouseX,255);


  // Multiple Cam
  image(cam,0,0,mouseX,mouseY); 
  image(cam,20,20,mouseX,mouseY); 
  image(cam,30,30,mouseX,mouseY); 
  image(cam,200,200,mouseX,mouseY); 
  image(cam,220,210,mouseX -50 ,mouseY - 100); 
  image(cam,330,240,mouseX -50 ,mouseY - 100); 
  image(cam,335,245,mouseX -10 ,mouseY - 90); 
  image(cam,340,250,mouseX -10 ,mouseY - 100); 
    image(cam,200,200,mouseX,mouseY); 
  image(cam,620,510,mouseX -50 ,mouseY - 100); 
  image(cam,630,540,mouseX -50 ,mouseY - 100); 
  image(cam,635,545,mouseX -10 ,mouseY - 90); 
  image(cam,640,550,mouseX -10 ,mouseY - 100); 
  


 
}


