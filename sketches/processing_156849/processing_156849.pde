
int numRect = 10;
int[]rectX = new int[numRect];
int[]rectY = new int[numRect];


int rectW = 80;
int rectH = 80;
float t;
float tra;
float trb;
float easing =0.5;


void setup() {
  size(800, 800);
  int step = rectW;
  int step2 = 30;
  for (int i = 0; i < numRect - 1; i ++) {
    rectX[i] = step -width;
    rectY[i] = step -height;

    step = step + rectW * 2;
  }
}


void draw() {
  background(255);
  fill(0);
  noStroke();
  rectMode(CENTER);
  translate(width/2, height/2);
  //scale(0.2);
  float m = millis()*0.001;
  float deg = sin(m);
  float degree = map(deg, -1, 1, -HALF_PI, HALF_PI);
  float dega = cos(2*m);

  rotate(degree);

  //rotate(degree);
  //translate(width/2,height/2);


  for (int i = 0; i < numRect - 1; i ++) {
    t= map(dega, -1, 1, 80, 50);
    for (int j = 0; j < numRect - 1; j ++) {
      tra= map(dega, -1, 1, 80, 50);
      fill(0);
      rect(rectX[i], rectY[j], t, tra);

      println(t);
    }
  }

  rotate(-degree*2);
  for (int i = 0; i < numRect - 1; i ++) {

    for (int j = 0; j < numRect - 1; j ++) {
      fill(0);
      ellipse(rectX[i], rectY[j], 20, 20);
      fill(255);
      float size = map(t, 80, 50, 20, 0);
      ellipse(rectX[i], rectY[j], size, size);
      println(t);
    }
  }
  
}
//rect( rectX[i], rectY[i], rectW, rectH);



