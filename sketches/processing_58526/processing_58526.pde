
/*
Kriti Shrestha
Assignment no. 6
04/10/2012

The image I used is a painting by Leonid Afremov. I created 4 different 
versions of the image for the collage. The first one is grayscaling, the second
one uses negative colors. The third draws the image using rectangles and the fourth 
one uses color convolution. I created the background for the collage using
sine and cosine functions on lines of different length and strokeweights. 

*/


int s = 3;//size of rectangles for the third version of the image
//original image
PImage img;
PImage img2;
PImage img3;
PImage img4;
//variables for creating the background
int[] diams = new int[60];

float theta2 = 0;
float sides2 = 100;
float rad = 30;
//matrix for color convolution
float[][] matrix = {
  {
    -1, -1, -1
  }
  , 
  {
    -1, 8, -1
  }
  , 
  {
    -1, -1, -1
  }
};
void setup() {
  //loading the image four times
  img = loadImage("painting.jpg");
  img2 = loadImage("painting.jpg");
  img3 = loadImage("painting.jpg");
  img4 = loadImage("painting.jpg");
 
  size(660, 660);
  background(0);
  //editing the first image
  img.loadPixels();
  for (int i=0; i<img.pixels.length; i++) {
    color c = img.pixels[i];
    img.pixels[i] = color(red(c)*0.3+green(c)*0.59+blue(c)*0.11);
  }
  img.updatePixels();

  
//editing the second image
  img2.loadPixels();
  for (int i=0; i<img2.pixels.length; i++) {
    color c = img2.pixels[i];
    img2.pixels[i] = color(255-red(c), 255-green(c), 255-blue(c));
  }
  img2.updatePixels();
}

// editing the third image
color convolution(int n, int m, PImage img4) {
  int offset = matrix.length/2;
  float r = 0.0, g = 0.0, b = 0.0;

  for (int k = 0; k < matrix.length; k++) {
    for (int l= 0; l < matrix[k].length; l++) {
      
      int newN = n+k-offset;
      int newM = m+l-offset;
      int idx = img4.width*newM + newN;
      
      idx = constrain(idx, 0, img4.pixels.length-1);
      // calculating color convolution
      r += (red(img4.pixels[idx]) * matrix[k][l]);
      g += (green(img4.pixels[idx]) * matrix[k][l]);
      b += (blue(img4.pixels[idx]) * matrix[k][l]);
    }
  }

  return color(r, g, b);
}


color convolutionNoLoop(int n, int m, PImage img4) {
  int ln = n-1;
  ln = constrain(ln, 0, img4.width);
  int rn = n+1;
  rn = constrain(rn, 0, img4.width-1);
  int tm = m-1;
  tm = constrain(tm, 0, img4.height-1);
  int bm = m+1;
  bm = constrain(bm, 0, img4.height-1);

  // top row colors
  color tl = img4.pixels[tm*img4.width+ln];
  color tmm = img4.pixels[tm*img4.width+n];
  color tr = img4.pixels[tm*img4.width+rn];
  // middle row colors
  color ml = img4.pixels[m*img4.width+ln];
  color mm = img4.pixels[m*img4.width+n];
  color mr = img4.pixels[m*img4.width+rn];
  //bottom row colors
  color bl = img4.pixels[bm*img4.width+ln];
  color bmm = img4.pixels[bm*img4.width+n];
  color br = img4.pixels[bm*img4.width+rn];

  float r = red(tl)*matrix[0][0] + red(tmm)*matrix[0][1] + red(tr)*matrix[0][2]
    + red(ml)*matrix[1][0] + red(mm)*matrix[1][1] + red(mr)*matrix[1][2]
    + red(bl)*matrix[2][0] + red(bmm)*matrix[2][1] + red(br)*matrix[2][2];
  float g = green(tl)*matrix[0][0] + green(tmm)*matrix[0][1] + green(tr)*matrix[0][2]
    + green(ml)*matrix[1][0] + green(mm)*matrix[1][1] + green(mr)*matrix[1][2]
    + green(bl)*matrix[2][0] + green(bmm)*matrix[2][1] + green(br)*matrix[2][2];
  float b = blue(tl)*matrix[0][0] + blue(tmm)*matrix[0][1] + blue(tr)*matrix[0][2]
    + blue(ml)*matrix[1][0] + blue(mm)*matrix[1][1] + blue(mr)*matrix[1][2]
    + blue(bl)*matrix[2][0] + blue(bmm)*matrix[2][1] + blue(br)*matrix[2][2];


  return color(r, g, b);
}

void draw() {
  //drawing the first version of the image, with appropriate transformations 
  pushMatrix();
  scale (0.75, 0.75);
  translate(img.width/2, img.height/7);
  rotate(PI/8);
  PImage imgb = img.get(0, 0, img.width, img.height);

  strokeWeight(10);
  stroke(255);
  smooth();
  rect(0, 0, img.width+2, img.height+2, 10, 10, 10, 10);
  image(imgb, 0, 0);
  popMatrix();

//second version of the image
  pushMatrix();
  scale (0.75, 0.75);
  translate(img2.width*1.30, img2.height/2.50);

  rotate(-0.4);
  smooth();
  PImage img2b = img2.get(0, 0, img2.width, img2.height);
  strokeWeight(10);
  stroke(255);
  smooth();
  rect(0, 0, img.width+2, img.height+2, 10, 10, 10, 10);
  image(img2b, 0, 0);
  popMatrix();
//third version of the image
  img3.loadPixels();
  PImage img3b = img3.get(0, 0, img3.width, img3.height);
  pushMatrix();
  
  scale (0.75, 0.75);
  translate(img.width*1.25, img.height/2);
  rotate(PI/5);
 noStroke();
  for (int y=0; y<img3.height; y+=s) {
    for (int x=0; x<img3.width; x+=s) {
      
      int i = x + img3b.width*y;
      color c = img3b.pixels[i];
      fill(c);
      
      rect(x, y+img.height, s, s);
    }
  }
  strokeWeight(5);
  stroke(255);
  noFill();
  rect(0, img.height, img.width+2, img.height+2, 10, 10, 10, 10);
  popMatrix();
  //fourth version of the image
  PImage img4a = createImage(img4.width, img4.height, RGB);
  img4.loadPixels();
  img4a.loadPixels();
  for (int m=0; m<img4.height; m++ ) {
    for (int n=0; n<img4.width; n++) {
      color c4 = convolution(n, m, img4);
      img4a.pixels[m*img4.width+n] = c4;  
    }
  }
  img4a.updatePixels();
  pushMatrix();
  scale (0.75, 0.75);
  translate(100, 220);

  rotate(-0.2);
  smooth();
  
  strokeWeight(10);
  stroke(255);
  smooth();
  rect(img.width, img.height, img.width+2, img.height+2, 10, 10, 10, 10);
  image(img4a, img.width, img.height);
  popMatrix();
  //drawing the background
  smooth();
  frameRate(1);
  fill(100);
  for (int i=0; i<diams.length; i++) {
    diams[i] = i+1;
    stroke(random(200+5*i), random(100, i*5), random(100), 400/(i+1));
    strokeWeight(0.5*i);
    //lines in a pattern
    line(sin(theta2)*rad*1.5+width/2, cos(theta2)*rad*1.5+width/2, sin(theta2+i)*rad*5+height/2, cos(theta2+i)*rad*5+height/2);     
    theta2 = theta2 + 2;
    rad = rad+0.03;
  }
}













