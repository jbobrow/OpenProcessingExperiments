
int numCurves;
float a, b;
float sHeight, sWidth, x1, y1, x2, y2;

float step;
float time;



void setup() {
  size(800, 480);
  frameRate(25);
  smooth();
  noStroke();
  //  strokeWeight(0.75);
  rectMode(CENTER);
  colorMode(HSB, 360, 100, 100, 100);
  background(240, 100, 100);




  sHeight = height/2;
  sWidth = width/2;

  a = 1;
  b = 3;

  numCurves = 340;

  time = 1;
  step = 2;
}


void draw() {

  fill(240,0,95);  
  rect(sWidth,sHeight,width,height);
  noFill();
  
  
  translate(sWidth, sHeight);


  
  a = map(mouseX,0,width,0,20);
  b = map(mouseY,0,height,0,20);

  for (int i=0; i <= numCurves; i++) {
    x1 = sin(a*i*radians(time)) * (sWidth -60);
    y1 = sin(b*i*radians(time)) * (sHeight -40);


    fill(240, 100, 100, 40);
    rect(x1, y1, random(10, 30), random(10, 30));
  }
}



