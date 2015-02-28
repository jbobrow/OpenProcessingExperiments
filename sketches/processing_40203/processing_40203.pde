
//Some code was borrowed from Lindsay Shelton
//however, instead of having rectangles in random places,
//the position of each square is true to its original position in the painting

PImage pic;
 
void setup() {
  size(300, 300);
  pic = loadImage("6.2 oil painting.jpg"); // painting of a night scene in a park
  noStroke();
  smooth();
  background(0);
}
 
void draw(){
}
void mousePressed() { // makes sketch interactive
  background(0);
 
  for (int x=0; x<width;x+=random(5,20)) {
 
    int a = int(random(0, pic.width));    // random x coordinate from Pic
    int b = int(random(0, pic.height));   // random y coordinate from Pic
    color cfill = pic.get(a, b);      // get a color from Pic
 
    fill(cfill);  //each square is filled with a different color from the palate
    rect(a, b, 20, 20);  // the position of each square in the sketch is true to its original location in the picture
  }
}


