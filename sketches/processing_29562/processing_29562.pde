
PImage logs;
PImage [] flames;
Fire [] flame;

void setup() {
  size (500, 500);
  flames = new PImage[4];
  flame = new Fire[50];

  for (int b = 0; b < flame.length; b++) {
    flame[b] = new Fire(random(100, 400), random(100, 400));
  }

  for (int i = 0; i<flames.length; i++) {
    flames[i] = loadImage("flame"+ (i+1) +".png");
  }
  logs = loadImage("logs.jpg");
}

void draw() {

  image(logs, 0, 0, 500, 500);
  for (int i = 0; i<flame.length; i++) {   
    flame[i].update();
  }
}

class Fire {
  float sizex =75;
  float sizey = 100;
  float tsize = 0;
  int frame=0;
  float x = 250;
  float y = 250;
  float fendx = 250;
  float fendy =250;
  int counter = 1%2;

  Fire (float xpos, float ypos) {
    x = xpos;
    y = ypos;
    fendx = x;
    fendy = y;
  }
  void update() {
    if (frame > 3) frame = 0;

    fendx += random (-100, 100);
    if (fendx<-20)fendx = -10;
    if (x < 0) x = 1;
    if (fendx>520)fendx = 10;
    if (x > 520) x = 499;
    x += (fendx-x)*0.01;

    fendy += random (-100, 100);
    if (fendy<-20)fendy = -10;
    if (y < 0) y = 1;
    if (fendy>520)fendy = 10;
    if (y > 520) y = 499;
    y += (fendy-y)*0.01;


    pushMatrix();

    translate(x, y-40);
    image(flames[frame], -38, -30, sizex, sizey);
    popMatrix();

    if (counter > 5) {
      frame ++;
      counter = 0;
    }
    counter ++;
  }
}


