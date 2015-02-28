
//recreation of Processing Logo icon
//by Gaelan Baird
//found code on pg.30-35 of processing textbook

  size(100, 100);
  smooth();
  background(255, 255, 255);
  noStroke();
  fill(237, 235, 235);
  ellipse(50, 50, 125, 125);
  fill(255);
  ellipse(75, 80, 12, 12);
  ellipse(60, 80, 12, 12);
  fill(237, 235, 235);
  rectMode(CENTER);
  rect(75, 80, 4, 4);
  fill(237, 235, 235);
  triangle(63, 80, 57, 77, 57, 83);
  //letters found on pg,112-113 of textbook
  PFont font;
  font = loadFont("OCRAStd-48.vlw");
  textFont(font);
  fill(255);
  textSize(90);
  text("P", 25, 85);

