
//Kairavi Chahal | kchahal
//Homework 10 | December 5, 2013
 
//Copyright Kairavi Chahal | 2013 | Carnegie Mellon University
//All rights reserved.

//Dataset from http://earthquake.usgs.gov/monitoring/anss/.
//Map from http://friday.westnet.com/~crywalt/dymaxion_2003/earthmap10k.reduced.jpg.

String data[];
int[] time;
float[] latitude, longitude, /*depth,*/ mag;
PImage map;
int month, year, x;
//float min_depth, max_depth;
String[] months = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
//color[] colors = {#ffc8c8, #ffb6b6, #ffa3a3, #ff9191, #ff7f7f, #ff6d6d, #ff5b5b, #ff4848, #ff3636, #ff2424}; 

void setup() {
  size(1440, 720);
  frameRate(1);
  map = loadImage("map.png");
  
//  data = loadStrings("fakedata.csv"); //Simulated data to see variation of magnitudes, since actual data is only mag 6 or greater.
  data = loadStrings("quakes.csv");
  
  time = int(split(data[1], ','));
  latitude = float(split(data[2], ','));
  longitude = float(split(data[3], ','));
//  depth = float(split(data[4], ','));
  mag = float(split(data[5], ','));
  
//  min_depth = min(depth); max_depth = max(depth);
}

void draw() {
  background(map);
  drawTimeline();
  
  if (frameCount > max(time)+15) {
    //Quits the animation 15 seconds after it finishes.
    exit();
  }
  
  translate(width/2, height/2);
  for (int i=0; i<time.length; i++) {
//    if (frameCount >= time[i]-2 & frameCount <= time[i]+2) {
    if (time[i] == frameCount) {
      drawQuake(time[i], latitude[i], longitude[i], /*depth[i],*/ mag[i]);
    }
    if (time[i] < frameCount) {
      drawPastQuake(time[i], latitude[i], longitude[i], /*depth[i],*/ mag[i]);
    }
  }
}

void drawPastQuake(int time, float latitude, float longitude, /*float depth,*/ float mag) {
//  int opacity = int(map(depth, min_depth, max_depth, 0, 100));
  float sz = pow(mag, 1.5);
  stroke(0); fill(#00FF00, 20);
  ellipse(longitude*4, latitude*4, sz, sz);
}

void drawQuake(int time, float latitude, float longitude, /*float depth,*/ float mag) {
//  int opacity = int(map(depth, min_depth, max_depth, 0, 100));
  float sz = pow(mag, 1.5);
  stroke(0); fill(#FF5429);
  ellipse(longitude*4, latitude*4, sz, sz);
}

void drawTimeline() {
  stroke(0); strokeWeight(3);
  line(40, height-20, width-40, height-20);
  strokeWeight(1);
  
  month = frameCount % 12;
  year = floor(frameCount/12) + 2;
  
  for (int i=0; i<=max(time); i++) {
    x = int(map(i, 0, max(time), 40, width-40));
    if (i == frameCount) {
      textAlign(CENTER); fill(0); textSize(24);
      if (year < 10) {text(months[month] + " '0" + year, x, height-35);}
      else {text(months[month] + " '" + year, x, height-35);}
      stroke(255, 0, 0); strokeWeight(2);
    } else {
      stroke(0); strokeWeight(1);
    }
    line(x, height-10, x, height-30);
  }
  
  textAlign(CENTER); fill(0); textSize(24);
  text("Earthquakes from Jan 2002 to Dec 2011", width/2, 25);
}

//TO DO: Make timeline interactive.
//COULD DO: Magnitudes represented by colour, rather than size, of circle.


