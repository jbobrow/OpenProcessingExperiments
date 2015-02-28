
void setup(){
  size (200,200);
}
void draw () {
  int x=3;
while(x<=190) {
  smooth ();
  fill (0,80,100);
  noStroke ();
   ellipse ((x*x/200),x/200+5, 5, 5);
   x=x+15;
}
}
