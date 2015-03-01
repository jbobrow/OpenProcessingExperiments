
//for (int i = 0; i < 80; i = i+5) {
 // line(30, i, 80, i);
//}

void setup() {
  size(500,500);
  background(255);
}

void draw() {
  for (int i=0; i<400; i= i+10) {
    for (int j=0; j<300; j= j+8) {
      stroke(220,14,0);
      strokeWeight(8);
      point(i,j);
    }
  }
  for (int p=0; p<505; p=p+10) {
    for (int x=305; x<500; x=x+10) {
      stroke(14,220,0);
      strokeWeight(8);
      point(p,x);
    }
  }
  for (int o=400; o<505; o=o+10) {
    for (int w=0; w<303; w=w+8) {
      stroke(0,14,220);
      strokeWeight(8);
      point(o,w);
    }
  }
}


