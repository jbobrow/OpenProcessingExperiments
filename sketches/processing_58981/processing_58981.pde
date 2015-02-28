
/*
 * Assignment    6
 * Name:         Mfon-ido Ime Akpan
 * E-mail:       makpan@brynmawr.edu
 * Course:       CS 110 - 02
 * Submitted:    4/10/2012
 The original picture is of my high school graduation. The young man in the picture is my dear younger brother. We are cat and dog, but we are the best of friends. This image invoques many happy memories for me. I used pointillism, threshold, sharpen/convolution and grayscale modifications on the orginal picture. I was unable to crop the pointillism picture though, but I hope you like it. 
 */
PImage img; //original image
PImage img1; //threshold
PImage img3; //convolution
PImage img4; //grayscale
PImage img2;//pointillism
PImage imgPoints; //saved image of pointillism
PFont f;
int width = 600;
int height = 600;

float [][] matrix = {
  {
    -1, -1, -1
  }
  , 
  {
    -1, 9, -1
  }
  , 
  {
    -1, -1, -1
  }
};

//set up sketch background
void setup() {
  img = loadImage("cs3.jpg");
  size(600, 600);  
  background(12, 247, 206, 100);


  //adds descriptive texts to sketch
  noFill();
  stroke(0);
  strokeWeight(12);
  rect(width/4-8, height/4-8, width/2+15, height/2+15);
  f = loadFont("OldEnglishTextMT-48.vlw");




  //threshold (modification 1)
  img1 = createImage(img.width, img.height, RGB);

  color blue = color(40, 132, 206);
  color brown = color(247, 161, 22);
  color darkGreen = color(8, 88, 35);
  color pink = color(237, 43, 105);

  //determining boundaries for color change
  loadPixels();
  for (int i = 0; i < img.pixels.length; i++) {
    color c = img.pixels[i];
    float total = red(c)+green(c)+blue(c);
    if (total < 180) {
      img1.pixels[i] = blue;
    }
    else if (total < 360) {
      img1.pixels[i] = brown;
    }
    else if (total < 540) {
      img1.pixels[i] = darkGreen;
    }
    else {
      img1.pixels[i] = pink;
    }
  }
  img1.updatePixels();
  //this crops a part of the image and moves it to the center to form the collage
  pushMatrix();
  translate(width/2, 0);
  PImage crop1 = img1.get(img1.width/2, 0, img1.width/2, img1.height/2);
  image(crop1, 0, height/4, 150, 150);
  popMatrix();



  //pointilism(modification 2)   
  imgPoints = loadImage("imgPoints.jpg"); 
 //this crops part of pointillism image and places it at desired location to form the collage 
  PImage crop8 = imgPoints.get(150, 150, 150, 150);
  pushMatrix();
  translate(width/2, height/2);
  image(crop8, 0, 0, 150, 150);
  popMatrix();
  
  //this code is in the pointillism file
  /*noStroke();
   ellipseMode(CENTER);
   loadPixels();          // Cover with random circles
   for (int i=0; i<15000; i++) addCircles();
   {
   }
   */

  
  
  //grayscale(modification 4)
  img4 = createImage(img.width, img.height, RGB); 
  img.loadPixels();
  for (int i=0; i<img.pixels.length; i++) {
    color c = img.pixels[i];
    img4.pixels[i] = color(red(c)*0.3+green(c)*0.59+blue(c)*0.11);
  }
  img4.updatePixels();
  //this crops part of grayscaled image and places it at desired location to form the collage
  pushMatrix();
  translate(width/4, height/2);
  //rotate(PI/4);
  PImage crop4 = img4.get(0, img4.height/2, img4.width/2, img4.height/2);
  image(crop4, 0, 0, 150, 150);
  popMatrix();





  //sharpened and convoluted image(modification 3)
  img3 = createImage(img.width, img.height, RGB);
  img3.loadPixels();
  for (int p=0; p<img.height; p++ ) {
    for (int q=0; q<img.width; q++) {
      color d = convolution(q, p, img);
      img3.pixels[p*img.width+q] = d;
    }
  }
  img3.updatePixels();  
  //this crops part of the sharpened image and places it at desired location to form the collage
  pushMatrix();
  translate(0, 0);
  PImage crop3 = img3.get(0, 0, img3.width/2, img3.height/2);
  image(crop3, width/4, height/4, 150, 150);
  popMatrix();
 
}
// calculates the color after applying the filter
color convolution(int x, int y, PImage img) {
  int offset = matrix.length/2;
  float r1 = 0.0, g = 0.0, b = 0.0;

  for (int i = 0; i < matrix.length; i++) {
    for (int j= 0; j < matrix[i].length; j++) {
      // Which neighbor are we using
      int newX = x+i-offset;
      int newY = y+j-offset;
      int idx = img.width*newY + newX;
      // Make sure we haven't walked off our image
      idx = constrain(idx, 0, img.pixels.length-1);
      // Calculate the convolution
      r1 += (red(img.pixels[idx]) * matrix[i][j]);
      g += (green(img.pixels[idx]) * matrix[i][j]);
      b += (blue(img.pixels[idx]) * matrix[i][j]);
    }
  }

  return color(r1, g, b);
}

// calculates the color after applying the filter, no nested loops
color convolutionNoLoop(int x, int y, PImage img) {
  int lx = x-1;
  lx = constrain(lx, 0, img.width);
  int rx = x+1;
  rx = constrain(rx, 0, img.width-1);
  int ty = y-1;
  ty = constrain(ty, 0, img.height-1);
  int by = y+1;
  by = constrain(by, 0, img.height-1);

  // top row colors
  color tl = img.pixels[ty*img.width+lx];
  color tm = img.pixels[ty*img.width+x];
  color tr1 = img.pixels[ty*img.width+rx];
  // middle row 2colors
  color ml = img.pixels[y*img.width+lx];
  color mm = img.pixels[y*img.width+x];
  color mr1 = img.pixels[y*img.width+rx];
  //bottom row colors
  color bl = img.pixels[by*img.width+lx];
  color bm = img.pixels[by*img.width+x];
  color br1 = img.pixels[by*img.width+rx];

  float r1 = red(tl)*matrix[0][0] + red(tm)*matrix[0][1] + red(tr1)*matrix[0][2]
    + red(ml)*matrix[1][0] + red(mm)*matrix[1][1] + red(mr1)*matrix[1][2]
    + red(bl)*matrix[2][0] + red(bm)*matrix[2][1] + red(br1)*matrix[2][2];
  float g = green(tl)*matrix[0][0] + green(tm)*matrix[0][1] + green(tr1)*matrix[0][2]
    + green(ml)*matrix[1][0] + green(mm)*matrix[1][1] + green(mr1)*matrix[1][2]
    + green(bl)*matrix[2][0] + green(bm)*matrix[2][1] + green(br1)*matrix[2][2];
  float b = blue(tl)*matrix[0][0] + blue(tm)*matrix[0][1] + blue(tr1)*matrix[0][2]
    + blue(ml)*matrix[1][0] + blue(mm)*matrix[1][1] + blue(mr1)*matrix[1][2]
    + blue(bl)*matrix[2][0] + blue(bm)*matrix[2][1] + blue(br1)*matrix[2][2];

  return color(r1, g, b);
  
}
  

void draw () {
  //this function call is in the pointillism file  //addCircles();
  
  textFont(f, 48);
  fill(0); 
  textSize(36);
  text("Michael and I, together, forever!", width/6, height/6 );
  text("High school graduation", width/5, height/6*5);
}
//this function is in the extra file called pointillism
/*void addCircles() {
 // Add a random filled circle to image
 int x = (int)random( imgPoints.width);
 int y = (int)random(imgPoints.height);
 int i = x + imgPoints.width*y;
 color c = imgPoints.pixels[i];
 fill(c);
 ellipse(x, y, 5, 5);
 }
 */


