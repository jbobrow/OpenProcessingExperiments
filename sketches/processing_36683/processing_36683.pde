
                                                                         void setup() {

  size (600, 600);
  mouseClicked();
}

void draw() {
  smooth();
  noStroke();
}
void mouseClicked() {
  background(255); // Background Color = White
  for (float i=3; i<random(5,50); i=i+random(1,10)) {
    float ax= 10;
    //arc
    stroke(0, 100);
    noFill();
    arc(300+ax, 300, random(100, 500), random(100, 500), 0, PI/2);
    arc(300, 300, random(100, 500), random(100, 500), PI/2, PI);
    arc(300, 300, random(100, 500), random(100, 500), PI, TWO_PI-PI/2);
    arc(300, 300, random(100, 500), random(100, 500), TWO_PI-PI/2, TWO_PI);

    //arc
    stroke(40, 70+ax/300);
    noStroke();
    fill(0, random(10, 50));
    arc(300+ax, 300, random(100, 500), random(100, 500), 0, PI/2);
    arc(300, 300, random(100, 500), random(100, 500), PI/2, PI);
    arc(300+ax, 300, random(100, 500), random(100, 500), PI, TWO_PI-PI/2);
    arc(300, 300, random(100, 500), random(100, 500), TWO_PI-PI/2, TWO_PI);

    //the curves go from top left to bottom right
    strokeWeight(2);
    stroke(0, random(0, 100));
    noFill();
    beginShape();
    curveVertex(0, 0);
    curveVertex(1*i, ax);
    curveVertex(random(600), random(600));
    curveVertex(random(600), random(600));
    curveVertex(599*i, 599);
    curveVertex(600, 600);
    endShape();

    //the curves go from top right to bottom left (orange)
    strokeWeight(2);
    stroke(255, 128, i*3, 40);
    noFill();
    beginShape();
    curveVertex(600, 0);
    curveVertex(599, 2);
    curveVertex(random(600), random(600));
    curveVertex(random(600), random(600));
    curveVertex(2, 599);
    curveVertex(0, 600);
    endShape();



    //the black scattered  dots
    for (int e=20; e<800; e=e+5) {
      stroke(0);
      point(e*random(1, 10), ax);
    }

    //the yellow scattered  dots
    for (int b=20; b<800; b=b+5) {
      strokeWeight(random(1, 4));
      stroke(247, 182, 0);
      point(b*random(1, ax), random(600));
      //the bluish scattered squares
      noStroke();
      fill(random(ax, 255), random(220, 255), random (200, 255), random(30, 90));
      rect(b*random(1, ax), random(600), random (1, 50), random (1, 50));
    }
    //the scattered red dots
    for (int b=20; b<800; b=b+9) {
      strokeWeight(random(1, 7));
      stroke(255, ax, ax);
      point(random(0, 600), random(1, 600));
    }


    //the random triangles 
    float ay = random(0, 600);
    float by = random(abs(ay+1), abs(ay+100));
    float cy = random(abs(by+1), abs(by+100));

    ax = i*5;
    float bx = random(abs(ax+1), abs(ax+100));
    float cx = random(abs(bx+1), abs(bx+100));
    noStroke();
    fill (random (0, 200), 235, 255);
    triangle(ax, ay, bx, by, cx, cy);

    //the second set of scattered squares
    noStroke();
    fill(234, random(158, 234), 154, random(30, 90));
    rect(cx, cy, by, bx);

    //second set of small triangles
    float xy = random(150, 550);
    float yy = random(abs(xy+1), abs(xy+50));
    float zy = random(abs(yy+1), abs(yy+50));

    ax = i*8;
    float yx = random(abs(ax+1), abs(ax+50));
    float zx = random(abs(yx+1), abs(yx+50));
    noStroke();
    fill (203, 154, 27);
    triangle(ax, xy, yx, yy, zx, zy);

    //all the lines
    stroke(random(100, 255), 99, 87, random(30, 60));
    strokeWeight(random(1, 5));
    float r=(random(1, 2));
    for (int t=3; t<200; t=t+20) {
      ax= ax+4;
      line(r*t, 600, ax, 0);
    }
  }
}

