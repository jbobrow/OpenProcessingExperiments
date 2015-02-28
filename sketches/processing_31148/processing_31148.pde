
 

   

int NUMIMG =4; //number of images  

int DIST = 60; // size of bright "hole"  

   

PImage imgActive;  

   

   

float xx=0;  

float yy=0;  

   

PImage [] img = new PImage[NUMIMG];  

   

   

   

void setup() {  

   

  size(500,410);  

   

  noCursor();  

  img [0] = loadImage("123.jpg"); //images  

  img [1] = loadImage("234.jpg");  

  img [2] = loadImage("345.jpg");  

  img [3] = loadImage("456.jpg");  

   imgActive = img[0];  

      

    

   

   

  smooth();  

   

  loadPixels();  

}  

   

void keyPressed () { //keypressed changes the image  

  switch (key) {  

  case'q':  

imgActive = img[0];  

    break;  

  case'w':  

imgActive = img[1];  

    break;  

  case'e':  

imgActive = img[2];  

    break;  

  case'r':  

imgActive = img[3];  

   break;  

  }  

}  

   

void draw() {  

xx =xx+11;  

yy =yy+13;  

   

   

if( xx>width) xx=random(width); // make the "hole" appeare in random place  

if( yy>height) yy=random(height);  

   

   

   

   

 imgActive.loadPixels();  

  for (int x = 0; x < imgActive.width; x++) {  

    for (int y = 0; y < imgActive.height; y++ ) {  

      // Calculate the 1D location from a 2D grid  

      int loc = x + y*imgActive.width;  

      // Get the R,G,B values from image  

      float r,g,b;  

      r = red (imgActive.pixels[loc]);  

      g = green (imgActive.pixels[loc]);  

      b = blue (imgActive.pixels[loc]);  

      // Calculate an amount to change brightness based on proximity to the mouse  

      float maxdist =DIST;//  

      dist(7,7,width,height);  

      dist (4,4,width, height);  

      float d = dist(x,y,xx,yy);  

      float e = dist(x,y,xx,yy);  

      float adjustbrightness = 100*(maxdist-d)/maxdist;  

      r += adjustbrightness;  

      g += adjustbrightness;  

      b += adjustbrightness;  

      // Constrain RGB to make sure they are within 0-255 color range  

      r = constrain(r,0,255);  

      g = constrain(g,0,255);  

      b = constrain(b,0,255);  

      // Make a new color and set pixel in the window  

      color c = color(r,g,b,10);  

      // color c = color(r);  

      pixels[y*width + x] = c;  

    }  

  }  

  updatePixels();  

   
} 


