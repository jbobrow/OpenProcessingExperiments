
//minim: plug-in for interpreting sounds in processing.

//void setup() {
//  size(750, 900);
//  background(45);
//}

//void means that it's a function that does NOT return a value.
//void draw() {
//  smooth();
//  noStroke();
//  background(45);
//if mouse is in the bottom right hand corner of the screen,
//make background blue.
//if mouseX is greater than half the width, and if mouseY is greater than half the height.
//  if (mouseX > width * .5) {
//    background(45, 0, 100);
//  }
//  println(mouseX + " " + mouseY);
//  if (mousePressed == true);
//  fill(35, 0, 150);
//  ellipse(width * .5, height * .5, width, 750);
//  if (mouseY > height * .5) {
//    fill(100, 0, 35);
//    ellipse(width * .5, height * .5, 50, 50);
//  }
//}

//if you don't need these two if statements to be independent, you can use "&&".
//if ((mouseX > width * .5) && (mouseY > height * .5)) {}
//if this AND this are both true, then do whatever is placed within the curly brackets.

int circle_x = 210;
int circle_y = 300;
int circle_radius = 30;
int circle_x_speed = 2;
int circle_y_speed = 2;
PImage reflectorGadget;
PImage reflectorGadgetFlipped;

void setup() {
  smooth();  
  reflectorGadget = loadImage("reflectorGadget.jpg");
  reflectorGadgetFlipped = loadImage("reflectorGadgetFlipped.jpg");
  noStroke();
  size(400, 500);
  background(45);
}
void draw() {
  background(45);
  image(reflectorGadget, 0, 0, width * .5, height * .5);
  image(reflectorGadget, width * .5, 0, width * .5, height * .5);
  image(reflectorGadgetFlipped, 0, height * .5, width * .5, height * .5);
  image(reflectorGadgetFlipped, width * .5, height * .5, width * .5, height * .5);
  strokeWeight(4);
  stroke(65, 105, 222);
  fill(252, 216, 50);
  ellipse(circle_x, circle_y, circle_radius * 2, circle_radius * 2);
  circle_x = circle_x + circle_x_speed;
  circle_y = circle_y + circle_y_speed;
  //if circle hits edge, bounce back.
  if ((circle_x > width - circle_radius) || (circle_x < 0 + circle_radius)) {
    //"||" = OR
    circle_x_speed = circle_x_speed * -1;
  }
  circle_y = circle_y + circle_y_speed;
  if ((circle_y > height - circle_radius) || (circle_y < 0 + circle_radius)) {
    circle_y_speed = circle_y_speed * -1;
    //circle_y_speed *= -1 ... this means the same thing as line 62.
  }
}

//in order for this to work, you must put the image file with your processing file. go to "sketch," 
//"add file," and then select the image file.
//you have to load image within the "void setup" brackets.


//to place the image, go within the brackets of "void draw" and...


