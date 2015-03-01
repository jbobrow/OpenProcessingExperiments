
float mx, my;

void setup() {
  size(600, 600); 
 fill(46,30,2, 30);
}

void draw() {
  rect(0, 0, width, height);
  translate(width/2, height);
  rotate(radians(180));
  scale(0.7,0.7);
  stem(11, 150, 40, 6, 100);
}

void stem(int num, int length, float radius, float weight, float z) {
  strokeWeight(weight);
  stroke(161-radius/2,196,125,z);
  for (int i = 0; i<60; i++) {
    mx=map(mouseX,0,600,31.5,32);
    my=map(mouseY,0,600,-51.3,-50);
    line(radius*cos(radians(i*my)), radius*sin(radians(i*my)), 
    1.25*radius*cos(radians(i*mx)), 1.02*radius*sin(radians(i*mx))+length);
  }
  if (num>1) {
    translate(0, length);
    num=num-1;
    stem(num, 2*length/3, radius*1.25, weight*0.8, z*0.8);
  }
}

