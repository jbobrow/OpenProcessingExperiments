
PImage img0, img1, img2, img3,img4,img5;
float a=0;


void setup() {
  size(800, 500);
  background(150,120,250); 
  img0 = loadImage("0JPG.jpg");
  img1= loadImage("1.jpg");
  img2= loadImage("2.jpg");
  img3= loadImage("3.jpg");
  img4= loadImage("4.jpg");
  img5= loadImage("5.jpg");
  frameRate(8);
}

void draw() {
  pushMatrix();
  translate( width/2, height/2);

  rotate(a);

  image(img0, 0, 0, mouseX, mouseY);
  image(img1, 0, 0, 250, 500);
  image(img2, 0, 0, 200, 450);
  image(img3, 0, 0, 250, 500);
  image(img4, 0, 0, 200, 450);
  image(img5, 0, 0, 100, 300);
  popMatrix();

  a=a+0.01;
  //rintln(mouseX+":"+mouseY);
}
void keyPressed() {
  saveFrame("img-####.jpg");
}
