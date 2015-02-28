
// our image to draw from
PImage img;

// 2-dimensional of pixels that have been drawn to 
boolean[][] drawn = new boolean[900][900];

// array of Drawer objects (each line is a Drawer object)
ArrayList<Drawer> drawers = new ArrayList();

// instagram image this is designed for 612 by 612 - the size of all instagram photos
String imgURL = "test.jpg";

int counter = 0;

void setup() {
  size( 728, 629 );
  img = loadImage(imgURL);
 // background(255);  // white
  background(1);  // black
  
  //AutoDrawing 1
    Drawer d = new Drawer(
    new PVector(random(726), random(639)),   // starting position 
    30,                            // size of the area to consider for the next line coordinate          //VARIABLE A CAMBIAR
    40);                            // color ( from the pixel clicked on )
    
  // and add it to the arraylist
  drawers.add(d);        
  
  
  
  
      Drawer s = new Drawer(
    new PVector(random(726), random(639)),   // starting position 
    30,                            // size of the area to consider for the next line coordinate          //VARIABLE A CAMBIAR
    20);                            // color ( from the pixel clicked on )
    
  // and add it to the arraylist
  drawers.add(s);  
  

 
}

void draw() {
  
  
  // for each Drawer object, draw the next line
  for (Drawer d: drawers) {
    d.draw();
    
   /*
  if (mousePressed == false ){
     counter++;
        if (counter == 200){
            Drawer s = new Drawer(
    new PVector(random(726), random(639)),   // starting position 
    30,                            // size of the area to consider for the next line coordinate          //VARIABLE A CAMBIAR
    80);                            // color ( from the pixel clicked on )
    
  // and add it to the arraylist
  drawers.add(s);                   
          println("AÑADIDO");
        }
        
  };

        if (mousePressed == true){
          counter = 0;}
          
        if (counter > 200){
          counter = 0;}
          
        println(counter);
        */
  
  }
  
}

void mouseClicked() {
  // get hte color of the pixel clicked on 
  color c = getPixel(new PVector(mouseX, mouseY));
  
  // create a new Drawer object 
  ///*
  Drawer d = new Drawer(
    new PVector(mouseX, mouseY),   // starting position 
    30,                            // size of the area to consider for the next line coordinate          //VARIABLE A CAMBIAR
    c);                            // color ( from the pixel clicked on )
    
  // and add it to the arraylist
  drawers.add(d);                                                                                        //VARIABLE A CAMBIAR
  drawers.add(d);
  drawers.add(d);
  drawers.add(d);
  drawers.add(d);
  drawers.add(d);
  drawers.add(d);
  drawers.add(d);
  drawers.add(d);
  drawers.add(d);

  
  //*/
}

/**DRAWER ***************************************/
class Drawer {
  color c;                                  // color of the line
  PVector start = new PVector(100, 100);    // starting coords of the lines                  
  PVector next = new PVector();             // end coords of the line
  int size = 10;                            // size of the area to compare color values
 
  public Drawer(PVector st, int si, color co) {
    start = st;
    size = si;
    c = co;
  }

  public void draw() {
    stroke(c);    // set the color of the line
    next = getClosestPixelCoords(start, 20, c);   // set the end coords of the line to the closest color pixel in range 
    line(start.x, start.y, next.x, next.y);       // draw the line
    start.x = next.x;  // set the start values to the end point of the previous line
    start.y = next.y;
  }
}
/**END DRAWER ***********************************/

// takes a coordinate point v, size for range, and color to compare
// and returns the closest color match pixel coordinate in the range of pixels 
PVector getClosestPixelCoords(PVector v, int size, color c) {
  PVector closestColor = new PVector(v.x, v.y); // set the starting vector as the closest color
  int df = 9999999; // used to store the most common (loweset difference) between colors
  int tempd;        // used to store the current difference 
  
  // confirm that the coordinate exists on the image
  if (isCoord(v)) {
    // get the min and max values from the origin point and the possible range of pixels to compare
    PVector min = new PVector(v.x - size, v.y - size);
    PVector max = new PVector(v.x + size, v.y + size);
    
    // constrain the min and max so that only possible pixel coordinates are compared 
    min.x = constrain(min.x, 0, img.width-1);
    min.y = constrain(min.y, 0, img.height-1);
    max.x = constrain(max.x, 0, img.width-1);
    max.y = constrain(max.y, 0, img.height-1);

    // for each pixel in the range, compare the color value to the Drawer line color
    for (int x = (int)min.x; x <= max.x; x++) {
      for (int y = (int)min.y; y <= max.y; y++) {
        // temp difference value
        tempd = compare(getPixel(new PVector(x, y)), c);
        
        // if the temp difference value is lower that hte lowest compared, update the lowest 
        if (tempd < df && !drawn[x][y]) {
          df = tempd; 
          
          // and set the pixel coordinates for the next line's end coordinates
          closestColor.x = x;
          closestColor.y = y;
        }
      }
    }
  }  
  
  // remember that this line was drawn so we don't draw to this pixel in the future
  drawn[(int)closestColor.x][(int)closestColor.y] = true;
  
  // return the coordinates of the closest available color match
  return closestColor;
}

// function confirms that a possible coordinate is available to read from an array of pixel data
boolean isCoord(PVector v) {
  if (v.x >= 0 && v.x < img.width &&
    v.y >= 0 && v.y < img.height) {
    return true;
  } 
  else {
    return false;
  }
}

// returns the color of a pixel coordinate on an image
color getPixel(PVector v) {
  return img.pixels[(int)(v.x + v.y * img.width)];
}

// converts an integer value into a coordinate value of an image
PVector intToCoord(int index) {
  PVector v = new PVector();
  if (index >= 0 && index < pixels.length) { 
    v = new PVector( index % img.height, 
    (int)Math.floor(index / img.width) );
  }
  return v;
}


// compares two colors and returns an unnormalized difference value 
int compare( int colour1, int colour2 ) 
{

  int currR = (colour1 >> 16) & 0xFF; 
  int currG = (colour1 >> 8) & 0xFF;
  int currB = colour1 & 0xFF;

  int currR2 = (colour2 >> 16) & 0xFF; 
  int currG2 = (colour2 >> 8) & 0xFF;
  int currB2 = colour2 & 0xFF;

  int distance  = 0;
  distance += Math.pow(currR - currR2, 2);
  distance += Math.pow(currG - currG2, 2);
  distance += Math.pow(currB - currB2, 2);
  return distance ;
}


