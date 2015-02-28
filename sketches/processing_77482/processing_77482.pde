
PImage myImage;

void setup() {
  size(500, 399);
  imageMode(CENTER);
  myImage = loadImage("rdjr.jpg");
  image(myImage, width/2, height/2);
  noStroke();
}

void draw() {

  for ( int i = 0; i < 1000; i++) {

    int x = int(random(0, width));
    int y = int(random(0, height));

    float diagonal = dist(0, 0, width, height);
    float tempSize = dist(mouseX, mouseY, x, y);
    float rectSize = map(tempSize, 0, diagonal, 1, 100);

    color getColor = myImage.get(x, y);
    fill(getColor, 50);
    rect(x, y, rectSize, rectSize);
  }
}


