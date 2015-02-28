

PImage[] img = new PImage[20];
int sheep = 1;
int wolf = 30;
float angle = 0;

void setup() {
  size(900, 600);
  for (int i = 0; i < 20; i ++) {
    img[i] = loadImage( i+".png");
  }
  image(img[19], 0, 0);
  frameRate(10);
}

void draw() {

  for (int i = 0; i < 20; i ++) {
    img[i] = loadImage( i+".png");
  }
  image(img[19], 0, 0);

  float s = random(-50, 100);
  float s2 = random(100, 600);
  float s3 = random(100, 200);
  float s4 = random(100, 600);
  float w = random(400, 600);
  float w2 = random(100, 300);
  float w3 = random(600, 900);
  float w4 = random(300, 600);

  for (int i = 0; i < 5; i ++) {
    image(img[i], s, s2);
  }

  for (int l = 5; l < 10; l ++) {
    image(img[l], s3, s4);
  }


  for (int i = 10; i < 15; i ++) {
    image(img[i], w, w2);
  }
  for (int i = 15; i < 18; i ++) {
    image(img[i], w3, w4);
  }

  pushMatrix();
  frameRate(50);
rotate(angle);
  image(img[18], 0, 0);
  translate(width/2, height/2);
  popMatrix();
  angle = angle+0.05;
}


void keyPressed() {
  saveFrame("img-####.png");//if press key, and capture
}



