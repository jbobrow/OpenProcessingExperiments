

PImage img;

void setup () {
  size (800,600);
  background(0);
 
   loadPixels();
  for (int i=0; i<pixels.length; i++) {
    float r = red(pixels[i]); 
    float g = green(pixels[i]);
    float b = blue(pixels[i]);
    r *= .2;
    g *= .5;
    b *= .5;
    pixels[i] = color(random(20), random(100), random(255));
  }
  updatePixels();

  img = loadImage("tree.jpeg");

  float insetX = (width -img.width)/2;
  float insetY = (height -img.height)/2;
  //3. draw the image
  image(img,0,insetY);
  image(img,width/2, insetY);
  

  
  img.resize (60,60);
  for (int i=0; i<50; i++){
     image(img, random(width), random(height));
     
  }   
  
}


