
PImage myImage1;
PImage myImage2;
PImage myImage3;

void setup(){
  size(660,460);
  myImage1 = loadImage ("IMG_3322.JPG");
    myImage2 = loadImage ("25176_1386925865995_1017495761_1162040_6792373_n.jpg");
    myImage3 = loadImage ("IMG_5638.JPG");
}
void draw() {
  background(0,0,0);
  fill(250,250,250);
  rect(10,10,640,440);
  fill(0,0,0);
  rect(12,12,636,436);
  fill(250,250,250);
    rect(25,25,610,410);
  tint(mouseX,mouseY,mouseX,400);
image(myImage1,30,30,600,400);

}

