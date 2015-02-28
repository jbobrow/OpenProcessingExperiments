
PImage[] myImageArray = new PImage[10]; 
PImage img;

void setup() {
  PImage[] myImageArray = new PImage[10]; 
   myImageArray [0] = loadImage( "white.jpg");
   myImageArray [1] = loadImage( "black.jpg");
   myImageArray [2] = loadImage( "lightgray.jpg");
   myImageArray [3] = loadImage( "darkgray.jpg");
   myImageArray [4] = loadImage( "blackwhite.jpg");
   myImageArray [5] = loadImage( "lightgraywhite.jpg");
   myImageArray [6] = loadImage( "darkgraywhite.jpg");
   myImageArray [7] = loadImage( "lightgraywhitesmall.jpg");
   myImageArray [8] = loadImage( "darkgraywhitesmall.jpg");
   myImageArray [9] = loadImage( "blackwhitesmall.jpg");
//  println( myImageArray);
  size(800,800);
  smooth();
  noCursor();
  
    for (int x = 0; x <= width; x += 5) {
    for (int y = 0; y <= height; y+= 5) {
   int ranNum = floor(random(0,10));
  img = myImageArray[ranNum];
  image(img, x, y);
}
 }
  }
  void draw() {
  }
void mouseClicked() {
  filter(INVERT);
  saveFrame("grid####.jpg");
}


  



