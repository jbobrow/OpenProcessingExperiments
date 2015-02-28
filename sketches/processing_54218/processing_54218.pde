
float deg = 0;
float degDelta = 0;
float degDeltaMax = 10;

void setup() {
  size(640, 480);
}

void draw() {

  background (86, 178, 149);

  if (key==' ') {
    pushMatrix();
    translate(320, 240);
    rotate(radians(deg));
    fill(232, 220, 194);
    rectMode(CENTER);
    rect(0, 0, 125, 125);
    stroke(255);
    popMatrix(); 


    if (degDelta<degDeltaMax) {
      degDelta += 0.1;
    }
    else if (degDelta>degDeltaMax) {
      degDelta=degDeltaMax;
    }
  } 
  else {
    if (degDelta>0) {
      degDelta -= 0.1;
    }
    else if (degDelta<0) {
      degDelta=0;
    }
  }
  {
    {
    pushMatrix();
    translate(320, 240);
    rotate(radians(deg));
    line(0, 0, 400, 100);
    fill(41, 45, 59);
    strokeWeight(5);
    stroke(255);
    popMatrix();
    }
    if (mousePressed) {
      if (degDelta<degDeltaMax) {
        degDelta += 0.1;
      }
      else if (degDelta>degDeltaMax) {
        degDelta=degDeltaMax;
      } 
    } 
    else {
      if (degDelta>0) {
        degDelta -= 0.1;
      }
      else if (degDelta<0) {
        degDelta=0;
      }
    }
  }
  noStroke();
  fill(130, 121, 112);
  ellipseMode(CENTER);
  ellipse(width/2, height/2, 10, 10);

  deg += degDelta;
  println(degDelta);
}


