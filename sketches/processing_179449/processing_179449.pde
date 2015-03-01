



import processing.video.*;



Capture cam;

void setup(){
  size (1280,1024);
  
  noStroke();
 
  
  String[] cameras = Capture.list();
  if(cameras.length> 0){
    println("Available cameras:");
    for( int i = 0; i < cameras.length; i++){
     println(cameras[i]);
    }
  }
 else{
  println("There are no cameras available");
  exit();
 }
  
  cam = new Capture(this, cameras[0]);
  cam.start();
      
}

void draw(){
  
  if (cam.available()) {
    cam.read();  
    cam.loadPixels();
    for(int x = 5; x < cam.width; x+=5){
      for(int y = 5; y < cam.height; y+=5){
        float circlex = x+random(-1,5);
        float circley = y+random(-5,5);
        int index = int(x + y * cam.width);
        color circleColor = cam.pixels[index];
        fill(circleColor);
        rect(circlex,circley, 80, 80);

      }
    }
  }

 
  }

  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);



