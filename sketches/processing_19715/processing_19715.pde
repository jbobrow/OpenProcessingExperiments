
PFont font;
float y = 0;
float angle = 0.0;

void setup(){
  size(250, 250);
  background(0);
  smooth();
  font = loadFont("HelveticaNeue-UltraLight-48.vlw");
  textFont(font);
}

void draw(){
  frameRate(120);
  angle = angle + 60;
  translate(125, 125);
  rotate(angle);
  fill(0, 12);
  rect(0, 0, width, height);
  fill(255);
  textSize(6);
  y += 20;
  text("H9X 2E6", y, random(250));
  if (y > 250){
    y = -1.0;
  }
}


