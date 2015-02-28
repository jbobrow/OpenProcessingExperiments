
/* @pjs preload= "hidden-objects-Donna Sundblad.jpg"; */
PImage img;
PImage sensor;
PGraphics lens;
int zoom = 4;
int max_zoom = 64;
int min_zoom =1;
int lens_size= 80;
int sensor_size = lens_size/zoom;  // width and height of the sensor
int blocksize = lens_size/sensor_size;// pixel blocksize of the lens
int x;
int y;
color pix;
float pointillize =6;

void setup(){
  size (700,500);
  background(0);
  img = loadImage("hidden-objects-Donna Sundblad.jpg"); 
  imageMode(CENTER);
  noStroke();
  lens = createGraphics (lens_size, lens_size);
  cursor(HAND);
  }

void draw() {
  background(0);  
  image(img,width/2,height/2);
  for (y = 0; y < img.height; y+=6) {
    for (x = 0; x < img.width; x+=6) {
      pix = img.get(x, y);
      if (pix != color(0, 0, 0)) {
        noStroke();
        fill(pix);
        ellipse( x, y, pointillize, pointillize);
      }
    }
  }
  int mx = constrain(mouseX,lens_size/2,width-lens_size/2);
  int my = constrain(mouseY,lens_size/2,width-lens_size/2);
  
  //lens
  sensor_size = lens_size/zoom;
  blocksize = lens_size/sensor_size;
  int dash = lens_size/blocksize;
  int column = dash;
  sensor = createImage(sensor_size, sensor_size, RGB);
  sensor = img.get(mx-(sensor_size/2), my-(sensor_size/2), sensor_size, sensor_size);
  
  //zoom graphics
    lens.beginDraw();
  sensor.loadPixels();
  color thecolor;
  for (int ds=0;ds<dash;ds++) {
    float ypos = ds*blocksize;//ypos= y position
    for (int cm=0;cm<column;cm++) {
      float xpos = cm*blocksize;
      int idx = (ds*column)+cm; //formula for graphics
      if (idx<sensor.pixels.length) {
        thecolor = sensor.pixels[idx];
        lens.fill(thecolor);
        lens.noStroke();
        lens.rectMode(CORNER);
        lens.rect(xpos, ypos, blocksize,blocksize);
      }
    }
  }
  lens.stroke(255);
  lens.noFill();
  lens.rect(0,0,lens_size-1,lens_size-1);
  lens.fill(255);
  sensor.updatePixels();
  lens.endDraw();
  image(lens, mx-(lens_size/2), my-(lens_size/2));
      }
      
void keyPressed(){
  if (key == '+') zoom*=2;
  if (key == '_') zoom/=2;
  if(zoom > max_zoom) zoom = max_zoom; // constrain zoom range
  if(zoom < min_zoom) zoom = min_zoom; // constrain zoom range
}


