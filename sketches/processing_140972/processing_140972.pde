
PImage img;

   void setup() {
   size(300, 300);
   img = loadImage("filename.png"); //the file has to be in the same folder
   noLoop();
 }

   void draw() {
  //image(img, 0, 0);
  // image(img, 5, 10, 200, 200); //define location and size  (variablename, x, y, w, h)
 
 
   
  
// Transformations can be applied as it was a rect shape
  imageMode(CENTER);
  pushMatrix();
  translate(150, 150);
  rotate(radians(45));
  image(img, 0, 0, 200, 200);
  popMatrix();

 
  }




