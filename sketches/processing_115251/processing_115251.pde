

PImage[] img = new PImage[20]; 
float angle =0;


Fire[] a = new Fire[20];

void setup() {
  size(800, 500); 
  background(0);
  tint(255, 10);
  frameRate(20000);

  for (int i =0; i <20; i ++) {
    a[i] = new Fire();
  }

  for (int m = 0; m < 20; m ++) {
    img[m] = loadImage( m+".png");
  }
}

void draw() {


  pushMatrix();
  rotate(angle);
  angle += 1;
  image(img[8], 30, 300, 70, 70);
  popMatrix();


  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  angle += 9;
  image(img[9], 0, 0, 120, 120);
  popMatrix();

  pushMatrix();

  rotate(angle);
  angle += 30;
  image(img[17], 700, 100, 300, 30);
  popMatrix();

  for (int i =0; i<20; i++) {
    a[i].calculatingPosition();
    a[i].myImage();
  }
}


class Fire {
  float positionX, positionY;


  Fire() {
    positionX = random(0, 800);
    positionY = random(0, 500);
  }

  void calculatingPosition() {
    translate(positionX, positionY);
    rotate(angle);
    angle +=20;
  }

  void myImage() {

    for (int m = 0; m < 20; m ++) {
      image(img[2], 0, 0, 7, 7);
    }
  }
}



