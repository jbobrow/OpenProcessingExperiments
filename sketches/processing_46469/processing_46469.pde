
PImage myImage1;
PImage myImage2;
PImage myImage3;

void setup(){
  size(460,660);
  myImage1 = loadImage ("IMG_0314.JPG");
    myImage2 = loadImage ("IMG_0352.JPG");
    myImage3 = loadImage ("IMG_0328.JPG");
}
void draw() {
  background(0,0,0);
  fill(250,250,250);
  rect(10,10,440,640);
  fill(0,0,0);
  rect(12,12,436,636);
  fill(250,250,250);
    rect(25,25,410,610);
  tint(10,3,mouseX,300);
image(myImage1,30,30,400,600);
  tint(30,21,mouseY,200);
image(myImage2,30,30,400,600);
  tint(mouseX,5,5,100);
image(myImage3,30,30,400,600);

}

