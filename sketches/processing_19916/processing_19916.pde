
//B.Severns
//1-30-11
//Database Computational Design
//www.bseverns.com

int s = 6;
Float y = random(10);

void setup() {
  size(300, 500);
  background(0);
  frameRate(3);
  smooth();
}

void draw() {
  translate(0, height);
  scale(1.0, -1.0); //start things at bottom left
  colorMode(RGB);
  pushMatrix(); //Start shifting the image from bottom left
  translate(150, 250);//move shape
  for (int i = 0; i < 18; i++) {
    stroke(231, 242, 0);
    strokeWeight(i);
    rotate(PI/7);
    line(0, 0, 55, 0);
  }

  translate(-75, -50);//move shape again
  for (int r = 0; r < 7; r++) {
    strokeWeight(r);
    stroke(242, 62, 22);
    rotate(PI/7);
    beginShape(TRIANGLE_STRIP);
    noFill();
    vertex(random(0,75), random(0,30));
    vertex(random(0,10), random(0,20));
    vertex(random(0,75), random(0,50));
    vertex(random(0,20), random(0,60));
    vertex(random(0,90), random(0,70));
    vertex(random(0,35), random(0,85));
    endShape();
  }

  translate(-65, -140);//and moving again
  stroke(89, 30, 35);
  fill(231, 242, 0);
  rotate(-PI/12);
  rect(0, 0, 280, 30);

  stroke(2, 115, 51, 60);
  for (int t = 0; t < 100; t++) {
    strokeWeight(y);
    float offset = y * 5;
    line(t-20, 100, t+offset, 0);
  }
  popMatrix();//back to bottom left for origin

  stroke(60);// generate random lines/beziers
  strokeWeight(1);
  line(random(300), random(500), random(300), random(500));
  line(random(300), random(500), random(300), random(500));
  line(random(300), random(500), random(300), random(500));
  noFill();
  bezier(random(300), random(500), random(300), random(500), random(300), random(500), random(300), random(500));
  bezier(random(300), random(500), random(300), random(500), random(300), random(500), random(300), random(500));


  stroke(85);
  fill(random(10, 255), random(10, 255), random(10, 255), 100);
  for (int e = 0; e < 300; e += 35) {
    for (int h = 0; h < 300; h += 35) {
      ellipse(random(e), random(h), random(5, 45), random(30));

      if (h > 100) { //circles get more transparent as it moves up and right
        fill(random(10, 255), random(10, 255), random(10, 255), 75);
      } 
      else if (h > 250) {
        fill(random(10, 255), random(10, 255), random(10, 255), 50);
      } 
      else if (h > 400) {
        fill(random(10, 255), random(10, 255), random(10, 255), 25);
      }
    }
  }
}


