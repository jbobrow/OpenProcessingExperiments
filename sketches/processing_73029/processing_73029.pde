
int hours;
int minutes;
int seconds;
int ypos = 0;


void setup() {
  size(600, 600);
  colorMode(HSB, 100);
  background(69, 0, 49);
  stroke(2, 0, 54);
  strokeWeight(1);
  line(0, 50, 600, 50);
  line(0, 100, 600, 100);
  line(0, 150, 600, 150);
  line(0, 200, 600, 200);
  line(0, 250, 600, 250);
  line(0, 300, 600, 300);
  line(0, 350, 600, 350);
  line(0, 400, 600, 400);
  line(0, 450, 600, 450);
  line(0, 500, 600, 500);
  line(0, 550, 600, 550);
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
   // background(69, 0, 49);
  }



  // center sketch
  translate(10, 10);


  // second hand
  noStroke();
  fill(2, 0, 20, 5);
  pushMatrix();
  ypos = 8 * seconds;
  rect(75, ypos, 200, 3);
  popMatrix();


  // minute hand
  noStroke();
  fill(2, 0, 99);
  pushMatrix();
  ypos = 6 * minutes;
  rect(175, ypos, 250, 25);
  popMatrix();


  // hour hand
  noStroke();
  fill(2, 96, 54);
  pushMatrix();
  ypos = 30 * hours;  // 30 * 12 = 360 degrees
  rect(275, ypos, 300, 50);
  popMatrix();
}
