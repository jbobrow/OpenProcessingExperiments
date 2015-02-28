
void setup(){
  size (200,200);
}
void draw () {
  int x=0;
while(x<=200) {
  smooth ();
  stroke (204,100,100);
   ellipse (x,(x*x/200), 3, 3);
   x=x+15;
}
}
