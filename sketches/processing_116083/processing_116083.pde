

PImage[] img = new PImage[21];
PImage img20;
float offset = 0;
int copy = 50 ; 
float angle1 = 0; 
float angle2 = 0; 

void setup() {
  size(1000, 750); 
  img20 = loadImage("20.png");
  for (int i = 0; i < 20; i ++) {
    img[i] = loadImage( i+".png");
  }
  // image(img20, 0, 0);
}

void draw() {

  frameRate(10);
  image(img20, 0, 0);
  for (int i = 0; i < 20; i ++) {
    image(img[i], random(0, 1000), random(0, 800));
    noTint();
  }

  for (int i = 0; i < 20; i++) {
    image(img[i], copy*i, random(500, 650));
    tint(255, 100);
  }

  for (int i = 0; i < 12 && i > 3 ; i ++) {
    scale(0.5);
    image(img[i], random(0, 5000), random(0, 4600));
    //tint(255, 100);
  }




  pushMatrix();
  translate(width/2, height/2);
  rotate(angle1);
  image(img[6], 0, 0);
  image(img[9], 0, 0);
  popMatrix();
  angle1 = angle1+ 0.1;

  pushMatrix();
  translate(width/2, height/2);
  rotate(angle2);
  scale(0.5);
  image(img[6], 0, 0);
  popMatrix();
  angle2 = angle2+ 30;

  image(img[10], mouseX, mouseY);
  println(angle2);
}



void keyPressed() {
  saveFrame("_######.png");
}



