
float angleS;
float angleM;
float angleH;

int lineLength =0;
PFont edmondsans;
float hueS;
float hueM;
float hueH;



void setup() {
  size (500, 500);
  colorMode(HSB, 255);
  background (10);
  noStroke();
  edmondsans = loadFont ("Edmondsans-Bold-20.vlw");
  angleS = 0;
  angleM=0;
  angleH=0;
}

void draw() {
  background(0);
  noStroke(); 
  fill (hueM, 150, 255);
    fill (hueH, 150, 255);
  ellipse (width/2, height/2, 200, 200);
  ellipse (width/2, height/2, 150, 150);
  fill (hueS, 150, 255);
  ellipse (width/2, height/2, 50, 50);
  fill (hueS, 255, 255);
  text (hour() + ":" + minute() +":"+ second(), 30, 50);

  pushMatrix();
  translate (width/2, height/2);

  rotate (radians(270+angleH));
  stroke (hueH, 205, 255);
  strokeWeight(7);
  line (0, lineLength, 0, lineLength+55);

  rotate (radians(270+angleM));
  stroke (hueM, 205, 255);
  strokeWeight (5);
  line (0, lineLength, 0, lineLength+70);

  rotate (radians(angleS));
  stroke (hueS, 205, 255);
  strokeWeight(2);
  line (0, lineLength, 0, lineLength+90);



  popMatrix();

  angleS = map(second(), 0, 59, 0, 360);
  hueS = map(second(), 0, 59, 0, 255);
  angleM = map(minute(), 0, 59, 0, 360);
  hueM = map(minute(), 0, 59, 0, 255);
  angleH = map (hour(), 0,23,0,360);
  hueH = map (hour(), 0,23,0,255);

  //hour = map(hour(), 0, 23, 0, width);
  //min = map(minute(), 0, 59, 0, width);
  //  sec = map(second(), 0, 59, 0, width);
  //hue = map(second(),0,59,0,0);
}



