


void setup() {
  size(900, 300);
  smooth();
  noStroke();
  noLoop();
}

void draw() {
  background(163,231,234);

  for ( int i= 40; i<width*2; i+=100) {

    color rc = color(random(255), random(255), random(1));
    color rsc = color(random(255), random(255), random(1));
    float sw = random(1, 1);
    float rs = random(0.5, 0.3);

    float yolkSize = random(50); //20
    float eggWhite = random(100); //50


      fryingPan(i, 0, eggWhite, sw, rs, yolkSize, rc, rsc);
  }
}
void fryingPan(float xpos, float ypos, float angle, float scaler, float eggWhite, float yolkSize, color c, color sc) { 
  pushMatrix();

  translate(xpos, ypos);

  rotate(angle);
  scale(scaler);



  //frying pan
  stroke(0);
  fill(100);
  strokeWeight(3);
  ellipse(250, 250, 120, 120);
  fill(150);
  strokeWeight(.5);
  ellipse(250, 250, 90, 90);

  //egg white
  noStroke();
  //  fill(255);
  fill(255);
  ellipse(260, 245, yolkSize+50, yolkSize+50);

  //egg yolk
  noStroke();
  fill(255, 221, 23);
  ellipse(270, 250, yolkSize-5, yolkSize-5);

  //frying pan handle
  rectMode(CENTER);
  strokeJoin(BEVEL);
  stroke(0);
  strokeWeight(3);
  fill(255, 52, 65);
  rect(250, 160, 20, 65);

  //frying pan handle hole
  noStroke();
  fill(255);
  ellipse(250, 140, 10, 10);
  popMatrix();
}

void mousePressed() {
  redraw();
}


