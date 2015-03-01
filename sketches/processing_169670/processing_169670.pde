


PImage img;
//load image as is (grayscaled)


void setup() {
  size(570, 800, P3D);
  img = loadImage("800.png");
  colorMode(RGB, 10000);
  //I can assign the range of color value here. what is range? 
  frameRate(24);
}

void draw() {
  //background(255,100);
  //  background(200, 30);
  translate(0, 0, -20);
  //extreme closeup shot
  //  rotateX(radians(mouseY));
  rotateY(radians(mouseX/10));
  for (int i=0; i<5000; i++) {
    //according to the color value of the each pixels 
    //the length of the line in z axis varies
    //and the color of the lize in z axis varies as well.
    //so I use get function to get the color value of each pixels
    //then make it to grayscale
    //then assign it to integer z 


    int x = int(random(width));
    int y = int(random(height));

    color pix = img.get(x, y);

    color c = color(pix);
    int z = int (c);
    if (mousePressed) {
      image(img, 0, 0);
    } else {
      stroke(c, 80);
      strokeWeight(10);
      line(x, y, 0, x, y, 100);
    }
  }
}



