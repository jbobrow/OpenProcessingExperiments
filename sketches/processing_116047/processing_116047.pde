

PImage img1, img2, img3, img4, img5;

int copy = 50 ;

void setup() {
  size(800, 350);
  background(255);
  frameRate(30);

  img1 = loadImage( "1.png");
  img2 = loadImage( "2.png");
  img3 = loadImage( "3.png");
  img4 = loadImage( "4.png" );
  img5 = loadImage( "0.png");
}
void draw() {

  float r = random(-100, 800);
  float a = random(-50, 250);
  float b = random(0, 10);
  float c = random(0, 20);
  float d = random(400, 600);
  image(img4, copy*4, r);
  image(img2, r*3, copy );
  image(img3, a*3, copy,b,r);
  image(img1, a, copy,c,r);
  image(img5, r,copy,b*10,c*5);
}

void keyPressed() {
  saveFrame("_######.png");
}



