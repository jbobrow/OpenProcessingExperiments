
PImage img;
PImage img2;
PImage img3;
PImage img4;

void setup(){
  size(600, 600);
   
  img = loadImage("Y.png");
  img2 = loadImage("e.png");
  img3 = loadImage("a.png");
  img4 = loadImage("h.png");
}
void draw(){
  //image, variable x and y
  noStroke();
  fill(255);
  rect(0, 0, 600, 300);
  image(img, 0, 0, mouseX, 300);
  rect(0, 300, 600, 300);
  image(img2, 300, 80, 300, mouseY);
  image(img3, 600, 300, -mouseX, 300);
  image(img4, 30, 550, 150, -mouseY);
}


