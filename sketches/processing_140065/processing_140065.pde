
int x, y, r, g, b, t;
import processing.video.*;
Capture cam;
void setup() {

  size(1200, 800);
  frameRate(30);
  background(0);
  cam = new Capture (this, 1200, 800, "FaceTime HD Camera (Built-in)", 30); 
  cam.start();
  r=int (random (255));
  g=int (random (255));
  b=int (random (255));
  //printArray(Capture.list());
}
void draw() {
  fill (0, 5);
  rect(0, 0, width, height);

  if (cam.available()) {
    cam.read();
    cam.loadPixels();
    loadPixels();
    for (int i=0; i<cam.pixels.length; i++) {
      if (brightness(cam.pixels[i])>200) {
        pixels[i]= color (r, g, b);
      }
    }   
    updatePixels();
    float maxBri=0;
    int theBrightPixel=0;
    for (int j=0; j<cam.pixels.length; j++) {
      if (brightness(cam.pixels[j])>maxBri) {
        maxBri= brightness(cam.pixels[j]);
        theBrightPixel=j;
      }
    }

    x= theBrightPixel % cam.width;
    y= theBrightPixel/cam.width;

    stroke(r, g, b, 30);
    line (x, y, r, random(height));
  }
}
void mousePressed() {
  setup();
  background(0);
  println("check");
}


/*size(400,300);// call noise, where pixel is mapped to screen 
float x=0; 
while(x<width){
float y=0; 
while (y<height){

//stroke (random(255));

float c= map(noise(x, y), 0,1, 0, 255);


float val =sin(x/10+y/100);
float c=map(val, -1,1,0,255);


float c= map(noise(x/50+y/50), 0,1, 0, 255);diagonal

stroke (c);
point (x,y); 
y=y+1; 
}
x=x+1;
}
}
