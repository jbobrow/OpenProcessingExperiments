
PImage imgone;
PImage imgtwo;
PImage imgthree;
PImage img;
int smallPoint, largePoint;

void setup() {
  size(1200, 600);
  img = loadImage("spiderman-face.png");
  smallPoint = 4;
  largePoint = 40;
  imageMode(CENTER);
  noStroke();
  background(0);
}

void draw() { 
  if (mousePressed) {
    background(255);
    imgone = loadImage("ByUzi.jpg");
    image(imgone, 100, 300);
    imgthree = loadImage("Title.png");
    image(imgthree, 700, 300);
  } else {
    background(0);
    imgtwo = loadImage("btClickHere.png");
    image(imgtwo, 750, 300);
    
    //img = loadImage("spiderman-face.png");
    
  }
  line(mouseX-66, mouseY, mouseX+66, mouseY);
  line(mouseX, mouseY-66, mouseX, mouseY+66); 
   float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
  int x = int(random(img.width));
  int y = int(random(img.height));
  color pix = img.get(x, y);
  fill(pix, 128);
  ellipse(x, y, pointillize, pointillize);
  image(img, 0, height/2, img.width/2, img.height/2);
}



