
/**
 Yingying Yang
 Creative Computing Section B
 Wk 6 Assignment 1 - Array
 */

int numStroke = 100;
float x[] = new float[numStroke];
float y[] = new float[numStroke];
color col[] = new color[numStroke];

void setup() {
  size(500, 500);
  colorMode(HSB);
  for (int i = 0; i < numStroke; i++) { 
    x[i] = random(width); 
    y[i] = 0;
    col[i] = color(random(255), random(100, 200), 255);
  }
  frameRate(8);
}

void draw() {
  background(127);
  for (int i = 0; i < numStroke; i++) {
    y[i] += random(-height,height); // changes line height
    stroke(col[i]);
    strokeWeight(random(2, 4));
    line(x[i], y[i], x[i], y[i]+random(100)); // drip line
    noStroke();
    fill(col[i]);
    ellipse(x[i], y[i]+random(100), random(10, 20), random(20, 40)); //droplet
    ellipse(x[i], height, random(30,40), random(10,20)); //puddle
  }
}



