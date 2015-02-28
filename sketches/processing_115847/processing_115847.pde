
PImage img0, img1, img2, img3, img4, img5, img6, 
img7, img8, img9, img10, img11, img12, img13, img14;
float a = 0;

void setup() { 
  size(1000, 1000);
  
  background(100);
  img0 = loadImage("0.png");
  img3 = loadImage("3.png");
  img4 = loadImage("4.png");
  img5 = loadImage("5.png");
  img6 = loadImage("6.png");
  img7 = loadImage("7.png");
  img8 = loadImage("8.png");
  img9 = loadImage("9.png");
  img10 = loadImage("10.png");
  img11 = loadImage("11.png");
  img12 = loadImage("12.png");
  img13 = loadImage("13.png");
  img14 = loadImage("14.png");
}

void draw() {
  float r = random(0, 100);
  println(r);

  pushMatrix();
  translate( width/2, height/2);
  rotate(a);
  image(img9, 0, 0);

  popMatrix();
/////////////////
  pushMatrix();
  translate( 10, 40);
  rotate(a);
  image(img3, 0, 90);

  popMatrix();

/////////////////
  pushMatrix();
  translate( 800, 40);
  rotate(a);
  image(img11, 0, 0);

  popMatrix();


  pushMatrix();
  translate( 0, 90);
  rotate(a);
  image(img10, 990, 40);

  popMatrix();
  
  pushMatrix();
  translate( 0, 90);
  rotate(a);
  image(img0, 70, 40);

  popMatrix();
  
  
  pushMatrix();
  translate( 0, 90);
  rotate(a);
  image(img5, 100, 600);

  popMatrix();
  
    pushMatrix();
  translate( 0, 90);
  rotate(a);
  image(img8, 0, 600);

  popMatrix();
/////////////////



  frameRate(20); 

   
  a = a+0.01;
}
void keyPressed() { 
  saveFrame("img-####.png");
}
