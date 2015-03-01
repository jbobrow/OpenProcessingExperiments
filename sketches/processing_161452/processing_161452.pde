
PImage img; 
PImage img2;

void setup(){ 
  img = loadImage("nyancat.jpeg");
  img2 = loadImage("space.jpg");
  size (900,720, P3D);
  background (img2);
}

void draw () {
  if (mousePressed){
  for (int i = 0; i <100; i++) {
  for (int j = 0; j <100; j++) {
    int k = (int)random(0,10);
    pushMatrix();
    translate(40*j, 40*i);
    rotateX(PI/k);
    rotateY(PI/k);
    float o = i*j;
    tint((int)random(0,255), (int)random(0,255), (int)random(0,255));
    image (img, 0, 0, (int)random(30,70), (int)random(30,70));
    popMatrix();
  }
  
  }
  }
}
