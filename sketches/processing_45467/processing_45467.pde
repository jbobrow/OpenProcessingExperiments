
int hours;
int minutes;
int seconds;



void setup() {
  size(800, 800);
  colorMode(HSB, 100);
  background(#6A6969);
  smooth();
}

void draw() {

  hours = hour();
  minutes = minute();
  seconds = second();

  println(hours + " " + minutes + " " + seconds);

  if (hours > 12) {
    hours -= 12;
  }

  background(#6A6969);
  strokeWeight(20);
  stroke(#AAA7A7);
  ellipse(400,400,600,600);
  
  strokeWeight(20);
  stroke(#9B9999);
  ellipse(400,400,560,560);
  
 

  translate(400, 400);
  rotate(radians(90));
  noFill();

  strokeWeight(12);
  stroke(#FAE605);
  pushMatrix();

  rotate(radians(30 * hours));
  line(0, 0, -50, 0);
  ellipse(-50, 0, 20, 10);
  popMatrix();

  strokeWeight(8);
  stroke(#0527FA);
  pushMatrix();
  rotate(radians(6 * minutes));
  line(0, 0, -150, 0);
  ellipse(-149, 0, 20, 10);
  popMatrix();
  
  strokeWeight(4);
  stroke(#EA050C);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(0,0, -250,0);
  ellipse(-245,0,20,5);
  popMatrix();
}





