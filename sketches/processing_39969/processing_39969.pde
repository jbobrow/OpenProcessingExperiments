
int angulo;

void setup() {
size (500,500);
smooth();
background(0);
stroke(255);
noFill();
angulo=0;
frameRate(60);
}

void draw() {
 
  fill(0,12);
  stroke(255);
  rect (0,0,width,height);
  angulo+=10;
  translate (250,250);
  rotate (radians(angulo));
  scale(0.5);
  stroke(247,226,32);
  rect (0,0,50,50);
  stroke(0,150,0);
  line (50,50,135,135); 
  stroke(200,0,0);
  ellipse(150,150,30,30);
}
