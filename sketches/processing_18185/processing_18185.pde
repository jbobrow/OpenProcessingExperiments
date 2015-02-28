

void setup() {
  size(320,320); 
  frameRate(30);
}

void draw() {

  smooth();

  background(255);
  PFont myFont;
  myFont = loadFont("helvetica.vlw");
  textFont(myFont);
  fill(0, 26, 51);
  text(second(), 35, 290);

  //load time
  int mySecond = second();  // Values from 0 - 59
  int myMinute = minute();  // Values from 0 - 59
  int myHour = hour();    // Values from 0 - 23

  //minute line
  float mapSec = map(myMinute, 0, 59, 0, width);
  stroke(0, 26, 51);
  strokeWeight(5.3);
  line(mapSec, 200, mapSec, 240);

  //AM and PM 
  if (myHour < 11) {
    fill(255, 0, 0);
  }
  else {
    fill(255);
  }

  text("AM", 180, 290);


  if (myHour > 11) {
    fill(255, 0, 0);
  }
  else {
    fill(255);
  }

  text("PM", 240, 290);



  //hour ellipses
  noStroke();

  if (myHour <= 0) {
    fill(255, 0, 0);
  }
  else if (myHour >= 12) {
    fill(255, 0, 0);
  }
  else {
    fill(0, 26, 51);
  }

  ellipse(25, 50, 30, 30);

  if (myHour <= 1) {
    fill(255, 0, 0);
  }
  else if (myHour >= 13) {
    fill(255, 0, 0);
  }
  else {
    fill(0, 26, 51);
  }
  ellipse(115, 50, 30, 30);

  if (myHour <= 2) {
    fill(255, 0, 0);
  }
  else if (myHour >= 14) {
    fill(255, 0, 0);
  }
  else {
    fill(0, 26, 51);
  }

  ellipse(205, 50, 30, 30);

  if (myHour <= 3) {
    fill(255, 0, 0);
  }
  else if (myHour >= 15) {
    fill(255, 0, 0);
  }
  else {
    fill(0, 26, 51);
  }

  ellipse(295, 50, 30, 30);

  if (myHour <= 4) {
    fill(255, 0, 0);
  }
  else if (myHour >= 16) {
    fill(255, 0, 0);
  }
  else {
    fill(0, 26, 51);
  }

  ellipse(25, 100, 30, 30);

  if (myHour <= 5) {
    fill(255, 0, 0);
  }
  else if (myHour >= 17) {
    fill(255, 0, 0);
  }
  else {
    fill(0, 26, 51);
  }

  ellipse(115, 100, 30, 30);

  if (myHour <= 6) {
    fill(255, 0, 0);
  }
  else if (myHour >= 18) {
    fill(255, 0, 0);
  }
  else {
    fill(0, 26, 51);
  }

  ellipse(205, 100, 30, 30);

  if (myHour <= 7) {
    fill(255, 0, 0);
  }
  else if (myHour >= 19) {
    fill(255, 0, 0);
  }
  else {
    fill(0, 26, 51);
  }

  ellipse(295, 100, 30, 30);

  if (myHour <= 8) {
    fill(255, 0, 0);
  }
  else if (myHour >= 20) {
    fill(255, 0, 0);
  }
  else {
    fill(0, 26, 51);
  }

  ellipse(25, 150, 30, 30);

  if (myHour <= 9) {
    fill(255, 0, 0);
  }
  else if (myHour >= 21) {
    fill(255, 0, 0);
  }
  else {
    fill(0, 26, 51);
  }

  ellipse(115, 150, 30, 30);

  if (myHour <= 10) {
    fill(255, 0, 0);
  }
  else if (myHour >= 22) {
    fill(255, 0, 0);
  }
  else {
    fill(0, 26, 51);
  }

  ellipse(205, 150, 30, 30);

  if (myHour <= 11) {
    fill(255, 0, 0);
  }
  else if (myHour >= 23) {
    fill(255, 0, 0);
  }
  else {
    fill(0, 26, 51);
  }

  ellipse(295, 150, 30, 30);
}


