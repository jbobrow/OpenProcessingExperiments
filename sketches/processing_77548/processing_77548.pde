
PImage img;
PImage img1;
int value = 0;

void setup() {
  size(500,352);
  img = loadImage("puppy.jpg");
  img1 = loadImage("johnny.jpg");
}

void draw() {
  fill(value);
  rect(25, 25, 50, 50);

  image(img, 0, 0);


if (mousePressed == true) {
  image(img1, 0, 0);
    fill(0);
  } else {
    fill(255);
  }
  
}



//void mousePressed() {
  //image(img1, 0, 0);
  //if (value == 0) {
    //value = 255;
 // } else {
 //   value = 0;
 // }
//}

