


PImage img1, img2, myImage1;
int selMode = REPLACE;
String name = "REPLACE";
int picAlpha = 255;

void setup() {
  frameRate(4);
  size(800, 510, P3D);
  img1 = loadImage("Design DesignYEA.png");
  img2 = loadImage("Design Design%.png"); 
  noStroke();
  myImage1 = loadImage("deisn design 3.png");
}
int counter = 10;

void draw() {
  
  picAlpha = int(map(mouseX, 0, width, 0, 255));
  
  background(0);
  
  tint(255, 255);
  image(img1, 0, 0);

  blendMode(selMode);  
  tint(255, picAlpha);
  image(img2, 0, 0);
  
  
  
   rotate(random(0, 2*PI));
  
  float w1 = myImage1.width;
  float h1 = myImage1.height;
  
  float x1 = random(0, width);
  float y1 = random(0, height);
  float s1 = random(0.1, 5);
  
  tint(0, 0, 0, 100);
  image(myImage1, x1, y1, w1/s1, h1/s1);
  
    if (keyPressed) {
    if (key == 'b' || key == 'B') {
      fill(100,255,100);
    }
  } else {
    fill(255);
  }
  rect(25, 25, 50, 50);
}




 void mousePressed() {
  
  if (selMode == REPLACE) { 
    selMode = BLEND;
    name = "BLEND";
  } else if (selMode == BLEND) { 
    selMode = ADD;
    name = "ADD";
  }
} 

void mouseDragged() {
  if (height-200 < mouseY) {
    picAlpha = int(map(mouseX, 0, 800, 0, 255));
  }
}




