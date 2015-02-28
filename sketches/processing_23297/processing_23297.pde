
PImage img;
PImage drawImg;
float circleSize = 10;


void setup() {
  img = loadImage("m2.png");
  size(img.width,img.height);
  drawImg = loadImage("m3.png");
 
}
 
void draw() {
  image(drawImg,0,0);
  if(mousePressed){
    noStroke();
  fill(255);
  ellipse(mouseX,mouseY,circleSize,circleSize);
  }
  drawImg = get(0,0,width,height);
  drawImg.loadPixels();
  img.mask(drawImg);
  image(img,0,0);
  stroke(25,0,0);
  noFill();
  ellipse(mouseX,mouseY,circleSize,circleSize);
}

