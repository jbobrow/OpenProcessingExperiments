
int t=0;
int p=0;
int g=0;
void setup() {
  size(40, 800);
  t=1;
  p=1;
  g=0;
}

void draw() {
  textSize(9);

  for (int i=0; i<=100 && g<=0; i++) {
    if (i!=5*t && i!= 7*p) {
      fill(100);
      text(i, 0, 8*i);
    }
    if (i==5*t && i!= 7*p) {
      fill(0);
      t++;
      text("fizz", 0, 8*i);
    }
    if (i==7*p && i!= 5*t) {
      fill(0);
      p++;
      text("buzz", 0, 8*i);
    }
    if (i==5*t && i==7*p) {
      fill(0);
      t++;
      p++;
      text("fizz buzz", 0, 8*i);
    }
  }
  g=1;
}


