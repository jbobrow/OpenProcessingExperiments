
PImage cloud;
PImage grass;
int rain = 250;
float[] x = new float[rain];
float[] y = new float[rain];

void setup() {
  size(600, 800);
  cloud= loadImage ("c.gif");
  grass= loadImage ("g.png");
  smooth();
  //used for rain at beginning of hour
  for (int i=0; i<rain; i++) {
    x[i]= random(600);
    y[i]= random(800);
  }
}

void draw() {
  background(#00A1F0);

  int[] time = {
    second(), minute(), hour()
  };
  int s = time[0];
  int m = time[1];
  int h = time[2];
  int[] num = {
    50, 3, 10
  };
  int a = num[0];//for ellipses (sun/cloud)
  int b = num[1];//stroke weight rays
  int c = num[2];//moving grass


  //sun
  noStroke();
  fill(#FFF703);
  ellipse (300, 475, 3*a, 3*a);


  //sun rays; shows the hour
  if (h == 1 || h == 13) {
    stroke(255);
    strokeWeight(2*b);
    line(340, 400, 390, 280);
  }
  else {
    stroke(#FFF703);
    strokeWeight(b);
    line(343, 403, 410, 290);
  }
  if (h == 2 || h == 14) {
    stroke(255);
    strokeWeight(2*b);
    line(375, 435, 490, 360);
  }
  else {
    stroke(#FFF703);
    strokeWeight(b);
    line(375, 435, 490, 360);
  }
  if (h == 3 || h == 15) {
    stroke(255);
    strokeWeight(b*2);
    line(385, 475, 515, 475);
  }
  else {
    stroke(#FFF703);
    strokeWeight(b);
    line(385, 475, 515, 475);
  }
  if (h == 4 || h == 16) {
    stroke(255);
    strokeWeight(2*b);
    line(370, 520, 490, 580);
  }
  else {
    stroke(#FFF703);
    strokeWeight(b);
    line(370, 520, 490, 580);
  }
  if (h == 5 || h == 17) {
    stroke(255);
    strokeWeight(2*b);
    line(342, 547, 415, 665);
  }
  else {
    stroke(#FFF703);
    strokeWeight(b);
    line(342, 547, 415, 665);
  }
  if (h == 6 || h == 18) {
    stroke(255);
    strokeWeight(b*2);
    line(300, 560, 300, 690);
  }
  else {
    stroke(#FFF703);
    strokeWeight(b);
    line(300, 560, 300, 690);
  }
  if (h == 7 || h == 19) {
    stroke(255);
    strokeWeight(2*b);
    line(260, 550, 190, 660);
  }
  else {
    stroke(#FFF703);
    strokeWeight(b);
    line(260, 550, 190, 660);
  }
  if (h == 8 || h == 20) {
    stroke(255);
    strokeWeight(2*b);
    line(225, 520, 100, 580);
  }
  else {
    stroke(#FFF703);
    strokeWeight(b);
    line(225, 520, 100, 580);
  }
  if (h == 9 || h == 21) {
    stroke(255);
    strokeWeight(2*b);
    line(215, 475, 85, 475);
  }
  else {
    stroke(#FFF703);
    strokeWeight(b);
    line(215, 475, 85, 475);
  }
  if (h == 10 || h == 22) {
    stroke(255);
    strokeWeight(2*b);
    line(225, 435, 100, 370);
  }
  else {
    stroke(#FFF703);
    strokeWeight(b);
    line(225, 435, 100, 370);
  }
  if (h == 11 || h == 23) {
    stroke(255);
    strokeWeight(2*b);
    line(258, 402, 190, 280);
  }
  else {
    stroke(#FFF703);
    strokeWeight(b);
    line(258, 402, 190, 280);
  }
  if (h == 12 || h == 00) {
    stroke(255);
    strokeWeight(2*b);
    line(300, 390, 300, 260);
  }
  else {
    stroke(#FFF703);
    strokeWeight(b);
    line(300, 390, 300, 260);
  }

  //cloud; shows seconds as moving across screen
  image(cloud, s*10, 10);

  //grass growing for first 30 mins
  if (m<30) {
    image(grass, 0, 800-(m*2));
  };
  //grass shrinks for second 30 mins
  if (m>29) {
    image(grass, 0, 680+(m*2));
  };

  //rain at beginning of every hour
  if (m==0) {
    noStroke();
    fill(0, 0, 255);
    for (int i=0; i<rain; i++) {
      //move ellipses back on screen if they go off edge
      if (y[i] > height) {
        y[i] = -5;
      }
      //add one to x location
      y[i]++;

      //draw shape
      ellipse(x[i], y[i], 7, 7);
    }
  }
}


