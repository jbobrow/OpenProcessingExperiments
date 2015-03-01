
/*
 * Creative Coding
 * Week 4, 03 - one pixel cinema
 * Modified by Jason Prine
 *
 * // TITLE: 200 Pixel Cinema
 * // PURPOSE: Sample 200 pixel colour values and develop 10 x 20 
 * // colourfield with those values.
 *
 * // FEATURES: 
 ---> Creates one colourfield based upon 200 points from a 10 x 20 grid of photo.
 *
 * // FUTURE MODIFICATIONS
 ---> Auto calculate size of image loaded and change parameters for loading pixel colours to meet 20 x 10 grid
 ----------> USE: img.width / img.height to perform this
 ---> Move the row starting position post pause of colourfield creation to create a new version
 ---> Auto determine name of files in folder and process files automatically.
 ---> Dynamically change the new "pixel" sizes in the colourfield
 ---> Average surrounding pixels to the selected pixel to come up with average value for colour
*/

// global variables
PImage myImg; // load JPG into this field
color[] pixelColors; // array to hold pixel colour values
int scanLine;  // vertical position

void setup() {
  
  myImg = loadImage("feathers.jpg");
  size(525+myImg.width, myImg.height); //auto calculate width using 700 pixels for colour field + width of image
  pixelColors = new color[400]; //set array for width / 35 pixel square * 10 sample points per row
  smooth(4);
}

void draw() {
 
  //DEBUG - background colour for entire display
  background(255,0,0); //if you see red, then the image and colourfield are not lining up correctly
  
   // draw the image
  image(myImg, 525, 0);
  
  // read in pixel values into array
   for (int row=0; row < 20; row++) { // loop through 20 rows AKA scanLine
      for (int singlepixel=0; singlepixel<15; singlepixel++) { //loop through 10 points on a row
    pixelColors[singlepixel + (row*10)] = myImg.get(singlepixel*35+20, row*35);
    // draw the colour field square for the selected pixel from image
    strokeWeight(1);
    stroke(255);
    fill(pixelColors[singlepixel + (row*10)]);
    rect(singlepixel*35,row*35, 35, 35);
    // draw the circle around the selected pixel used for the colourfield square
    strokeWeight(2);
    stroke(255,0,0);
    noFill();
    ellipse(singlepixel*35+525+20,row*35,10,10);
    //DEBUG - print values 
    println("row:",row,"singlepixel:",singlepixel,"pixelColour array #:",singlepixel + (row*10),"pixelColors[i]:",pixelColors[singlepixel + (row*10)]);
}
}
  
  // stop animation
  noLoop();

}
  
  void keyPressed(){
 
    switch( key ){
      case 's': // save your drawing when you press keyboard 's'
        saveFrame("feathers_200px_cinema-####.jpg");
        break;
      case 'r': // erase your drawing when you press keyboard 'r'
        background(255);
        
    }
}
