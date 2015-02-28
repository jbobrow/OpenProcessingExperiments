



void setup () {

  noLoop(); 
  size(800, 200);
  smooth();
}


void draw () {
  background (#DED986);
    ellipseMode(CENTER);
    

  for ( int i=40; i<width; i+=80  ) {


    float sw =random(10);
    float  ra = random(TWO_PI);
    float rs = random(0.1, 1.5);
    color rc = color (random(255), random(255), random(255));
    color rsc = color (random(255), random(255), random(255));



    lamp (i, height/2, sw, ra, rs, rc, rsc);
  }
}

void lamp (float xpos, float ypos, float sw, float angle, float scaler, color c, color sc) { 



  pushMatrix();


  strokeWeight(sw);
  stroke(sc);
  rotate(angle);
  scale(scaler);

  fill(c);
  translate(xpos, ypos);
  quad(36, 6, 78, 6, 108, 60, 6, 60);

  noStroke();
  rect(51, 60, 12, 120);
  ellipse(57, 180, 50, 20);

  popMatrix();
}

void mousePressed() {
  redraw();
}


