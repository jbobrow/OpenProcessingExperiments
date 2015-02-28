
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
  fill(0,20);
  stroke(255);
  rect (0,0,width,height);
  angulo+=10;
  translate (250,250);
  rotate (radians(angulo));
  rect (150,150,20,20);
  stroke(100);
  line (0,0,150,150); 
}
