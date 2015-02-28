
PImage img;

void setup () {
  size (600,800);
  background(0);
 
  img = loadImage("tree.jpeg");
  
  float insetX = (width -img.width)/2;
  float insetY = (height -img.height)/2;
  image(img,0,insetY);
  
  img.loadPixels();
  for(int i=0; i<img.pixels.length; i +=1){
    float r = red(img.pixels[i]);
    float g = green(img.pixels[i]);
    float b = blue(img.pixels[i]);
    
    r *= 0.5;
    b *= 1.5;
    float br = brightness(img.pixels[i]);
    if (br<50){
    g *= .5;
    }
    img.pixels[i] = color(r,g,b);
  }
  
  img.updatePixels();
  
  image(img,width/2, insetY);
  
  img.resize (20,20);
  for (int i=0; i<100; i++){
     image(img, random(width), random(height));
     
     img.loadPixels();
  for(int i2=0; i2<img.pixels.length; i2 +=1){
    float r = red(img.pixels[i2]);
    float g = green(img.pixels[i2]);
    float b = blue(img.pixels[i2]);
    
    r *= 2.0;
    b *= 0.5;
    float br = brightness(img.pixels[i2]);
    if (br<30){
    g *= 2.0;
    }
    img.pixels[i2] = color(r,g,b);
  }
  
  img.updatePixels();
  }
  
  
  
  img.resize (30,30);
  for (int i=0; i<75; i++){
     image(img, random(width), random(height));
     
     img.loadPixels();
  for(int i3=0; i3<img.pixels.length; i3 +=1){
    float r = red(img.pixels[i3]);
    float g = green(img.pixels[i3]);
    float b = blue(img.pixels[i3]);
    
    r *= 0.0;
    b *= 2.5;
    float br = brightness(img.pixels[i3]);
    if (br<50){
    g *= 0.0;
    }
    img.pixels[i3] = color(r,g,b);
  }
  
  img.updatePixels();
  }
  
 
}

