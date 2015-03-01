
PImage alphaImg;
void setup() {
  background(0);
  size(900, 700);
  // This image is partially transparent 
  alphaImg = loadImage("dog-02.png");
}
void draw() {
  frameRate(15);
  if(mousePressed == true){
  int ix = mouseX - alphaImg.width/2; 
  int iy = mouseY - alphaImg.height/2; 
  image(alphaImg, ix, iy);}
}



