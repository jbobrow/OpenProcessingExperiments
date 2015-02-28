
void setup () {
  size (780, 200);
  smooth ();
  noLoop ();
}

void draw () {
  background (#DBCCCB);
  if (mouseX>100) {
    eye(20, -5, color(random(150,200), random(150,200), random(150,200)));
    eye(170, -5, color(210, random(230), 230));
    eye(320, -5, color(180, 220, random(200)));
    eye(470, -5, color(210, random(230), 180));
    eye(620, -5, color(random(200), 240, 180));

    eye(95, 80, color(180, 180, random(200)));
    eye(245, 80, color(random(200), 180, 190));
    eye(395, 80, color(210, random(230), 230));
    eye(545, 80, color(180, 200, random(200)));
  }
  if (mouseX<100) {
    background(#CBDBD8);
    line(15,15);
    line(165,15);
    line(315,15);
    line(465,15);
    line(615,15);
    
    line(90,90);
    line(240,90);
    line(390,90);
    line(540,90);
  }
}



void eye(float x, float y, color c) {

  pushMatrix();
  translate(x, y); 
  //eye draw
  stroke(140);
  strokeWeight(3);
  fill(140);
  arc(70, 114, 167, 167, radians(220), radians(320), OPEN);
  fill(255);
  arc(70, 128, 180, 180, PI+QUARTER_PI, TWO_PI-QUARTER_PI, OPEN);
  arc(70, 0, 180, 180, QUARTER_PI, PI-QUARTER_PI, OPEN);
  fill(c);
  ellipse(70, 64, 51, 51);
  fill(255);
  noStroke();
  ellipse(63, 63, 10, 10);
  popMatrix();
}

void line(float x, float y) {
  pushMatrix();
  translate(x, y); 
  stroke(150);
  strokeWeight(5);
  noFill();
  arc(72, -30, 180, 180, radians(50), radians(130));
  popMatrix();
}

void mousePressed() {
  redraw();
}



