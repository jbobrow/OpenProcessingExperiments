
// Declaring a variable of type PImage
PImage img; 

void setup() {
  size(320,240);
  // Make a new instance of a PImage by loading an image file
  img = loadImage("http://www.thebeginwithinblog.com/wp-content/uploads/2011/04/summer-vacation-beach.jpg");
}

void draw() {
  background(0);
  // Draw the image to the screen at coordinate (0,0)
  image(img,0,0);
  
  if (keyPressed) {
    if (key == 'a' || key == 'A') {
      img = loadImage("http://www.examiner.com/images/blog/replicate/EXID50917/images/SummerVacationPHotos(1).jpg");
      image(img, 0, 0);
      //fill(0);
    }
  }
}
