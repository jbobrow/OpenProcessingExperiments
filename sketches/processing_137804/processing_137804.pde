
/*
The idea is to abstractively draw an image with big simple shapes,
(filled circle, filled square, stroke circle).
Three images are loaded but not displayed. You have to press mouse to begin the drawing
*/

// Press Mouse to draw
// Move mouse Horizontally to change dimension of shapes

// Press key 'c' to change shape
// Press key 'i' to change image
// press key 'v' to display images, and again 'v' to erase image
// press key 'r' to reset drawing
// press key 's' to save png


PImage[] aurorasBo = new PImage[3]; // variable for an array containing 3 images
PImage aurora; // variable for the current image

int shape; // variable for the shape

float dimension; // variable for the dimension of the shape used in the canvas
int posX, posY; // variables for the position of the shapes

int img = 0; // variable for the displayed image
boolean etat = false; // variable for displaying image or not

void setup() {
  
  // loading the images in the array
  for (int i=0; i<3; i++) {
    aurorasBo[i] = loadImage("borealis" + i + ".png");
  }
 
 // the size of canvas is setup on the image's size
  background(0);
  size(960, 640);
  
  shape = 0;
  aurora = aurorasBo[0];
  

}


void draw() {
  
  // When mouse is pressed, shapes are drawn with the pixels color of image
  if (mousePressed) {
    
    // random position
    posX = int(random(width));
    posY = int(random(height));
    
    // different shapes :
    // - a filled ellipse
    // - a filled square
    // - a circle with only stroke
    
    if (shape == 0) {
      noStroke();
      fill(aurora.get(posX, posY), random(80));
      dimension = (120 + mouseX)/4;
      ellipse(posX, posY, dimension, dimension);
    }
  
    if (shape == 1) {
      noStroke();
      rectMode(CENTER);
      fill(aurora.get(posX, posY), random(80));
      dimension = random(120, 280);
      rect(posX, posY, dimension, dimension);
    }
  
    if (shape == 2) {
      noFill();
      strokeWeight( random(5, 20) );
      stroke(aurora.get(posX, posY), random(30,90));
      dimension = random(120, 280);
      ellipse(posX, posY, dimension, dimension);
    }
    
  }
  
}


// when 'c' key is pressed, the shape changes
// alternatively a filled circle, a filled square or a stroke circle
void changeShape() {
  shape++;
  if (shape > 2) {
    shape = 0;
  }
  background(0);
}


// when 'i' key is pressed, the image changes
void changeImage() {
  img++;
  if (img > 2) {
    img = 0;
  }
  aurora = aurorasBo[img];
  background(0);
}


// 'c' key to change shape
// 'i' key to change image
// 's' key to save image
void keyPressed() {
  
  if (key == 'c' || key =='C') {
    changeShape();
  }
  
  if (key == 'i' || key =='I') {
    changeImage();
  }
  
  if (key == 'v' || key == 'V') {
    etat = !etat;
    if (etat) {
      image (aurora, 0, 0);
    } else {
      background(0);  
    }
  }
  
  if (key == 'r' || key =='R') {
    background(0);
  }
  
  if (key == 's' || key =='S') {
    saveFrame("aurora.png");
  }
  
}



