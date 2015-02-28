
/**
 * 2D "cloud" (Perlin Noise):
 * author:hsiu-wen,ou
 * reference:http://www.shiffman.net/teaching/nature/week-1/
 */
 

int[][] nube = new int[400*5][400*5];
  float xoff;
  float yoff;
 
float increment=0.01;
void setup(){
  size(400,400);
  smooth();
  frameRate(100);
  colorMode(HSB, 255);
  
  
  
  
  
  float increment=random(0,0.02);
  loadPixels();
   
    xoff = 0.0;
  
  for(int x=0;x<width*5;x++){
    xoff +=increment;
    // xoff = 0;
    yoff = 0.0;
    
   for (int y = 0; y < height*5; y++) {
      yoff += increment ;
      // yoff = 0 ;
      int bright = int(noise(xoff,yoff)*160);
     // bright = noise(xoff,yoff)*160;
      nube[x][y] = bright; // color(176,220,bright,200);
      // print(hex(nube[x][y]) + " ");
    }
  }
  updatePixels();
  
  
}
void draw(){
  
  
  // int increment= int(random(.01, 0.03) * 180);
  loadPixels();
   
  float xoff = 0.0;
  
  for(int x=0;x<width;x++){
    // xoff +=increment;
    float yoff = 0.0;
    
    for (int y = 0; y < height; y++) {
      // yoff += increment ;
      // float bright = noise(xoff,yoff);
      // pixels[x+y*width] = color(hue(pixels[x+y*width]), saturation(pixels[x+y*width]),brightness(pixels[x+y*width])+ increment); // color(bright);
      // pixels[x+y*width] = color(hue(pixels[x+y*width]), saturation(pixels[x+y*width]), brightness(pixels[x+y*width]) + bright); // color(bright);
      int bright = 0;
      for(int mx=0;mx<5;mx++){
        for(int my=0;my<5;my++){
          bright += nube[x+mx][y+my];
          // print(bright + " ");
        }
      }
      bright = bright / 25;
      // print(bright + " ");
      pixels[x+y*width] = color(176, 220,  bright,200); // color(bright);  bright
      // print(hex(pixels[x+y*width]) + " ");
    }
  }
  updatePixels();
  
  
  
  
 
  
  for(int x=0;x<width*5-1;x++){
    
   for (int y = 0; y < height*5-1; y++) {
     // bright = noise(xoff,yoff)*160;
      nube[x][y] = nube[x+1][y+1]; // color(176,220,bright,200);
      // print(hex(nube[x][y]) + " ");
    }
  }
  
  
  float increment=random(0,0.02);
   
    xoff = 0.0;
  
  for(int x=0;x<width*5;x++){
    xoff +=increment;
    // xoff = 0;
    int bright = int(noise(xoff,yoff)*160);
    nube[x][height*5-1] = bright;
  }
    yoff = 0.0;
    
   for (int y = 0; y < height*5; y++) {
      yoff += increment ;
      // yoff = 0 ;
      int bright = int(noise(xoff,yoff)*160);
     // bright = noise(xoff,yoff)*160;
       // color(176,220,bright,200);
      // print(hex(nube[x][y]) + " ");
    nube[height*5-1][y] = bright;
  }
  
}



