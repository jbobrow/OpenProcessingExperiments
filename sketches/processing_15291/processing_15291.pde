
PImage A;
PImage B;
PImage C;

void setup(){
  size(400,400);
  A= loadImage("lacey0008.jpg");
  B= loadImage("lacey0008-1.jpg");
  C= loadImage("lacey0008-2.jpg");
}

  void draw(){
  image (A, 0, 0);
  tint(90,100, 50);
  image (B, 0, 0);
  tint (260, 80);
  image (C, 0, 0);
  tint (200,50);
}


