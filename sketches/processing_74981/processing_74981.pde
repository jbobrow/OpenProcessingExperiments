
  int x1 = width/2;
  int x2 = width/2;
  int x3 = 0;
  int x4 = 0;

  int y1 = 0;
  int y2 = width/2;
  int y3 = width/2;
  int y4 = 0;

PImage img1;
PImage img2;
PImage img3;
PImage img4;

void setup() {
  size(400, 400);

  img1 = loadImage("1.jpg");
  img2 = loadImage("2.jpg");
  img3 = loadImage("3.jpg");
  img4 = loadImage("4.jpg");
}

void draw() {



  background(255);

  image(img1, x1, y1);
  image(img2, x2, y2);
  image(img3, x3, y3);
  image(img4, x4, y4);

  if (mousePressed) { 

    x1 = 0;
    x2 = width/2;
    x3 = 0;
    x4 = width/2;

    y1 = 0;
    y2 = 0;
    y3 = width/2;
    y4 = width/2;
  } 
  else {   
    x1 = width/2;
    x2 = width/2;
    x3 = 0;
    x4 = 0;

    y1 = 0;
    y2 = width/2;
    y3 = 0;
    y4 = width/2;
     
  }
}



