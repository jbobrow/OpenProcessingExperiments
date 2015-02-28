
void setup(){
  size (200,200);
}
void draw () {
  int x=0;
while(x<=200) {
  smooth ();
  stroke (100,50,200);
   ellipse (x,(x*x/200), 10, 10);
   x=x+15;
}
}
