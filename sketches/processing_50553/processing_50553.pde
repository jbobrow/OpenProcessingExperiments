
float theta;
float inc;

float Redval = 192;
float Grnval = 64;
float Bluval = 0;
color MyColor;



void setup() {
size (1200, 800);
smooth();
theta = 0;
inc = 0.0;
}

void mouseDragged(){
  color c0 = color (199, 172, 115);
  color c1 = color (4,0,0);
  size(1200, 800);
  noStroke();
  int numSteps = 700;
  for (int i=0; i<numSteps; i++){
    float a = i/(numSteps-1.0);
    
    colorMode(RGB);
    fill(lerpColor(c0, c1, a));
    inc = 0.7;
  }
}



void draw(){
background (0, 0, 255);
if (mousePressed == true){
background (200, 0, 200);
}
pushMatrix();
translate(mouseX, mouseY);
rotate(radians(theta));
fill(0, 0, 0);
drawShape();
theta++;
popMatrix();

pushMatrix();
translate(width/2, height/2);
rotate(radians(theta));
translate(0, 140);
fill(255, 0, 0);
drawShape2();
theta++;
popMatrix();
}

void updateBlueValue(){
  if (mouseButton == LEFT){
    Bluval = map(mouseX, 0, 599, 0, 255);
  } else {
    Bluval = 0;
  }
  MyColor = color(255);
}

void drawShape(){
int numSpokes = 300;
for (int i=0; i<numSpokes; i++){
float t0 = map(i, 0, numSpokes-1, 0, TWO_PI);
float t1= t0 + (TWO_PI/(2*numSpokes));
arc(0, 0, 2000, 2000, t0, t1);
}
}

void drawShape2() {
int numSpokes = 100;
for (int i=0; i<numSpokes; i++){
float t0 = map(i, 0, numSpokes-1, 0, TWO_PI);
float t1= t0 + (TWO_PI/(2*numSpokes));
arc(0, 0, 1000, 1000, t0, t1);
}

line(1000, 0, 0, 1000);
color(100, 0, 200);
}

