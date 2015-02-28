
void setup() {
  size(600, 480);// 600 by 240 px window
}

void draw() {

  background(252,252,127);// make the backround yellow
  int q = millis(); // 1000 millis in a second
  int s = second();  // 60 seconds in a min
  int m = minute();  // 60 minutes in an hour
  int h = hour();    // 24 hours in a day
  noStroke();// no outline


  fill(173,173,173);
  text(":15",160,275);
  text(":30",310,275);
  text(":45",460,275);

  fill(255,0,17,s*4.25); // seconds
  rect(0, 20*h+10,10*s, 10); // starting x, starting y, x wide, y tall

  fill(3,47,103); // min
  rect(0, h*20, 10*m, 10); // starting x, starting y, x wide, y tall

  fill(3,47,103, 4.2*s); // min
  rect(0, h*20, 10*(m+1), 10); // starting x, starting y, x wide, y tall

  fill(3,47,103,50+(.5*m)); // hours
  rect(0, 0, 600, (20*(h+1))); // starting x, starting y, x wide, y tall

  stroke(142,133,134,150);
  for(int counter=0; counter<25; counter++) {
    line(0, counter*20, 20, counter*20);
    println(counter);
  }

  line(0,240,600,240); // one centerline directly across
  line(300,10,300,470); // 30 min mark
  line(150,40,150,450); // 15 min mark
  line(450,40,450,450); // 45 min mark
}


