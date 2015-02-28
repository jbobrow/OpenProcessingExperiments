
int o=0.01;
int a=0;
void setup() {  
  size(600, 600);
  background(255); 
}

void draw() {  
stroke(0);
fill(0);
strokeWeight(5);
translate(300,300);
  rotate(a);
  ellipse(o,0,a/5,a/5);
  a=a+.02;
  o=o+.04+o/5000;
}
