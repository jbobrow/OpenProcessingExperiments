
// The selection of motifs are arranged in a half drop repeat system and the user is able to 'mouse click'
//  their desired pattern into a image, saving the pattern.


PImage img;
float s = 137;
import processing.pdf.*;
int pdfCounter = 0;


// PDF setup
void mousePressed() {
  pdfCounter++;
  saveFrame("frame-####.png");  // use png seems to support transparency more consistently
}

void setup() {
size(900, 900);
img = loadImage("mari6 - Copy (2).jpg");
frameRate (0.3);
}

void draw() {

  background (255);
 
// first line of images
float a = constrain (mouseX, 60, s);
float b = constrain (mouseY, 60, s);

image(img, 0, 0, a, b);
image (img, s, 0, a, b);
image (img, s*2, 0, a, b);
image (img, s*3, 0, a, b);
image (img, s*4, 0, a, b);
image (img, s*5, 0, a, b);
image (img, s*6, 0, a, b);
image (img, s*7, 0, a, b);

//second line of images
image (img, -s/2, s, a, b);
image (img, s/2, s, a, b);
image (img, s*1.5, s, a, b);
image (img, s*2.5, s, a, b);
image (img, s*3.5, s, a, b);
image (img, s*4.5, s, a, b);
image (img, s*5.5, s, a, b);
image (img, s*6.5, s, a, b);

//third line of images
 image (img, 0, s*2, a, b);
 image (img, s, s*2, a, b);
 image (img, s*2, s*2, a, b);
image (img, s*3, s*2, a, b);
image (img, s*4, s*2, a, b);
image (img, s*5, s*2, a, b);
image (img, s*6, s*2, a, b);
image (img, s*7, s*2, a, b);

//fourth line of images
image (img, -s/2, s*3, a, b);
image (img, s/2, s*3, a, b);
image (img, s*1.5, s*3, a, b);
image (img, s*2.5, s*3, a, b);
image (img, s*3.5, s*3, a, b);
image (img, s*4.5, s*3, a, b);
image (img, s*5.5, s*3, a, b);
image (img, s*6.5, s*3, a, b);

//fifth line of images
image(img, 0, s*4, a, b);
image (img, s, s*4, a, b);
image (img, s*2, s*4, a, b);
image (img, s*3, s*4, a, b);
image (img, s*4, s*4, a, b);
image (img, s*5, s*4, a, b);
image (img, s*6, s*4, a, b);
image (img, s*7, s*4, a, b);

//sixth line of images
image (img, -s/2, s*5, a, b);
image (img, s/2, s*5, a, b);
image (img, s*1.5, s*5, a, b);
image (img, s*2.5, s*5, a, b);
image (img, s*3.5, s*5, a, b);
image (img, s*4.5, s*5, a, b);
image (img, s*5.5, s*5, a, b);
image (img, s*6.5, s*5, a, b);

}


// PDF closer
void mouseReleased() {
  endRecord();
}  

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}



