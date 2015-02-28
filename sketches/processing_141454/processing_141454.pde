
PImage img;

   void setup() {
   size(300, 300);
   img = loadImage("cupcake.jpg"); //the file has to be in the same folder
   noLoop();
 }

   void draw() {
  imageMode(CENTER);
  pushMatrix();
  translate(150, 150);
  rotate(radians(45));
  image(img, 0, 0, 400, 400);
  popMatrix(); 
  }
