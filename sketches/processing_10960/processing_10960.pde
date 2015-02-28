
PFont f;

int x;
void setup (){
  size (300,300);
    f= loadFont ("Purisa-48.vlw");
}

void draw () {
  background (#0AC449);
  textFont (f, 20);
  fill (50);
  text ("Oficina Processing", x,30);
  text ("Oficina Processing", x+50,70);
  text ("Oficina Processing", x+70,110);
  x+=1;
  if (x<5) {
    x = +10;
  }
  if (x>300) {
    x=-10;
  }
}
  


