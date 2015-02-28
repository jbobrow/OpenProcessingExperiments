
/******************************************************
 
 * Assignment 6
 * Name: Jiayi Wang
 * Email: jwang04@brynmawr.edu
 * Course: CS110- Section 02
 * Submitted: 4/9/2012
 *
 *
 * The background of the sketch is the original image.
 The other images are grayscale,sepia,blur(area-based filter),posterize
 and pointillism(image visualization) respectively.
 *
 *
 *
 
 *********************************************************/
PImage img0;//original
PImage img1;//grayscale
PImage img2;//sepia
PImage img3;//blur
PImage img3blur;
PImage img4;//posterize
PImage img5;//pointilism


int pointillize = 30;

float e=1.0/15.0;

float[][] matrix = 
{
  { 
    e, e, e
  }
  , 
  { 
    e, e, e
  }
  , 
  {
    e, e, e
  }
};



//from code used in class
color convolution(int x, int y, PImage img) {
  int offset = matrix.length/2;
  float r = 0.0, g = 0.0, b = 0.0;

  for (int i = 0; i < matrix.length; i++) {
    for (int j= 0; j < matrix[i].length; j++) {
      // Which neighbor are we using
      int newX = x+i-offset;
      int newY = y+j-offset;
      int idx = img.width*newY + newX;
      // Make sure we haven't walked off our image
      idx = constrain(idx, 0, img.pixels.length-1);
      // Calculate the convolution
      r += (red(img.pixels[idx]) * matrix[i][j]);
      g += (green(img.pixels[idx]) * matrix[i][j]);
      b += (blue(img.pixels[idx]) * matrix[i][j]);
    }
  }

  return color(r, g, b);
}
void setup() {


  //background 
  img0=loadImage("arashi.jpg");
 
  size(800,800);
  image(img0, 0, 0, width, height);
  
  
  pointillism();
  //grayscale
  PImage img1 = loadImage("arashi.jpg");


  img1.loadPixels();
  for (int i=0; i<img1.pixels.length; i++) {
    color c = img1.pixels[i];
    img1.pixels[i] = color(red(c)*0.3+green(c)*0.59+blue(c)*0.11);
  }
  img1.updatePixels();
  pushMatrix();
  translate(width/4, height/4);
  rotate(-PI/4);
  image(img1, -width/4, -height/4, width/4*sqrt(2), height/4*sqrt(2));
  popMatrix();



  //sepia
  PImage img2 = loadImage("arashi.jpg");


  img2.loadPixels();

  for (int i=0; i<img2.pixels.length; i++) {
    color c = img2.pixels[i];

    float r=red(img2.pixels[i]);
    float g=green(img2.pixels[i]);
    float b=blue(img2.pixels[i]);

    float outr = (r * .393) + (g *.769) + (b * .189);
    float outg = (r * .349) + (g *.686) + (b * .168);
    float outb = (r * .272) + (g *.534) + (b * .131);


    img2.pixels[i] =  color (outr, outg, outb);
  }


  img2.updatePixels();

  pushMatrix();
  translate(width*3/4, height*3/4);
  rotate(PI/6);
  image(img2, -width/4, -height/4, width/4*sqrt(2), height/4*sqrt(2));
  popMatrix();

  //blur(from code used in class)


  img3blur = loadImage("arashi.jpg");
  img3 = createImage(img3blur.width, img3blur.height, RGB);

  img3blur.loadPixels();
  img3.loadPixels();
  for (int y=0; y<img3blur.height; y++ ) {
    for (int x=0; x<img3blur.width; x++) {
      color c = convolution(x, y, img3blur);
      img3.pixels[y*img3blur.width+x]=c ;
    }
  }
  img3.updatePixels();
  pushMatrix();
  translate(width*3/4, height/4);
  rotate(PI/7);
  image(img3, -width/8, -height/4, width/4*sqrt(2), height/4*sqrt(2));
  popMatrix();

  //posterize
  PImage img4 = loadImage("arashi.jpg");
  color ohno = color(2, 94, 232);
  color sho = color(230, 27, 4);
  color aiba = color(33, 222, 12);
  color nino = color(251, 251, 28);
  color jun = color(153, 51, 255);


  img4.loadPixels();
  for (int i = 0; i < img4.pixels.length; i++) {
    color c = img4.pixels[i];
    float total = red(c)+green(c)+blue(c);
    if (total < 200) {
      img4.pixels[i] = ohno;
    }
    else if (total < 350) {
      img4.pixels[i] = sho;
    }
    else if (total < 530) {
      img4.pixels[i] = aiba;
    }
    else if (total < 745) {
      img4.pixels[i] = nino;
    }
    else {
      img4.pixels[i] = jun;
    }
  }
  img4.updatePixels();
  pushMatrix();
  translate(width/4, height*3/4);
  rotate(-PI/8);
  image(img4, -width/4, -height/5, width/4*sqrt(2), height/4*sqrt(2));
  popMatrix();
  
  save("screenshot.jpg");

}

void draw() {
  //pointillism

 // pointillism();
  frameRate(300000);
}

/*void pointillism() {
  img5 = loadImage("arashi.jpg");
  int x = int(random(img5.width));
  int y = int(random(img5.height));
  int loc = x + y*img5.width;

  // Look up the RGB color in the source image
  img5.loadPixels();
  float r = red(img5.pixels[loc]);
  float g = green(img5.pixels[loc]);
  float b = blue(img5.pixels[loc]);
  noStroke();

  // Draw an ellipse at that location with that color
  fill(r, g, b, 100);
  ellipse(x, y, pointillize, pointillize);
}*/

void pointillism () {
 
  PImage img5 = loadImage ("arashi.jpg");
  image (img5, width/4, height/4, width/2, height/2);
  noStroke();
  ellipseMode(CENTER);
  loadPixels();
  for (int i=0; i<20000; i++)
    addPoint();
}
 
void addPoint() {
 
  // Add a random filled circle to pixels
  int x = (int)random(width/4,width*3/4);
  int y = (int)random(height/4,height*3/4);
  int i = x + width*y;
  color c = pixels[i];
  fill(c);
  ellipse(x, y, 3, 3);
}



