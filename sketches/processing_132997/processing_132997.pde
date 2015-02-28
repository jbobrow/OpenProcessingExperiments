
//
////  LETTERIZE   ////
//
// Replace a photo's pixels with letters,
// and experiment with letter sizes and separations.
//
// Youssef Faltas, Feb 2014


int scaleX, scaleY, xR, yR;
float r, g, b;
PImage img;


void setup() {
  
  // this is the size of the photo
  size(640, 426);
  
  // load an image
  img = loadImage("http://4.bp.blogspot.com/-o625W6m8WC0/TY9G2fB9iQI/AAAAAAAAAlc/jOHa1JYIH20/s640/cairo-egypt.jpg","jpg");
  
  // get the pixels of the images  
  img.loadPixels(); 
  
  //an inital letterize run
  letterize(6,3); 
}

void draw() {
 
 // mouse click to letterize the photo and see the result  
 if (mousePressed){
   
   // use mouseX to control textSize 
  scaleX = 5 + int( 5 * mouseX/width);
  
  // use mouseY to control letter sepration
  scaleY = 2 + int( 3 * mouseY/height); 
  
  //call main letterize function
  letterize(scaleX, scaleY);
  
 }
 
  // press S to save the photo 
  if (keyPressed && key == 's') {    
    // choose the file name 
    save("imageToLetters.png"); 
  }

}

void letterize(int scaleX, int scaleY) {
  
  //start with a black background
  background(0);  
  
  // loop over pixels and skip pixels 
  // based on scaleY to control letter separation
  for (int y = 0; y < height; y=y+scaleY) {    
    for (int x = 0; x < width; x=x+scaleY) {
      int loc = x + y*width;
      
      // get the RGB of each pixel
      r = red(img.pixels[loc]);
      g = green(img.pixels[loc]);
      b = blue(img.pixels[loc]);
      
      // set letter size and fill
      textSize(scaleX);
      fill(r,g,b);
      
      // add some randomness to letter positions 
      xR = x + int(random(-5,5));
      yR = y + int(random(-5,5));
      
      // but make sure they are inside the canvas 
      if (xR > width || xR < 0) xR = x;
      if (yR > height || yR < 0) yR = y;
      
      // if ((r+g+b) < 100 ) do nothing and keep the pixel black
      // otherwise put a letter in its place
      if ( (r+g+b) > 100 && (r+g+b) < 200 ) text("I",xR,yR);       
      if ( (r+g+b) > 200 && (r+g+b) < 300 ) text("C",xR,yR);          
      if ( (r+g+b) > 300 && (r+g+b) < 400 ) text("O",xR,yR); 
      if ( (r+g+b) > 400 && (r+g+b) < 500 ) text("A",xR,yR);
      if ( (r+g+b) > 500                  ) text("R",xR,yR);    
    }
  }
}
