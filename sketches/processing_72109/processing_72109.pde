
int hours;
int minutes;
int seconds;

void setup() {
  size(1000, 1000);
  colorMode(HSB, 100);
  background(0, 0, 0);
  strokeCap(ROUND);
  smooth();
}

void draw() {

  // get system variables
  hours = hour();
  minutes = minute();
  seconds = second();

  println(hours + " " + minutes + " " + seconds);

  // fix for 24 hour clock
  if (hours > 12) {
    hours -= 12;
  }

  //clear
  fill(0, 0, 0, 1);
  rect(-10, -10, 1200, 1200); 

  // center sketch
  translate(500, 500);
  rotate(radians(90));
  noFill();

  /////////// GUIDES

  strokeWeight(.6);


  //guides - seconds - hashmarks
  for (int secondsGuides = 0; secondsGuides < 60; secondsGuides++) {
    stroke(60, 100, 30);
    pushMatrix();
    rotate(radians(6*secondsGuides));
    line(-100, 0, -120, 0);
    popMatrix();
  }

  stroke(60, 100, 100);

  strokeWeight(.6);

  //guides - seconds - ellipse
  //ellipseMode(CENTER);
  //ellipse(0,0,243,243);


  // guides - minutes - ellipse
  ellipseMode(CENTER);
  ellipse(0, 0, 153, 153);

  // guides - hours - ellipse
  ellipseMode(CENTER);
  ellipse(0, 0, 88, 88);

  ////////////////GUIDES

  // hour hand
  strokeWeight(4);
  stroke(60, 50, 100);
  pushMatrix();
  rotate(radians(30 * hours));  // 30 * 12 = 360 degrees
  line(-40, 0, -50, 0);
  popMatrix();

  // minute hand
  strokeWeight(2);
  stroke(60, 80, 100);
  pushMatrix();
  rotate(radians(6 * minutes));
  line(-60, 0, -90, 0);
  popMatrix();

  // second hand
  strokeWeight(.6);
  stroke(60, 100, 100);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(-100, 0, -120, 0);
  popMatrix();
  
  ///////LINES
  
         // second hand
  strokeWeight(4);
  strokeCap(SQUARE);
  stroke(60, 100, 100);
  pushMatrix();
  line(-1, -200, -3 * seconds, -200);
  popMatrix(); 
  
         // minute hand - GUIDE
  strokeWeight(1);
  strokeCap(SQUARE);
  stroke(60, 100, 100);
  pushMatrix();
  line(-1, -250, -174, -250);
  popMatrix();   
     
     // minute hand
  strokeWeight(4);
  strokeCap(SQUARE);
  stroke(60, 80, 100);
  pushMatrix();
  line(-1, -250, -3 * minutes, -250);
  popMatrix();
     
      // hours hand - GUIDE
  strokeWeight(1);
  strokeCap(SQUARE);
  stroke(60, 100, 100);
  pushMatrix();
  line(-1, -300, -174, -300);
  popMatrix();   
     
     // hours hand
  strokeWeight(4);
  strokeCap(SQUARE);
  stroke(60, 50, 100);
  pushMatrix();
  line(-1, -300, -3 * hours, -300);
  popMatrix();
  

  
  
}
