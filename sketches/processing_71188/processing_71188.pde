
/**
 * Blur. 
 * 
 * A low-pass filter blurs an image. This program analyzes every
 * pixel in an image and blends it with the neighboring pixels
 * to blur the image. 
 */

// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs preload="moon.jpg"; */ 

float v = 1.0 / 81.0;
float[][] matrix = {{ v, v, v, v, v, v, v, v, v }, 
                    { v, v, v, v, v, v, v, v, v },
                    { v, v, v, v, v, v, v, v, v },
                    { v, v, v, v, v, v, v, v, v },
                    { v, v, v, v, v, v, v, v, v },
                    { v, v, v, v, v, v, v, v, v },
                    { v, v, v, v, v, v, v, v, v },
                    { v, v, v, v, v, v, v, v, v }, 
                    { v, v, v, v, v, v, v, v, v }};

                    
                    
PImage cookiesImg;
PFont mouseFont;

void setup() {
  size(400, 500);
  smooth();
  
  cookiesImg = loadImage("cookie_shelf.jpg"); // Load the original image
  image(cookiesImg, 0, 0);
  
  mouseFont = loadFont("MyriadWebPro-12.vlw");

} 

void draw() {
//  image(img, 0, 0); // Displays the image from point (0,0) 

  fill(255, 255, 180);
  noStroke();
  rectMode(CENTER);
  rect(width/2, 4*height/5+5, 200, 35);
  fill(0);
  textAlign(CENTER);
  textFont(mouseFont);
  text("Left-click: Vision WITHOUT Glasses", width/2, 4*height/5);
  text("Right-click: Vision WITH Glasses", width/2, 4*height/5+16);
  
  if(mousePressed){
    if(mouseButton == LEFT){
    blur();
    }
    else{
      image(cookiesImg, 0, 0);
    }
  }

}

void blur(){

  cookiesImg.loadPixels();


  // Create an opaque image of the same size as the original
  PImage blurryImg = createImage(cookiesImg.width, cookiesImg.height, RGB);

  // Loop through every pixel in the image
  for (int y = 4; y < cookiesImg.height-4; y++) {   // Skip top and bottom edges
    for (int x = 4; x < cookiesImg.width-4; x++) {  // Skip left and right edges
      float sumr = 0; // Kernel sum for this pixel
      float sumg = 0;
      float sumb = 0;
      for (int my = -4; my <= 4; my++) {
        for (int mx = -4; mx <= 4; mx++) {
          // Calculate the adjacent pixel for this kernel point
          int pos = (y + my)*cookiesImg.width + (x + mx);
          
          float valr = red(cookiesImg.pixels[pos]);
          float valg = green(cookiesImg.pixels[pos]);
          float valb = blue(cookiesImg.pixels[pos]);
          // Multiply adjacent pixels based on the kernel values
          sumr += matrix[my+4][mx+4] * valr;
          sumg += matrix[my+4][mx+4] * valg;
          sumb += matrix[my+4][mx+4] * valb;
        }
      }
      // For this pixel in the new image, set the gray value
      // based on the sum from the kernel
      blurryImg.pixels[y*cookiesImg.width + x] = color(sumr, sumg, sumb);
    }
  }
  
  // State that there are changes to edgeImg.pixels[]
  blurryImg.updatePixels();
    
  image(blurryImg, 0, 0); // Draw the new image
  
}
 

