
PImage img;
PFont font;
float circleX;
float circleY;
float diam=30;
float amp=50;


void setup() {
  size(500, 500);
  noStroke();
  fill(255);
  font = loadFont("Monospaced-48.vlw");
  img=loadImage("nyc.jpg");
}

void draw() {
  background(255);
  textFont(font);
  fill(0);
  textAlign(CENTER, CENTER);
  text("dt", width/2, height/2);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);

  float time = millis()*.07;  
  circleX = amp*cos(time)+width/2;
  circleY = amp*sin(time)+height/2;
  ellipse(circleX, circleY, diam, diam);

  int property=(mouseX+mouseY)%500;
  translate(250, 250);
  image(img, mouseX, mouseY, property, property);
  rotate((mouseX + mouseY) / 50);
  rect(0, 0, 50, 50);
  
  
}



