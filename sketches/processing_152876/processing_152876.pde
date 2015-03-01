
/*
 * Creative Coding
 * Week 4, 02 - images as textures - image drawing program
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This program demonstrates the use of images in Processing
 * See also the foldout: Image Basics in Processing
 *
* I have used two different photos to scan, and made the dots blend a little as they travel down the page
 
 
 */

PImage myImage1;//PImage is used to store an image in memory
PImage myImage2;//image used but not printed
color[] pixelColors;//array of colors from particular pixel specified under pixelColors
color[] pixelColors2;

int scanLine;
float myNum = 0;
int num = 15;



void setup () {
  size (700, 800);
  //frameRate (15);

  myImage1 = loadImage ("harry_and_mum.jpg");
  myImage2 = loadImage ("venice.jpg");


  pixelColors = new color[num];
  pixelColors2 = new color [num];
  scanLine = 0;
  smooth(40);
}

void draw () {

  //tip from funprocessing to make screen fade a bit
  fill (0, 5);
  rect (0, 0, width, height);
   
  //change colour mix if mouse pressed, using image 2, or happens automatically if commented out
 // if mouseClicked {
    
    //makes image 2 colours move up screen
    for (int i = 0; i < 10; i++) {

      noStroke();
      fill (pixelColors2[i], 100);
      ellipse(random(i*80), height-scanLine, 80, 80);//makes the coloured circles move around randomly along scanline
    }
  //}

  for (int i=0; i < 10; i++) { 
    pixelColors[i] = myImage1.get(80+i*30, scanLine);
    pixelColors2[i] = myImage2.get(80+i*30, scanLine);
  }



  for (int i=0; i<10; i++) {
    noStroke();
    fill (pixelColors[i], 100);
    ellipse(random(i*80), scanLine, 80, 80);//makes the coloured circles move around randomly along scanline
  }
 

  if (frameCount % 1 == 0) {
    scanLine ++;
  }
  if (scanLine > height) {
    scanLine = 0;
  }
  if (keyPressed == true && key == 's') { 
      saveFrame("cinema_waves.jpg");
}
}
//makes the lines start from bottom/top again
void mouseClicked () {
 if (scanLine == height) {
 scanLine = height - scanLine;
 } else {
   scanLine = height + scanLine;
}
}



