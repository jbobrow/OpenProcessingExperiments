
/**
 * Particle movement by Paige Peterson
 
 * Brightness Tracking 
 * by Golan Levin. 
 * 
 * Tracks the brightest pixel in a live video signal. 
 */


import processing.video.*;
ArrayList particles;
int maximum=1000;

Capture video;
int darkestX = 0; // X-coordinate of the brightest video pixel
int darkestY = 0; // Y-coordinate of the brightest video pixel

void setup() {
  size(1020, 760); // Change size to 320 x 240 if too slow at 640 x 480
  // Uses the default video input, see the reference if this causes an error
 
//  video = new Capture(this, width, height, 30);
  particles=new ArrayList();
//  video = new Capture(this, width, height, "IIDC FireWire Video",30);
  video = new Capture(this, width, height,30);
  noStroke();
  smooth();

}

void draw() {
  noCursor();
    if (video.available()) {
    background(255);
    video.read();
//    image(video, 0, 0, width, height); // Draw the webcam video onto the screen
    int darkestX = 0; // X-coordinate of the brightest video pixel
    int darkestY = 0; // Y-coordinate of the brightest video pixel
    float darkestValue = 255; // Brightness of the darkest video pixel
    // Search for the brightest pixel: For each row of pixels in the video image and
    // for each pixel in the yth row, compute each pixel's index in the video
    video.loadPixels();
    int index = 0;
    for (int y = 0; y < video.height; y++) {
      for (int x = 0; x < video.width; x++) {
        // Get the color stored in the pixel
        int pixelValue = video.pixels[index];
        // Determine the brightness of the pixel
        float pixelBrightness = brightness(pixelValue);
        // If that value is brighter than any previous, then store the
        // brightness of that pixel, as well as its (x,y) location
        if (pixelBrightness < darkestValue) {
          darkestValue = pixelBrightness;
          darkestY = y;
          darkestX = x;
        }
        index++;
      }
    
   // if (darkestX>20 && darkestX<width-20 && darkestY>20 && darkestY<height-20){
    // Draw a large, yellow circle at the brightest pixel
//    if (darkestX>30 && darkestX<width-30 && darkestY>30 && darkestY<height-30){
      if(darkestValue < 255){   // if there is no finger shadow
      float rand=random(0,10);
      if (rand<.2){
//        fill(255);
//        ellipse(darkestX , darkestY, 20, 20);
//        println(darkestX);
//        println(darkestY);
        Dust part= new Dust();
        particles.add(part);
        part.x=darkestX;
        part.y=darkestY;
        part.vx=random(-1,1);
        part.vy=random(-1,1);
//        if (darkestX<115){
//          if(darkestValue < 100){   // if there is no finger shadow
//            fill(0);
//            ellipse(darkestX , darkestY, 20, 20);
//          }
        }
      }
    }   
    if(particles.size()>maximum){
      for (int i=maximum;i<particles.size()-1;i++){
        particles.remove(i-maximum);
      }
    }
  
    for (int i=0;i<particles.size()-1;i++){
      Dust part=(Dust) particles.get(i);
      part.move();
      part.render();
//      if (part.c<=color(15)){
//        particles.remove(part);
//      }
    }
    println(particles.size());
  }
}

class Dust
{
  float x = 0;
  float y = 0;
  float vx = 0;
  float vy = 0;

  float diameter=15;

  float diameter_sq=sq(diameter);
  float threshold = 15;
  
  color c=color(255);
  Dust(){

  }


  void move()
  {
//    if (vx != 0 && vy != 0){
      vx += random(-1, 1);
      vy += random(-1, 1);
      vx *= .95;
      vy *= .95;
      x += vx;
      y += vy;
      if(x > width)
      {
        x = width;
        vx *= -1;
      }
      if(x<0)
      {
        x = 0;
        vx *= -1;
      }
      if(y > height)
      {
        y = height;
        vy *= -1;
      }
      if(y < 0)
      {
        y = 0;
        vy *= -1;
      }
      if(intersect(this, particles)) {
        vx *=-1;
        vy *=-1;
      }
    }  
  
  void render(){
//    if (vx != 0 && vy != 0){
      fill(c);
      stroke(255,208);
      c-=15;
      ellipse(x, y, diameter,diameter);
//    }
  }
}

boolean intersect(Dust circle, ArrayList circle_array) {

  for(Iterator it = circle_array.iterator();it.hasNext();) {
    Dust circle2 = (Dust) it.next();
    if(circle2==circle) return false;
    //use square distance to avoid a call to sqrt, which is slow
    float dist_sq = sq(circle2.x-circle.x)+sq(circle2.y-circle.y);
    if(dist_sq < circle.diameter_sq) return true;

  }
  //if no intersection return false
  return false;
}


