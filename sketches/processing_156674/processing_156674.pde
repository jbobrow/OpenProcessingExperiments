

PImage img1;
PImage img2;
int count;
int imageNumber;

void setup() {
  background(0);
  size(500, 500);
 
  fill(255);
 
  img1 = loadImage("gimage1.jpg");
  img2 = loadImage("gimage2.jpg");
  imageMode(CENTER);
}

void draw() {
  if (count == 0) {
    if (imageNumber == 0) {
      image(img1, width/2, height/2);
    }
    if (imageNumber == 1) {
      image(img2, width/2, height/2);
    }
    imageNumber = (imageNumber + 1)%5;
  }
  count = (count + 5)%40;
}



