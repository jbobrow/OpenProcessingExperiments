
float px;
float py;
float rad;
float spdX;
float spdY;

float bx, by;
float bw, bh;

color colors[];

void setup() {
  size(800, 800);
  background(255);
  smooth();

  rad = 10;
  px = -90;
  py = 132;
  spdX = 2.0;
  spdY = 1.0;

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

  println(py);

  translate(width/2, height/5);
  //Gumball falls
  fill(200, 100);
  strokeWeight(3);
  stroke(255, 0, 0);
  rect(-100, 115, 200, 500);


  //base
  stroke(255, 0, 0);
  fill(255, 0, 0);
  rect(-100, 550, 200, 85);
  triangle(100, 550, 100, 635, 175, 635);
  triangle(-100, 550, -100, 635, -175, 635);

  //particle 
  fill(0, 0, 255);
  noStroke();
  ellipse(px, py, rad*2, rad*2);

  //tray
  stroke(155);
  fill(155);
  rect(-10, 550, 35, 35);
  noFill();
  stroke(0);
  rect(-5, 555, 25, 25);

  //lines
  line(-100, 140, 50, 213);
  line(100, 228, -50, 302);
  line(-100, 318, 50, 393);
  line(100, 408, -50, 482);
  line(-100, 498, -10, 542);

  //Moving gumball
  px += spdX;
  py += spdY;

  if (px >= 100 - rad) {
    px = 100 -rad;
    spdX *= -1;
  }
  if (px <= -100 + rad) {
    px = -100 + rad;
    spdX *= -1;
  }

  if (py > 540) {
    spdX = 0.0;
  }

  if (py > 560) {
    spdY = 0.0;
  }
}


