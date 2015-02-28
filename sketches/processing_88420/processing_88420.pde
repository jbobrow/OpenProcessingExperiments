
PGraphics buffer;
PImage img;
float  x = 50;
float y = 50;

void setup() {
  size(800, 800);
  rectMode(CENTER);
  background(255);
  smooth();
  buffer = createGraphics(500, 500, JAVA2D);
  //img = loadImage("1.png");
  updateBuffer();
}

void updateBuffer() {
  renderComplexImage(buffer);
  img = buffer.get(0, 0, buffer.width, buffer.height);
}

void renderComplexImage(PGraphics buffer) {
  buffer.beginDraw();
  buffer.background(255);
  buffer.smooth();
  buffer.noFill();
  int seconds = millis()/300;
  x = random(100, 500);
  y = random(100, 500);
  buffer.rotate(seconds+radians(30));
  buffer.fill(random(10, 255), random(0, 50));
  buffer.strokeWeight(random(0, 1));
  buffer.rect(x, y, random(50), random(50));
  buffer.endDraw();
}

void draw() {
  int seconds = millis()/300;
  x = random(100, 500);
  y = random(100, 500);
  rotate(seconds+radians(30));
  fill(random(10, 255), random(0, 50));
  strokeWeight(random(0, 1));
  rect(x, y, random(50), random(50));
  println(frameCount);
  
  if (frameCount%500==0) {
    //background(255);
    pushMatrix();
    translate(random(100,500),500);
    rotate(seconds+radians(random(30,60)));
    scale(0.5);
    image(img, 0, 0);
    popMatrix();
  }
  
  if (frameCount==10000){
    background(255);
    frameCount=0;
  }
}



