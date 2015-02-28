
void setup() {

  size (500, 500);
  background (255);
  smooth();
}

void draw () {
  background(255);  
  fill(255);
  float sec  = map(second(), 0, 60, 0, 360);
  float min  = map(minute(), 0, 60, 0, 360);
  float h = map(hour(), 0, 12, 0, 360);
  //Rahmen
  translate(width/2, height/2);
  pushMatrix();
  strokeWeight(2);
  ellipse(0, 0, 420, 420);
  strokeWeight(1);
  ellipse (0, 0, 400, 400);
  popMatrix();

  rotate(radians(270));

  //Skala Stunden
  for (int i=0; i<=360; i+=30) {

    pushMatrix();
    strokeWeight(1);
    if ((i == 0) || (i==90) || (i==180) || (i==270)) {  
      strokeWeight(2);
      //stroke(183,61,61);
    }
    rotate (radians(i));
    translate(0, 200);
    // ellipse (0,0,10,10);
    line(0, 0, 0, -35);
    popMatrix();
  }
  strokeWeight(1);
  //Skala Minuten/Sekunden
  for (int i=0; i<=360; i+=6) {

    pushMatrix();
    rotate (radians(i));
    translate(0, 200);
    // ellipse (0,0,10,10);
    line(0, 0, 0, -10);
    popMatrix();
  }
fill(0);
  ellipse(0, 0, 10, 10);
  

  //sec
  pushMatrix();
  rotate(radians(sec));
  stroke(183, 61, 61);
  line(0, 0, 170, 0);
  popMatrix();
  stroke(0);



  //hours
  pushMatrix();
  rotate(radians(h));
  line(0, 0, 70, 0);
  popMatrix();



  //min
  pushMatrix();
  rotate(radians(min));
  line(0, 0, 100, 0);
  popMatrix();
}



