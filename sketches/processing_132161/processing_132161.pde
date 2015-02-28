
PImage iphone;
PImage marker;
PImage camera;
PImage wall;
PImage bluetooth;
PImage logo;
PImage map;

void setup () {
  
  size(400, 600);
  iphone = loadImage("iphone.png");
  marker = loadImage("marker.png");
  camera = loadImage("camera.png");
  wall = loadImage("gallery.png");
  bluetooth = loadImage("wifi.png");
  logo = loadImage("logo.jpg");

  
  
}


void draw () {
  
  
  
  image(iphone, 0 , 0, 400, 600);
  rect(52, 437, 75, 75);
  image(marker, 54, 439, 73, 73);
  rect(127, 437, 75, 75);
  image(camera, 129, 439, 73, 73);
  rect(202, 437, 75, 75);
  image(wall, 204, 439, 73, 73);
  rect(277, 437, 75, 75);
  image(bluetooth, 279, 439, 73, 73);
  
  image(logo, 53, 92, 299, 345);
  
  if (mousePressed){
    
    if (mouseX >  54 && mouseX < 127 && mouseY > 437 && mouseY < 510){
      
      logo = loadImage("map.png");
        marker = loadImage("marker2.png");
        camera = loadImage("camera.png");
        wall = loadImage("gallery.png");
        bluetooth = loadImage("wifi.png");
      
    }
     if (mouseX >  127 && mouseX < 202 && mouseY > 437 && mouseY < 510){
      
      logo = loadImage("cameraback.png");
      
        marker = loadImage("marker.png");
        camera = loadImage("camera2.png");
        wall = loadImage("gallery.png");
        bluetooth = loadImage("wifi.png");
      
    }
    
     
     if (mouseX >  202 && mouseX < 277 && mouseY > 437 && mouseY < 510){
      
      logo = loadImage("wallback.png");
      
        marker = loadImage("marker.png");
        camera = loadImage("camera.png");
        wall = loadImage("gallery2.png");
        bluetooth = loadImage("wifi.png");
      
    }
     if (mouseX >  277 && mouseX < 350 && mouseY > 437 && mouseY < 510){
      
      logo = loadImage("printer3.jpg");
      
        marker = loadImage("marker.png");
        camera = loadImage("camera.png");
        wall = loadImage("gallery.png");
        bluetooth = loadImage("wifi2.png");
      
    }
      
    
  }
  }
  
  
  



