
/*****************************************
 * Assignment # 6
 * Name: Hao Wang
 * E-mail: hwang1@haverford.edu
 * Course:       CS 110 - Section # 2
 * Submitted:    4/10/2012
 * This assignment is a collage of pictures of my younger cousin.
 The original picture serves as the background.
 In this assignment, I used sepia, grayscale,obamicon effects from simple
 filters. Also, I used pointllism effect from "Image Visualization" and 
 "randomNeighbor" effect from "Area-based filters.
 In addition to that, I use resize, translation and rotation to make sure that
 each of my pictures is at the correct location.
 ***********************************************/
// declare global variables img3 and img5.
PImage img3;
PImage img5;

void setup () {
  //declare the size of screen.
  size (800, 800);

  //Use img0 as bacground picture.
  PImage img0= loadImage ("niu.jpg");
  image (img0, 0, 0, 800, 800);

  //load img1.
  PImage img1= loadImage ("niu.jpg");

  //Make the Obamicon effect of img1.Referenced from the code shown in class.
  color darkBlue = color (0, 51, 76);
  color r = color (217, 26, 33);
  color lightBlue = color (112, 150, 158);
  color yellow = color (252, 227, 166);

  // loading the pixels of img1 and edit it with Obamicon effect.
  img1.loadPixels();
  for (int i=0; i<img1.pixels.length;i++) {
    color c = img1.pixels [i];
    float total =red (c)+ green(c)+blue (c);
    if (total <182) {
      img1.pixels [i] = darkBlue;
    }
    else if (total <364) {
      img1.pixels [i]=r;
    }
    else if (total <546) {
      img1.pixels [i]=lightBlue;
    }
    else { 
      img1. pixels [i]= yellow;
    }
  }
  img1.updatePixels ();

  //draw img1 at scale on the sketch at a desirable place.
  pushMatrix();
  translate (300, 0);
  rotate (radians(-20));
  translate (-300, 20);
  image (img1, 0, 0, 300, 200);
  popMatrix();

  // Load img2.
  PImage img2= loadImage ("niu.jpg");

  //Add gray scale to img2.The color scaling is referenced from lecture notes.
  img2.loadPixels();
  for (int i=0;i<img2.pixels.length;i++) {
    color c= img2.pixels[i];
    img2.pixels[i]=color (0.3*red(c)+0.59*green(c)+0.11*blue(c));
  }
  img2.updatePixels();

  // Transform img2 with desirable rotation and translation. 
  pushMatrix();
  translate (500, 0);
  rotate (radians(20));
  translate (-500, 20);
  image (img2, 500, 0, 300, 200);
  popMatrix();

  //  Load img3.  
  img3= loadImage ("niu.jpg");

  //Add pointillism effect to img3.
  imageMode (CENTER);
  image (img3, width/2, height/2, 330, 220);
  noStroke();
  ellipseMode(CENTER);
  loadPixels();
  for (int i=0; i<20000;i++) addPoint();

  //load img4.
  PImage img4 = loadImage ("niu.jpg");
  img4.loadPixels();
  //add sepia effect to image 4. Code referenced from lecture note.
  for (int i=0; i<img4.pixels.length;i++) {
    color c= img4.pixels[i];
    float rr=red(c)*0.393+green(c)*0.769+blue(c)*0.189;
    float g=red(c)*0.349+green(c)*0.686+blue(c)*0.168;
    float b= red(c)*0.272+green(c)*0.534+blue(c)*0.131;
    img4.pixels[i]= color (rr, g, b);
  }
  img4.updatePixels();

  //place img4 at a desirable location.
  imageMode (CORNER);
  image (img4, 450, 550, 300, 200);


  // Load and resize img5.
  img5 =loadImage ("niu.jpg");
  image(img5, 50, 550, 300, 200);  
  //create the randomNeighbor area-based filter effect to img5.
  loadPixels();
  frameRate (10);
  randomNeighbor();
}

void draw () {
  addPoint();
  randomNeighbor();
}

// A function associated with pointillism. Referenced from lecture notes.
void addPoint () {
  int x=(int) random (width/2-165, width/2+165);
  int y= (int) random (height/2-110, height/2+110);
  int i=x+width*y;
  color c= pixels[i];
  fill (c);
  ellipse (x, y, 7, 7);
}


// A function associated with randomNeighbor (one of area-based filter).
void randomNeighbor () {
  for (int y=550; y<750; y++) {
    for (int x=50; x<350; x++) {
      int newx = int(random(x-1, x+2));
      int newy = int(random(y-1, y+2));
      newx = constrain(newx, 0, width-1);
      newy = constrain(newy, 0, height-1);
      pixels[y*width+x] =pixels[newy*width+newx];
    }
  }
  updatePixels();
}


