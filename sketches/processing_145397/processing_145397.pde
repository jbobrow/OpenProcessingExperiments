
PImage p0, p1, p2, p3, p4, p5, p6, p7, p8, p9;

PImage [] picArray = new PImage [10];


void setup() {
  size(500, 500);
  background(255);
  p0 = loadImage("1.png");
  p1 = loadImage("2.png");
  p2 = loadImage("3.png");
  p3 = loadImage("4.png");
  p4 = loadImage("5.png");
  p5 = loadImage("6.png");
  p6 = loadImage("7.png");
  p7 = loadImage("8.png");
  p8 = loadImage("9.png");
  p9 = loadImage("10.png");
  picArray[0] = p0;
  picArray[1] = p1;
  picArray[2] = p2;
  picArray[3] = p3;
  picArray[4] = p4;
  picArray[5] = p5;
  picArray[6] = p6;
  picArray[7] = p7;
  picArray[8] = p8;
  picArray[9] = p9;
  
}

void draw() {

  }
  

void mousePressed() {
  background(255);
  
  for(int b=0; b<11; b++){
  float r = random(500);
  imageMode(CENTER);
  tint(random(255), random(255), random(255), random(255));
  image(picArray[int(random(picArray.length))], 250, 250, r, r);
}
}



