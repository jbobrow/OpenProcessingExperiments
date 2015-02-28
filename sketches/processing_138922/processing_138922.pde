
float a = 100;
float b = 200;
float c = 300;
float d = 50;
PFont hip;

void setup () {
  size (600, 600);
  frameRate (5);
}

void draw () {
  for (int i=10; i<width; i+=10) {
    if (i%20 == 0) {
      noStroke();
      fill (255, 0, 200);
      rectMode(CENTER);
      rect(width/2, height/2, c, c);
    } 
    else {
      noStroke();
      fill (random(255), random(255), random(255));
      rect (random(width), random(height), d, d);
    }
  } 
  hip = loadFont("KinoMT-48.vlw");
  textFont (hip, 45);
  fill(255);
  textAlign(CENTER);
  text("it's hip to be a", width/2, b);
  textFont (hip, 60);
  fill(255);
  textAlign(CENTER);
  text("SQUARE", width/2, height-160);
  
  fill(0);
  rectMode(CENTER);
  rect (width/2.5, height/2.5, d, d); 
    rect (width/1.65, height/2.5, d, d); 
}
