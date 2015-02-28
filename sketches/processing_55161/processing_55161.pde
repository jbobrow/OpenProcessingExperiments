
int GUMBALL_COUNT = 100;

float rad;

float px[] = new float[GUMBALL_COUNT];
float py[] = new float[GUMBALL_COUNT];
float spdX[] = new float[GUMBALL_COUNT];
float spdY[] = new float[GUMBALL_COUNT];

float bx, by;
float bw, bh;

color colors[] = new color[GUMBALL_COUNT];

void setup() {
  size(800, 800);
  background(255);
  smooth();

  rad = 10;

  for (int i = 0; i < GUMBALL_COUNT; i++) {
    px[i]= -90;
    py[i] = 132;
    spdX[i] = 0.0;
    spdY[i] = 0.0;
    colors[i] = color(random(255), random(255), random(255));
  }

  spdX[0] = 2.0;
  spdY[0] = 1.0;

  translate(width/2, height/5);


  //Gumball holder 
  stroke(0);
  strokeWeight(3);
  fill(200);
  ellipse(0, 0, 300, 300);

  //Gumballs
  strokeWeight(1);
  for (int r = 0; r < 150; r+=10) {
    int r2 = int(r * 0.5);
    for (int c = -140+r2; c <= 140-r2 ; c+=10) {
      fill (random(255), random(255), random(255));
      ellipse(c, r, rad*2, rad*2);
      fill(random(255), random(255), random(255));
      ellipse(-140, 10, rad*2, rad*2);
      fill(random(255), random(255), random(255));
      ellipse(-140, 10, rad*2, rad*2);  
      fill(random(255), random(255), random(255));
      ellipse(-138, 20, rad*2, rad*2);
      fill(random(255), random(255), random(255));
      ellipse(-135, 30, rad*2, rad*2);
      fill(random(255), random(255), random(255));
      ellipse(-133, 40, rad*2, rad*2);
      fill(random(255), random(255), random(255));
      ellipse(-130, 50, rad*2, rad*2);
      fill(random(255), random(255), random(255));
      ellipse(-127, 60, rad*2, rad*2);
      fill(random(255), random(255), random(255));
      ellipse(-120, 70, rad*2, rad*2);
      fill(random(255), random(255), random(255));
      ellipse(-115, 80, rad*2, rad*2);
      fill(random(255), random(255), random(255));
      ellipse(-105, 90, rad*2, rad*2);
      fill(random(255), random(255), random(255));
      ellipse(-100, 100, rad*2, rad*2);
      fill(random(255), random(255), random(255));
      ellipse(-95, 105, rad*2, rad*2);
      fill(random(255), random(255), random(255)); 
      ellipse(140, 10, rad*2, rad*2);
      fill(random(255), random(255), random(255));
      ellipse(140, 10, rad*2, rad*2);  
      fill(random(255), random(255), random(255));
      ellipse(138, 20, rad*2, rad*2);
      fill(random(255), random(255), random(255));
      ellipse(135, 30, rad*2, rad*2);
      fill(random(255), random(255), random(255));
      ellipse(133, 40, rad*2, rad*2);
      fill(random(255), random(255), random(255));
      ellipse(130, 50, rad*2, rad*2);
      fill(random(255), random(255), random(255));
      ellipse(127, 60, rad*2, rad*2);
      fill(random(255), random(255), random(255));
      ellipse(120, 70, rad*2, rad*2);
      fill(random(255), random(255), random(255));
      ellipse(115, 80, rad*2, rad*2);
      fill(random(255), random(255), random(255));
      ellipse(105, 90, rad*2, rad*2);
      fill(random(255), random(255), random(255));
      ellipse(100, 100, rad*2, rad*2);
      fill(random(255), random(255), random(255));
      ellipse(95, 105, rad*2, rad*2);
    }
  }
}

void draw() {

  if (frameCount % 120 == 0) {
    int i = frameCount / 120;
    spdX[i] = 2.0;
    spdY[i] = 1.0;
  }

  translate(width/2, height/5);

  //Gumball falls
  fill(200, 100);
  strokeWeight(3.5);
  stroke(255, 0, 0);
  rect(-100, 115, 200, 500);

  //base
  stroke(255, 0, 0);
  fill(255, 0, 0);
  rect(-100, 550, 200, 85);
  triangle(100, 550, 100, 635, 175, 635);
  triangle(-100, 550, -100, 635, -175, 635);

  //lines
  line(-100, 140, 50, 213);
  line(100, 228, -50, 302);
  line(-100, 318, 50, 393);
  line(100, 408, -50, 482);
  line(-100, 498, -10, 542);



  for (int i = 0; i<GUMBALL_COUNT; i++) {
    //particle 
    fill(colors[i]);
    noStroke();
    ellipse(px[i], py[i], rad*2, rad*2);

    //Moving gumball
    px[i] += spdX[i];
    py[i] += spdY[i];

    if (px[i] >= 100 - rad) {
      px[i] = 100 -rad;
      spdX[i] *= -1;
    }
    if (px[i] <= -100 + rad) {
      px[i] = -100 + rad;
      spdX[i] *= -1;
    }

    if (py[i] > 540) {
      spdX[i] = 0.0;
    }

    if (py[i] > 560) {
      spdY[i] = 0.0;
    }
  }

  //Gumball dispenser
  fill(255, 0, 0);
  noStroke();
  rect(-100, 115, 30, 30);

  //tray
  stroke(155);
  fill(155);
  rect(-10, 550, 35, 35);
  noFill();
  stroke(0);
  rect(-5, 555, 25, 25);
}


