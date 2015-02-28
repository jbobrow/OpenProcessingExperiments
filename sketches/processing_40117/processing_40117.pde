
/*This is a barcode created from information from a picture of the Clemson football team.  
 Some code borrowed from Nick Senske.*/

PImage Pic;
void setup() {
  size(300, 300);
  Pic = loadImage("clemson.jpg");
  noStroke();
  smooth();
  background(255);
}

void draw() {
}

void mousePressed() {
  background(255);

  for (int x=0; x<width;x+=random(40,50)) {

    int a = int(random(0, Pic.width));    // take a random x coordinate from Pic
    int b = int(random(0, Pic.height));   // take a random y coordinate from Pic
    color cfill = Pic.get(a, b);      // use the random coordinate to get a color from Pic

    int bright= int(brightness(cfill)/5);  //this is makes it so rectangle size is dependent on the brightness of the color 


    fill(cfill);  //fills each rectangle with a different color from the picture palate
    rect(x, 0, bright, height);  // create the barcode with individual rectangles
  }
}


