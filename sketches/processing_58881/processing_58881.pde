
/* Assignment #6
 * Name: Justin Wei
 * E-mail: jwei@haverford.edu
 * Course: CS 110 - Section #2
 * Submitted: 4/10/12
 
 * I created a collage in the form of a photo album. My four images are displayed
 and labelled with a book (my fifth image). These photos depict the four most
 beautiful places I have travelled to. I used variants of image visualization
 to modify my photos of Niagara Falls and Half Dome. I used an area-based blurring
 filter for my photo of the Grand Canyon, and lastly I used a simple filter to
 modify Turtle Beach in Hawaii (in a method similar to that of creating an 
 Obamicon).*/



void setup() {
  size(1200, 750);

  //First image is used as the setting for the following 4 modified images
  PImage img1 = loadImage("book.jpg");  

  //the following allows me to use img1 as the background
  imageMode(CENTER);
  image(img1, width/2, height/2, width, height); 

  //the following functions draw each of my images
  drawimg5();
  drawimg2();
  drawimg3();
  drawimg4();


  //this code labels each of my images
  PFont herculanum;
  herculanum = loadFont("Herculanum-48.vlw");
  textFont(herculanum); 
  String s = "NIAGARA FALLS";
  fill(0);
  text(s, width/8.25, height/2.4, width/3, height/8);

  String t = "HALF DOME";
  text(t, width/6, height/1.13, width/3, height/8);

  String u = "GRAND CANYON";
  text(u, width/1.75, height/2.4, width/3, height/8);  

  String v = "TURTLE BEACH";
  text(v, width/1.65, height/ 1.13, width/3, height/8);
  
  //save("photoalbum.jpeg"); //used to save an image of my collage
}



//Second Image is an example of image visualization 
void drawimg2() {

  PImage img2 = loadImage("niagara.jpg");

  pushMatrix();
  scale(.27, .27);    //shrink the size of img2
  translate(width/3, height/4.4);  //move img2 to the top of the left page of the book

  //variables created for img2
  int s=6;
  int rows, cols;
  PFont f;
  String chars = "niagarafalls"; 
  rows = height/s;
  cols = width/s;
  f = createFont("Courier", 10, true);
  textFont(f);
  textSize(11);

  /*the following allows me to change img2 into a drawing with letters spelling
   out "niagarafalls" over and over again. */
  int count=0;
  for (int i=0; i<rows/.75; i++) {
    for (int j=0; j<cols/.75; j++) {
      color c = img2.pixels[i*img2.width+j];
      fill(c);
      text(chars.charAt(count), j*s, i*s);  
      count++;
      count = count%chars.length();
    }
  }
  popMatrix();
}


//Third Image is an example of blurring an image with help from the processing tutorial
void drawimg3() {  

  float v = 1.0/11.0;
  float[][] matrix = { {v, v, v}, 
                       {v, v, v},
                       {v, v, v} };

  PImage img3 = loadImage("grandcanyon.jpg");
  image(img3, width/1.35, height/4.2, width/2.7, height/2.8); //move the image to the right page
  img3.loadPixels();

  // Create an opaque image of the same size as the original
  PImage edgeImg = createImage(img3.width, img3.height, RGB);

  // Loop through every pixel in the image.
  for (int y = 1; y < img3.height-1; y++) {   // Skip top and bottom edges
    for (int x = 1; x < img3.width-1; x++) {   // Skip left and right edges
      float sum = 0; // matrix sum for this pixel
      for (int matrixy = -1; matrixy <= 1; matrixy++) {
        for (int matrixx = -1; matrixx <= 1; matrixx++) {
          // Calculate the adjacent pixel for this matrix point
          int pos = (y + matrixy)*img3.width + (x + matrixx);
          // Image is grayscale, red/green/blue are identical
          float val = red(img3.pixels[pos]);
          // Multiply adjacent pixels based on the matrix values
          sum += matrix[matrixy+1][matrixx+1] * val;
        }
      }
      /* For this pixel in the new image, set the gray value
       based on the sum from the matrix */
      edgeImg.pixels[y*img3.width + x] = color(sum);
    }
  }

  edgeImg.updatePixels();
  image(edgeImg, width/1.35, height/4.2, width/2.7, height/2.8); // Draw the new image
}



//Fourth Image is a modification of the famous obamicon
void drawimg4() { 
  PImage img4 = loadImage("turtle.jpg");

  color Brown = color(93, 57, 57);
  color greenish = color(19, 111, 50);
  color mediumBlue = color(73, 107, 206);
  color lightBlue = color(73, 172, 206);
  color oceanBlue = color(150, 232, 222);
  color yellow = color(252, 227, 166);

  image(img4, width/1.35, height/1.43, width/2.7, height/2.8); //move the image to the right page

  img4.loadPixels();
  for (int i=0; i<img4.pixels.length; i++) {
    color c = img4.pixels[i];
    float total = red(c) + green(c) + blue(c);
    if (total < 182) {
      img4.pixels[i] = Brown;  //all colors with a combined R+G+B < 182 are replaced with brown
    }
    else if (total <310) {
      img4.pixels[i] = greenish;
    }
    else if (total<414) {
      img4.pixels[i] = mediumBlue;
    }
    else if (total<546) {
      img4.pixels[i] = lightBlue;
    }
    else if (total<610) {
      img4.pixels[i] = oceanBlue;
    }
    else {
      img4.pixels[i] = yellow;  //all colors with a combined R+G+B > 610 are replaced with yellow
    }
  }
  img4.updatePixels();
  image(img4, width/1.35, height/1.43, width/2.7, height/2.8);
}



//Fifth Image is an example of pointillism 
void drawimg5() { 
  PImage img5 = loadImage("halfdome.jpg");
  image(img5, width/3.7, height/1.43, width/2.7, height/2.8);
  noStroke();
  rectMode(CENTER);
  loadPixels();
  for (int i=0; i<20000; i++)
    addPoint();
}

void addPoint() {

  //Draws a rectangle at the location of each pixel
  int x = (int)random(width);
  int y = (int)random(height);
  int i = x + width*y;
  color c = pixels[i];
  fill(c);
  rect(x, y, width/369, height/230);
  rectMode(CORNER);
}





