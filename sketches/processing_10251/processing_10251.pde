



// "Pointillism"

PImage img; // declared image
int dots = 5; //declared size of ellipses to be used


void setup() { // specify size of image, location and starting background colour
  size(300,400);
  img = loadImage("jose-mourinho-winker.jpg");
  background(255);
  smooth();
}

void draw() {
  
  // Pick a random point
  int x = int(random(img.width));
  int y = int(random(img.height));
  int loc = x + y*img.width;
    
  // Looks up the RGB color from the source image
  loadPixels();
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  noStroke(); //Means that there is no outline around the ellipse  
 
 //if (mousePressed == true) {
 //    xSpeed [i] += 0.05;
 //    xSpeed [i] += 0.05;
 //   }
  //
//  else {
 //   xSpeed [i] = i;
 //   ySpeed [i] = i;
  //     }

  fill(r,g,b,100);
  
  ellipse(x,y,dots,dots); 
}

