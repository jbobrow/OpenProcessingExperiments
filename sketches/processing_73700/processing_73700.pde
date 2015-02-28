
// Oliver Haimson
// Assignment 06C
// Copyright 2012

int dayInt, d, m, yr, hr, mn, sec, stampCol, stampSize, stampTilt;
// color array to store stamp pad color values
color [] col = new color [3];
String dayString, monthString, M;
PFont font;

void setup() {
  size(400, 550);
  smooth();
  background(252, 244, 172);
  strokeWeight(1);
  stroke(153, 224, 254);
  for (float n=height*.13; n<height; n+=13) {
    line(0, n, width, n);
  }
  stroke(246, 133, 107);
  line(width*.15, 0, width*.15, height);
  font = loadFont("MyriadPro-Bold-48.vlw");
  textFont(font);
  dayString = findDay();
  m = month();
  monthString = findMonth(m);
  d = day();
  yr = year();
  col[0] = color(62, 77, 141);
  col[1] = color(141, 58, 57);
  col[2] = color(40, 40, 40);
  stampCol=col[2];
  stampSize=33;
  stampTilt=0;
  drawStampPads();
}

void draw() {
// nothing needed in the draw function  
}

void keyPressed() {
  // press the arrow keys to rotate or resize the stamp
  if (keyCode == LEFT) {
    stampTilt-=1;
  }
  else if (keyCode == RIGHT) {
    stampTilt+=1;
  }
  else if (keyCode == UP) {
    stampSize+=1;
  }
  else if (keyCode == DOWN) {
    stampSize-=1;
  }
  // press space bar to reset
  else if (key == ' ') {
    background(252, 244, 172);
    strokeWeight(1);
    stroke(153, 224, 254);
    for (float n=height*.13; n<height; n+=13) {
      line(0, n, width, n);
    }
    stroke(246, 133, 107);
    line(width*.15, 0, width*.15, height);
    stampCol=col[2];
    stampSize=33;
    stampTilt=0;
    drawStampPads();
  }
}

void mouseClicked() {
  // pick up color from stamp pads
  if (mouseX>width*.8 && mouseX<width*.94 && mouseY>height*.04 && mouseY<height*.1) {
    stampCol=col[0];
  }
  else if (mouseX>width*.8 && mouseX<width*.94 && mouseY>height*.12 && mouseY<height*.18) {
    stampCol=col[1];
  }
  else if (mouseX>width*.8 && mouseX<width*.94 && mouseY>height*.2 && mouseY<height*.26) {
    stampCol=col[2];
  }
  else {
    rubberStamp(mouseX, mouseY);
  }
}

void drawStampPads() {
  strokeWeight(2);
  strokeJoin(ROUND);
  stroke(30);
  fill(62, 77, 141);
  rect(width*.8, height*.04, width*.14, height*.06);
  fill(141, 58, 57);
  rect(width*.8, height*.12, width*.14, height*.06);
  fill(40, 40, 40);
  rect(width*.8, height*.2, width*.14, height*.06);
}

void rubberStamp(float x, float y) {
  fill(stampCol);
  float sz=stampSize;
  float tilt=stampTilt;
  hr = hour();
  // determine if it's AM or PM
  if (hr < 12 || hr==24) {
    M = "AM";
  }
  else {
    M = "PM";
  }
  if (hr == 24 || hr == 12) {
    hr = 12;
  }
  else {
    hr = int(hr)%12;
  }
  mn = minute();
  sec = second();
  textAlign(CENTER);
  textSize(sz);
  pushMatrix();
  translate(x, y);
  rotate(radians(tilt));
  // draw the stamp
  text(dayString, 0, 0-sz*.83);
  text(monthString+" "+d, 0, 0);
  text(yr, 0, 0+sz*.74);
  textSize(sz/2);
  text(nf(hr, 2)+":"+nf(int(mn), 2)+":"+nf(int(sec), 2)+" "+M, 0, 0+sz*1.14);
  // draw the noise on top of the stamp to make it look old
  strokeWeight(2);
  strokeCap(ROUND);
  stroke(252, 244, 172, 85);
  for (float i=-sz*3; i<sz*3; i=i+random(1,7)) {
    for (float j=-sz*1.5; j<sz*1.7; j=j+random(1,7)) {
      if (i!=width*.15) {
        point(i, j);
      }
    }
  }
  popMatrix();
  drawStampPads();
}

String findDay() {
  // citation: the following three lines of code are by Jonny Stutters, found at
  // http://forum.processing.org/topic/day-of-the-week
  Calendar c;
  c = Calendar.getInstance();
  dayInt = c.get(Calendar.DAY_OF_WEEK);
  if (dayInt==1) {
    dayString = "SUNDAY";
  }
  else if (dayInt==2) {
    dayString = "MONDAY";
  }
  else if (dayInt==3) {
    dayString = "TUESDAY";
  }
  else if (dayInt==4) {
    dayString = "WEDNESDAY";
  }
  else if (dayInt==5) {
    dayString = "THURSDAY";
  }
  else if (dayInt==6) {
    dayString = "FRIDAY";
  }
  else if (dayInt==7) {
    dayString = "SATURDAY";
  }
  return dayString;
}

String findMonth(int mon) {
  if (mon==1) {
    monthString = "JANUARY";
  }
  else if (mon==2) {
    monthString = "FEBRUARY";
  }
  else if (mon==3) {
    monthString = "MARCH";
  }
  else if (mon==4) {
    monthString = "APRIL";
  }
  else if (mon==5) {
    monthString = "MAY";
  }
  else if (mon==6) {
    monthString = "JUNE";
  }
  else if (mon==7) {
    monthString = "JULY";
  }
  else if (mon==8) {
    monthString = "AUGUST";
  }
  else if (mon==9) {
    monthString = "SEPTEMBER";
  }
  else if (mon==10) {
    monthString = "OCTOBER";
  }
  else if (mon==11) {
    monthString = "NOVEMBER";
  }
  else if (mon==12) {
    monthString = "DECEMBER";
  }
  return monthString;
}


