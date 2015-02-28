

void setup() {
  size(200, 200);
  background(#E6E6FA);
  noLoop();
}

void draw() {
  stroke(20, 20, 0);
   fill(#6495ED, 90);
  for (int i=10;i<210;i+=10) {
       ellipse(i, i*i*30/200/200, 20, 20);
  }
  for (int g=10;g<200;g+=15) {
    fill(#7377C4,80);
    ellipse(g, g*g*45/150/100, 30, 30);
  }
  int h;
  for (h=10;h<210;h+=10) {
    fill(#6A5ACD, 80);
    ellipse(h, h*h*90/200/50, 40, 40);
  }
  int l;
  for (l=10;l<210;l+=5) {
    fill(#7B68EE, 70);
    ellipse(l, l*l*800/250/50, 50, 50);
  }
}


