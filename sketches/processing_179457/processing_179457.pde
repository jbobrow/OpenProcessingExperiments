
PImage hituji, happy;
PFont hello;

int POINT_NUM =250;
float[] eSize = new float[POINT_NUM];

float[] posX = new float[POINT_NUM];
float[] posY = new float[POINT_NUM];
boolean [] on = new boolean[POINT_NUM];
float speed = 5; 
int mokospeed = 1;
float frection = 6;
float counter, count, mousecount;
boolean eOn = true;
boolean gohyaku = false;
boolean sen = false;

void setup() {
  smooth();
  size(669, 900);
  hituji = loadImage("hitujiog.png");
  happy = loadImage("HAPPY.png");
  hello = loadFont("AvenirNext-UltraLight-100.vlw");

  for (int  i = 0; i < POINT_NUM; i ++) {
    posX[i] = random(180, 550);
    posY[i] = random(330, 550);
    eSize[i] = random(70, 80);
    on[i] = false;
  }
  noStroke();
}

void draw() {
  background(#FAAC5D);

  //羊レイヤー 画像読み込み
  image(hituji, 20, 120, 612, 792);
  for (int i =0; i < POINT_NUM; i ++) {
    if (eOn == true) {
      if (mouseX > posX[i] - eSize[i]/2 && mouseX < posX[i] + eSize[i]/2) {
        if (mouseY > posY[i] - eSize[i]/2 && mouseY < posY[i] + eSize[i]/2) {
          on[i] = true;
        }
      }
    }
    if (on[i] == true) {
      posY[i] += speed;
      if (posY[i] > random(700, 800)) {
        on[i] = false;
        counter ++;
      }
    }


    count = map(counter, 0, POINT_NUM, 0, width);

    fill(#E5942A);
    rect(0, 0, count, 250);

    noStroke();
    fill(240);
    ellipse(posX[i], posY[i], eSize[i], eSize[i]);

    if (counter == POINT_NUM) {
      gohyaku = true;
    } else if (counter > 1000) {
      counter = POINT_NUM;
    }
    if (gohyaku == true) {
      image(happy, -80, 0, 749, 250);
      eOn = false;
    }
  }
}



