
float y=0.0;

void setup() {

  size(500, 500);
  noStroke();
  //grid of squares, i want it to last on the screen without the y affected by the float y.
  for (int x=25; x<=500; x+=50) {
    for (int y=25; y<=500; y+=50) {
      rect(x, y, random(width/20), random(height/20));
    }
  }
}




void draw() {
  //gradient background
  colorMode(HSB);
  rectMode(CENTER);
  for (int i =0; i<500;i++) {
    stroke(222, i*.5, 255);
    line(i, 0, i, 500);
  }


  //background(204); //background on fixes current problem. 
  PFont geo = loadFont("AGaramond-Bold-48.vlw");
  textFont(geo);
  textSize(35);
  strokeWeight(2);
  //point(200, 200); //point on or off does not affect code
  text("processing is sexy", 160, y);
  y+=1.5;
  if (y>150) {
    y=-50;
  }
}
