
void setup() {
  size(500, 500);
  smooth();
  background(255);
}

void draw() {
}

void mousePressed() {

  // scale, image grounding element set up
  background(250, 100, 100);  
  fill(255);
  noStroke();
  ellipse(500, width/2,500, random(height+100));
  //rect(325, 0, width/10, height);

  // y-coordinate setup 
  for (int x=0; x<=600; x++) {

  // field setups
    if (x>0 && x<20) {
      stroke(255);
      line(0, random(0, 100), random(100, 350), x+50);
    }
    else {  
      if (x>100 && x<120) {
        line(0, random(100, 200), random(100, 300), x+50);
      }
    }
    if (x>200 && x<220) {
      line(0, random(200, 300), random(50, 250), x+50);
    }
    else {
      if (x>300 && x<320) {
        line(0, random(300, 400), random(100, 300), x+50);
      }
    }
    if (x>400 && x<420) {
      line(0, random(400, 500), random(150, 350), x+50);
    }
  }
}


