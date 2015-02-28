
void setup() {
  size(900,450);
  background(255);
  smooth();
  strokeWeight(1);
}

int i = 0;
void draw() {
  translate(width/2, height/2+100);
  line(width*sin(i), height*cos(i), width*tan(i), 0);
  i++;
}

