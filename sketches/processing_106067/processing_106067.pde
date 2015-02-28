
int total = 100;
int [] a;
int [] b;
int [] posX;
int [] posY;

void setup() {
  size(600, 600);
  frameRate(30);
  a=new int[total];
  b=new int[total];
  posX=new int[total];
  posY=new int[total];
  
    for (int i= 0; i < total; i++) {
    posX[i]=int(random(0, 600));
    posY[i]=int(random(0, 600));
    a[i] = int(random(1, 10));
    b[i] = int(random(1, 10));
    }
}

void draw() {
  background(180, 252, 240);
  for (int i= 0; i < total; i++) {
    posX[i]=posX[i]+a[i];
    posY[i]=posY[i]+b[i];
    fill (200, 0, 60, 80);
    ellipse(posX[i], posY[i], 50, 50);

    if (posX[i] > width || posX[i] < 0) {
      a[i] *= -1;
    }
    if (posY[i] > height || posY[i] < 0 ) {
      b[i] *= -1;
    }
  }
}
