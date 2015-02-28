
// Oliver Haimson
// Assignment 06A
// Copyright 2012

int dayInt, d, m, yr, hr, mn, sec;
// color array to store possible stamp colors
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
  col[1] = color(141,58,57);
  col[2] = color(40, 40, 40);
}

void draw() {
  rubberStamp(200, 150, 55, 20, col[0]);
  rubberStamp(125, 350, 40, 0, col[1]);
  rubberStamp(300, 470, 31, -5, col[2]);
  noLoop();
}

void rubberStamp(float x, float y, float sz, float tilt, color c) {
  hr = hour();
  // determine if it's AM or PM
  if (hr < 12 || hr==24){
    M = "AM";
  }
  else {
    M = "PM";
  }
  if (hr == 24 || hr == 12){
    hr = 12;
  }
  else {
      hr = int(hr)%12;
  }
  mn = minute();
  sec = second();
  fill(c);
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
  text(nf(hr,2)+":"+nf(int(mn),2)+":"+nf(int(sec),2)+" "+M,0,0+sz*1.14);
  // draw the noise on top of the stamp to make it look old
  strokeWeight(2);
  strokeCap(ROUND);
    stroke(252, 244, 172,85);
  for (float i=-sz*3; i<sz*3; i=i+random(1,7)) {
    for (float j=-sz*1.5; j<sz*1.7; j=j+random(1,7)) {
      if (i!=width*.15) {
        point(i, j);}}}
  popMatrix();
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


