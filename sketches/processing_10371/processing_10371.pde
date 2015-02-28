
void setup() {
  size (450, 450);
  colorMode(RGB,500);
  fill (0);
  smooth();
  frameRate(100);
  int rad = 20;
  int x = 50;
  //degradau
  for (int i = 0; i < 500; i++) {
  for (int j = 0; j < 500; j++) {
    stroke(i, j, 520);
    point(i, j);
  }
}
  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
      kreis (rad +i/2, x*i+75, x*j+75);//donde empiezan los cuadradicos
    }
  }
}
void kreis (int rad, int x, int y) {
   noStroke();
 pushMatrix();
   translate (x,y);
   fill(25,25,random(150,500),90);//alfa cuadrau grande
   rect (0,0,50,50);
   rectMode (CENTER);
   fill(0,25,random(150,500));
   rect (0,0,23,23);//cuadrau xikitillo
 popMatrix();
}


