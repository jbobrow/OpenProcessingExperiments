
//Amy Findeiss
//August 8, 2011
//Parade


PImage rainDrop;
PImage backgroundImage;
float xPos = 150;
float yPos = 150;
float x2Pos = 300;
float y2Pos = 200;


void setup() {
  size (600, 400);
  smooth();
  backgroundImage = loadImage("clouds600.gif");
  imageMode(CENTER);
  rainDrop = loadImage("raindrop15.gif");
}



void draw() {
  background(255, 255, 255);  
  image(backgroundImage, 300, 200);


  for (int i = 0; i < 5; i ++) {
    image(rainDrop, xPos + 25*i, yPos);
  }


  for (int i = 0; i < 5; i ++) {
    image(rainDrop, x2Pos + 25*i, y2Pos);
  }


  xPos ++;
  yPos ++;
  x2Pos ++;
  y2Pos ++;
}

/*********HOMEWORK**************************
 
 Redo multiple-element bouncing ball sketch with "for"loops
 if you only had a couple of elements you should now be able to make
 as many as you want with very little effort so it now need to include 10 elements
 
 you could put the one ball from the previous assignment in the "for" loop
 
 also could just do a parade of element across the screen*/

