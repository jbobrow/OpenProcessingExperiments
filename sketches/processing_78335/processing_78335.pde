
PImage img;
PImage imgMask;

void setup() {
 noStroke();
  rectMode(CENTER);
  size(640, 640);
 
  img = loadImage("superbibi.jpg");

  imgMask = loadImage("superbibi.jpg");
  
  img.mask(imgMask);
  imageMode(CENTER);
line(0, 0, width, height);
}

void draw() {
  background(7, 50, 153);
  image(img, width/2, height/2);
  image(img, mouseX, mouseY);
   image(img, mouseX-img.width/2, mouseY-img.height/4);
   if (mousePressed) {
    fill(200);
  } else {
    fill(100);
    background(51); 
  fill(255, 204);
  rect(mouseX, height/2, mouseY/2+30, mouseY/2+10);
  
  //bibi trick
  
  fill(100, 204);
  int inverseX = width-mouseX;
  int inverseY = height-mouseY;
  rect(inverseX, height/8, (inverseY/2)+10, (inverseY/2)+10);
  }
  ellipse(mouseX, mouseY, 20, 20); // size of the bibi errow

}






