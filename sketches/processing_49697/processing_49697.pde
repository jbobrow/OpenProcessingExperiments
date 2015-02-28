
int a = 20;

void setup () {
  size (500,400);
  smooth ();
}
void draw () {
  background (200,10+a,90);
  print(a);
  if (a<0) {
    a=255;
  }
  else if (a>255) {
    a=1;
}
  line (a,20,a,200);
}
void mousePressed () {
  a+=15;
}
void keyPressed () {
  a-=15;
}


