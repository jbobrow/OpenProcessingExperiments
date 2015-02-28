
/*@pjs preload="screentest.jpg"*/

/* load in an image and set the size,
then mousedown anywhere and color will appear in the output window*/

PImage img;

void setup(){
   size(391,369);
   smooth();

   img  = loadImage("screentest.jpg");
 
}

void draw() {
  image(img, 0, 0);
}

void mousePressed() {
  
  color theColor = get(mouseX,mouseY);
  float cr = red(theColor);
  float cg = green(theColor);
  float cb = blue(theColor);
  
  println("At point " + mouseX + "," + mouseY + " "+ "the color is color(" + int(cr) + "," + int(cg) + "," + int(cb) +")");
  println();
  
}


