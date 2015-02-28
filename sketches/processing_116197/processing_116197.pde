
PImage img0, img1, img2, img3,img4, img5, img6,img7, img8, img9;
PImage img10, img11, img12, img13,img14, img15, img16,img17, img18, img19;
float a=0;


void setup() {
  size(800, 500);
  img0 = loadImage("0.png");
  img1= loadImage("1.png");
  img2= loadImage("2.png");
  img3= loadImage("3.png");
  img4= loadImage("4.png");
  img5= loadImage("5.png");
  img6= loadImage("6.png");
  img7= loadImage("7.png");
  img8= loadImage("8.png");
  img9= loadImage("9.png");
  img10= loadImage("10.png");
  img11= loadImage("11.png");
  img12= loadImage("12.png");
  img13= loadImage("13.png");
  img14= loadImage("14.png");
  img15= loadImage("15.png");
  img16= loadImage("16.png");
  img17= loadImage("17.png");
  img18= loadImage("18.png");
  img19= loadImage("19.png");
  frameRate(20);
}

void draw() {
  pushMatrix();
  translate( width/2, height/2);

  rotate(a);

  image(img0, 0, 0, mouseX, mouseY);
  image(img1, 0, 0, 5, 5);
  image(img2, 0, 0, 50, 40);
  image(img3, 0, 0, 20, 10);
  image(img4, 0, 0, 50,13);
  image(img5, 0, 0, 250, 10);
  image(img6, 0, 0, 40, 420);
  image(img7, 0, 0, 40, 20);
  image(img8, 0, 0, 250, 53);
  image(img9, 0, 0, 10, 51);
  image(img10, 0, 0, 50, 30);
  image(img11, 0, 0, 20, 500);
  image(img12, 0, 0, 2, 500);
  image(img13, 0, 0, 20, 500);
  image(img14, 0, 0, 22, 500);
  image(img15, 0, 0, 10, 500);
  image(img16, 0, 0, 10, 30);
  image(img17, 0, 0, 250, 30);
  image(img18, 0, 0, 230, 10);
  image(img19, 0, 0, 20, 10);
  popMatrix();

  a=a+0.01;
  //rintln(mouseX+":"+mouseY);
}
void keyPressed() {
  saveFrame("img-####.jpg");
}



