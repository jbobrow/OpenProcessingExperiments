
int x=-100;
int y=5;
void setup () {
  size (200, 200);
}
 
void draw () {
  background (50);
  for (int y= 75; y< 145; y= y+25) {
    noStroke ();
    fill (#FC0D29, y+100);
    ellipse (y, 80, 60, 60);
 
 
    int spacing=12;
    for (int x=-90; x<180; x=x+spacing) {
      stroke (#17FC0D);
      strokeWeight (8);
      point (x+100, x*x/100+100);
    }
  }
}
