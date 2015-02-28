
int angulo;

void setup() {
size (500,500);
smooth();
background(0);
stroke(255);
noFill();
angulo=0;
frameRate(40);
}

void draw() {
  fill(0,12);
  stroke(255);
  rect (0,0,width,height);
  angulo+=5;
  rotate (radians(angulo));
  rect (250,250,20,20);
  stroke(100);
  line (0,0,250,250); 
}

