
int circY=30;
int counter;
PImage space;


void setup() {
  smooth();
  size(400, 400);
  noStroke();
  background(255, 0);
  frameRate(random(10, 15));
}

void draw() {
  background(81,20,51);
  noStroke();
  fill(255,30);
  rect(0,0,random(10,400), random(10,400));
  
//  PImage space=loadImage("background.jpg");
//  image(space, width, height);
  drawChain(30+counter, 30, 30, 10);
  drawChain (30, circY+30, 30, 10);
  drawChain (30+(counter), circY+60, 30, 10);
  drawChain (30, circY+90, 30, 10);
  drawChain (30+counter, circY+120, 30, 10);
  drawChain (30, circY+150, 30, 10);
  drawChain (30+counter, circY+180, 30, 10);
  drawChain (30, circY+210, 30, 10);
  drawChain (30+counter, circY+240, 30, 10);
  drawChain (30, circY+270, 30, 10);
  drawChain (30+counter, circY+300, 30, 10);
  drawChain (30, circY+330, 30, 10);

  counter=counter+40;
  println(counter);

  if (counter>width-15) {
    counter=counter+(-counter);
  }
}

void drawChain( int circX, int circY, int dX, int dY) {
  for (int i=0; i<100; i++) {
    stroke(0,60);
    strokeWeight(2);
    fill(random(0, 255), 60);
    ellipse(circX*i, circY, dX, dY);
  }
}


