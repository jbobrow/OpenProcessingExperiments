
float o=0.01;
float a=0;
void setup() { 
  size(600, 600);
  translate(30, 20, -50);
  background(0);
}
 
void draw() { 
stroke(255);
fill(255);
strokeWeight(10);
translate(300,300);
  rotate(a);
  ellipse(o,0,a/90,a/90);
  a=a+0.1;
  o=o+.25+o/100000;
}
