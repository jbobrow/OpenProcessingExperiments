
// code by
// JiHoon Han
// Student ID: 20121181
// Sogang University
// Digital Media Art Workshop
//
// 2013 March 20


// change1 has the value from a to b
// this is for the repositioning of the ocean waves
int a=-150;
int b=200;
int change1 = 0;
int growth1 = 1;

// change2 has the value from c to d
// this is for the repositioning of the ocean waves
int c=-150;
int d= 260;
int change2 = 100;
int growth2 = 1;

// change3 has the value from e to f
// this is for the strokeWeight of the ocean waves and sun
float e= 1;
float f= 4;
float change3 = 1;
int growth3 = 1;

// change4 has the value from g to h
// this is for the strokeWeight of the ocean waves and sun
float g= 1.3;
float h= 4;
float change4 = 2.0;
int growth4 = 1;

// floatx has the value from i to j
// this is for the boat's movement
int i=-260;
int j= 260;
int floatx = 0;
int growth5 = 1;

// floaty has the value from k to l
// this is for the boat's movement
int k=-50;
int l= 100;
float floaty = 0;
int growth6 = 1;

void setup() {
  // make the window size to 600x600 pixels
  size(600, 600);
  // make drawings smooth
  smooth();
}

void draw() {
  background(160, 203, 218);

  // this is for making the variables change their values every time
  if (growth1 == 1) {
    if (change1 >= a && change1 < b) {
      ++change1;
    }
    else if (change1 >= b) {
      --change1;
      growth1 = -1;
    }
  }
  else if (growth1 == -1) {
    if (change1 <= b && change1 > a) {
      --change1;
    }
    else if (change1 <= a) {
      ++change1;
      growth1 = 1;
    }
  }

  if (growth2 == 1) {
    if (change2 >= c && change2 < d) {
      ++change2;
    }
    else if (change2 >= d) {
      --change2;
      growth2 = -1;
    }
  }
  else if (growth2 == -1) {
    if (change2 <= d && change2 > c) {
      --change2;
    }
    else if (change2 <= c) {
      ++change2;
      growth2 = 1;
    }
  }

  if (growth3 == 1) {
    if (change3 >= e && change3 < f) {
      change3 = change3 +0.01;
    }
    else if (change3 >= f) {
      change3 = change3 -0.01;
      growth3 = -1;
    }
  }
  else if (growth3 == -1) {
    if (change3 <= f && change3 > e) {
      change3 = change3 -0.01;
    }
    else if (change3 <= e) {
      change3 = change3 +0.01;
      growth3 = 1;
    }
  }

  if (growth4 == 1) {
    if (change4 >= g && change4 < h) {
      change4 = change4 +0.01;
    }
    else if (change4 >= h) {
      change4 = change4 -0.01;
      growth4 = -1;
    }
  }
  else if (growth4 == -1) {
    if (change4 <= h && change4 > g) {
      change4 = change4 -0.01;
    }
    else if (change4 <= g) {
      change4 = change4 +0.01;
      growth4 = 1;
    }
  }

  if (growth5 == 1) {
    if (floatx >= i && floatx < j) {
      ++floatx;
    }
    else if (floatx >= j) {
      --floatx;
      growth5 = -1;
    }
  }
  else if (growth5 == -1) {
    if (floatx <= j && floatx > i) {
      --floatx;
    }
    else if (floatx <= i) {
      ++floatx;
      growth5 = 1;
    }
  }

  if (growth6 == 1) {
    if (floaty >= k && floaty < l) {
      floaty = floaty + 0.5;
    }
    else if (floaty >= l) {
      floaty = floaty - 0.5;
      growth6 = -1;
    }
  }
  else if (growth6 == -1) {
    if (floaty <= l && floaty > k) {
      floaty = floaty - 0.5;
    }
    else if (floaty <= k) {
      floaty = floaty + 0.5;
      growth6 = 1;
    }
  }

  // print variables to see if the variables are working correctly
  println("change1: " + change1 + "  change2: " + change2 + "  change3: " + change3 + "  change4: " + change4);
  println("floatx: " + floatx + "  floaty: " + floaty);



  // draw the tides
  // make the tides' strokeWeight change every time

  noFill();

  stroke(130, 180, 254);
  strokeWeight(change3);
  bezier(0, (height/6)*4, 250, 500 -change1, 350, 300 +change1, width, (height/6)*4);

  stroke(114, 161, 255);
  strokeWeight(change4*1.3);
  bezier(0, (height/6)*4, 150, 300 -change1, 350, 300 +change1, width, (height/6)*4.5);

  stroke(130, 180, 254);
  strokeWeight(change4);
  bezier(0, (height/6)*5, 300, 350 +change2, 400, 600 -change2, width, (height/6)*5);

  stroke(100, 150, 250, 200);
  strokeWeight(change4*1.5);
  bezier(0, (height/6)*5.5, 200, 550 +(change2*0.9), 450, 450 -(change2*0.8), width, (height/6)*5);

  stroke(95, 140, 230, 200);
  strokeWeight(change3 );
  bezier(0, (height/6)*6, 200, 600 -(change1*0.9), 400, 500 +change1, width, (height/6)*6);

  float change5 = change4;
  if (change5 <= 2)
    change5 = 2;
  stroke(130, 180, 254);
  strokeWeight(change5);
  bezier(0, (height/6)*5.7, 100, 480 +(change1*0.7), 400, 550 +(change2*0.8), width, (height/6)*6);


  // translate(move) the boat
  translate(floatx, floaty);

  // draw the boat body
  stroke(0, 0, 0);
  strokeWeight(3.5);
  fill(0, 0, 0);
  arc(width/2, (height/6)*4, 70, 55, 0, PI, CHORD);

  // draw the flag
  line(width/2, (height/6)*4, width/2, (height/6)*4 - 60);
  fill(255, 0, 0);
  triangle(width/2, (height/6)*4 -30, width/2, (height/6)*4 -60, width/2 +20, (height/6)*4 -45);

  translate(-floatx, -floaty);


  // translate(move) the sun
  translate(60 + (change1/4), -60 - (change2/6));  

  // draw the sun
  fill(254, 204, 0);
  stroke(200, 100, 0);
  strokeWeight(1);
  ellipse((width/6)*5, (height/6)*1, 100, 100);

  // draw the sunrays
  stroke(255, 100, 0);

  strokeWeight(change3);
  line(440, 70, 380, 50);
  strokeWeight(change4*0.9);
  line(450, 150, 400, 200);
  strokeWeight(change3*0.9);
  line(430, 120, 370, 150);
  strokeWeight(change4);
  line(430, 90, 360, 90);
  strokeWeight(change3);
  line(480, 170, 465, 230);
  strokeWeight(change3*1.1);
  line(515, 175, 520, 240);
  strokeWeight(change4);
  line(540, 165, 570, 220);

  translate(-60 - (change1/4), 60 + (change2/6));
}
