
PImage myImage1;
PImage myImage2;
PImage myImage3;

void setup(){
  size(660,460);
  myImage1 = loadImage ("IMG_5624 copy.JPG");
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
  tint(mouseX,mouseX,mouseY,400);
image(myImage1,30,30,600,400);
tint(180,190,195,100);
image(myImage2,30,30,600,400);
tint(30,40,50,150);
image(myImage3,30,30,600,400);


}

