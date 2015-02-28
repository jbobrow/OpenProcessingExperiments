
/* * Assignment 06
 * Name:         Xinyin Huang
 * E-mail:       xhuang01@brynmawr.edu
 * Course:       CS 110 - Section 01
 * Submitted:    11/26/2012

this is an image about colorful zombies occupying San Francisco through Golden Gate Bridge. I pointillize the bridge, which is the background. Each pixel of those zombie images is looped through and 
 given a new particular color such as yellow, red and purple. As you can see, a red and a yellow zombie are jumping off the bridge. There is a series of transparent purple zombies
 walking on the Golden Gate bridge. They are made through translate, scale, pushMatrix and popMatrix in recursion. There is a poor exposure zombie walking from the sky from the right top coner of the screen. 
 It is made through the modify of red, green and blue. A sharpened zombie is coming from the sea. It is made through convolution function. */


//creating six image classes, one background and five variations of the same original zombie image
PImage goldenGate;
PImage zombie_b;
PImage zombie_p;
PImage zombie_s;
PImage zombie_r;
PImage zombie_y;

//create a matrix for sharpen
float [][]matrix= {
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

//create an int matrisize and give value to it
int matrixsize=3;

//create an int pointillize and give value to it
int pointillize =10;


void setup () {

  //set up the size of the background
  size (800, 600);
  smooth ();

  //load images, Golden Gate Bridge and the original zombie. 
  goldenGate = loadImage ("golden gate.jpg" );
  //Because I have five variations of the same zombie image, I load the same one five times
  zombie_b = loadImage ("Zombie.jpg");
  zombie_p = loadImage ("Zombie.jpg");
  zombie_s = loadImage ("Zombie.jpg");
  zombie_r = loadImage ("Zombie.jpg");
  zombie_y = loadImage ("Zombie.jpg");


  //load pixels of each PImage.
  goldenGate.loadPixels ();
  zombie_p.loadPixels ();
  zombie_s.loadPixels ();
  zombie_b.loadPixels ();
  zombie_r.loadPixels ();
  zombie_y.loadPixels ();

  //set the image Goden Gate Bridge as the background
  image (goldenGate, 0, 0);

  //modify one of the zombies and change it to a red one
  //create a color value r
  color r;
  //loop through every pixel in the zombie_r image
  for (int i=0; i<zombie_r.pixels.length; i++) {
    //store the color of the particular pixel into r
    r=zombie_r.pixels[i];
    //remember each value of the red channal and only play the red value remembered in modification
    zombie_r.pixels[i]= color (red (r), 0, 0);
  }

  //modify one of the zombies and change it to a yellow one
  //create a color value y
  color y;
  //loop through every pixel in the zombie_y image
  for (int i=0; i<zombie_y.pixels.length; i++) {
    //store the color of the particular pixel into y
    y=zombie_y.pixels[i];
    //remember each value of the red channal and only play the red value remembered and green as 165 in modification
    zombie_y.pixels[i]= color (red (y), 165, 0);
  }

  //change the brightness of a zombie and turn it to be a poor exposure zombie
  //loop through every column of pixels in the image zombie_b
  for (int i=0; i<zombie_b.height; i++) {
    //loop through every row of pixels in the image zombie_b
    for (int j=0; j<zombie_b.width; j++) {

      //create an int a that represent the exact pixel 
      int a = j+i*zombie_b.height;

      //remeber red, green and blue color value of each pixel 
      float r1= red (zombie_b.pixels [a]);
      float g= green (zombie_b.pixels [a]);
      float b= blue (zombie_b.pixels [a]);

      //constrain those values to a range 50 to 70
      r1=constrain (r1, 50, 70);
      g=constrain (g, 50, 70);
      b=constrain (b, 50, 70);

      //give the new color value back to each pixel
      zombie_b.pixels[a]= color (r1, g, b);
    }
  }

  //sharpen a zombie
  //loop through every row of pixels in the image zombie_s  
  for (int x=0; x<zombie_s.width;x++) {
    //loop through every column of pixels in the image zombie_s
    for (int z=0; z<zombie_s.height; z++) {

      //create an int loc to represent the exact pixel
      int loc=x+z*zombie_s.height;

      //create "sharpen" to store the sharpened value of each selected pixel through function convolution
      color sharpen=convolution (x, z, matrix, matrixsize, zombie_s);

      //give the new sharpened color value back to each pixel
      zombie_s.pixels[loc]=sharpen;
    }
  }
} 

//draw different zombies and call functions 
void draw () {

  //call the function pointillize which points pointillize the background
  pointillize();

  //load the sharpen zombie at the right bottom of the screen
  image (zombie_s, 430, 400, 170, 200);

  //load the poor exposure zombie at the right top of the screen
  image (zombie_b, 600, 0, 200, 230);

  //load the red zombie on the top of the bridge
  image (zombie_r, 120, 80, 55, 60);

  //load the yellow zombie a little bit above the bridge
  image (zombie_y, 120, 170, 55, 65);

  //call the function that recurse the purple zombie 15 times
  zombie_pRec(15);
}

//function pointillize
void pointillize () {

  //to make pointillize more obvious by a for loop. Each time called in the draw function, 25 points appear.
  for (int i = 0; i < 25; i ++) {

    //randomly pick the location of the point
    int x= int (random (goldenGate.width));
    int y= int (random (goldenGate.height));

    //create an int that represent the exact point
    int loc= x+y*goldenGate.width;

    //remember red, green and blue color value of each point captured
    float r= red (goldenGate.pixels[loc]);
    float g= green (goldenGate.pixels[loc]);
    float b= blue (goldenGate.pixels[loc]);

    //no stroke of the point
    noStroke ();

    //fill the random color value to the points and make it less visible
    fill (r, g, b, 100);

    //draw the points at the random location and set the size
    ellipse (x, y, pointillize, pointillize);
  }
}

//the function convolution that sharpen the image zombie_s
color convolution (int x, int y, float [][] matrix, int matrixsize, PImage img) {
  //create three float, the beginning red, green and blue color value as 0.0
  float rtotal=0.0;
  float btotal=0.0;
  float gtotal=0.0;

  //create an int offset, which is half size of the matrixsize
  int offset=matrixsize/2;

  //loop within the width of the matrix
  for (int i=0; i<matrixsize; i++) {
    //loop within the height of the matrix
    for (int j=0; j<matrixsize; j++) {

      //the location of the left up corner of the pixel within the matrix
      int xloc=x+i-offset;
      int yloc=y+j-offset;
      //remember the exact pixel within the matrix
      int loc=xloc+zombie_s.width*yloc;

      //make sure that the pixel within the matrix is within the image zombie_s
      loc=constrain (loc, 0, zombie_s.pixels.length-1);

      //modifying the red, green and blue value of the exact pixel according to the matrix
      rtotal+= red (zombie_s.pixels[loc])*matrix[i][j];
      btotal+= blue (zombie_s.pixels[loc])*matrix[i][j];
      gtotal+= green (zombie_s.pixels[loc])*matrix[i][j];
    }
  }

  //return the color with new value
  return color (rtotal, gtotal, btotal);
}

//the function that draws a purple zombie in recursion, with an variable depth that captures the times of recursion
void zombie_pRec (int depth) {

  //change the color of the zombie into purple
  //create a color value p
  color p;
  
  //loop through each pixel in the image zombie_p
  for (int i=0; i<zombie_p.pixels.length; i++) {
    
    //store the color value of the particular pixel into p
    p=zombie_p.pixels[i];
    //give the new color purple to each pixel within the image zombie_b
    zombie_p.pixels[i]= color (190, green (p), 190);
  }

  //start the recursion
  if (depth >0) {
    
    //base, the most basic thing that I want to recurse
    //tint the image so that it is cooler
    tint (255, 10);
    //load the basic image at the left side of the screen
    image (zombie_p, 70, 330, 120, 150);

    //translate the origin to 60, 30
    translate (60, 30);
    //shrink the origin into 9/10 of the original one
    scale (0.9);
    //go through the function and comes up a range of purple zombies till depth-1>=0
    zombie_pRec (depth-1);
  }
  
  //noTint works stop tint, only shows in the purple zombie
  noTint ();
} 



