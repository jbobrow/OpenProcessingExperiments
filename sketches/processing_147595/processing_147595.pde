
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/147516*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
PImage img1, img2;

void setup() {
  size (900,900);
  img1 = loadImage("cecil2014.JPG");
  img2 = loadImage("cecil2014.JPG");
  img2.filter(GRAY);
}

void draw() {
  
  if (mousePressed == true) {
    noCursor();
    cursor(HAND);
  } else {
    noCursor();

  }
  image(img1, 0, 0);
  image(img2, width/2, 0);

if (mousePressed == true) {
      line(20, 20, 80, 80);
// Saves a TIFF file named "diagonal.tif"
save("diagonal.png");


    
}  
}



