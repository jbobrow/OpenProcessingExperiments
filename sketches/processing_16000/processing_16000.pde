
void setup() {
  size(600,600);
}

void draw() {
  mywatch(0,0, 1, 255);
  mywatch(300,50, 0.5, 155);
  mywatch(50,250, 1.3, 105);
  mywatch(250,200, 0.3, 70);
  mywatch(350,170, 0.8, 200);
}


void mywatch(int x, int y, float s, int f) {
  pushMatrix();
  translate(x,y);
  scale(s);
  ellipse(150,150,200,200);
  fill(f);
  ellipse(150,150,180,180);
  line(150,80,150,200);
  fill(92,58,148);
  ellipse(150,150,20,20);
  popMatrix();
}



