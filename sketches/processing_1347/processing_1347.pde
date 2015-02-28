
void setup(){
  size (500, 500);
  background (255);
  fill (0);
  noStroke();
  smooth();
  
  int rad = 20;
  int x = 25;
  for (int i = 0; i < 19; i++){
    for (int j = 0; j < 19; j++){
      kreis (rad +i/2, x*i+25, x*j+25);
    }
  }
}
void kreis (int rad, int x, int y){
 pushMatrix();
translate (x,y);
fill (0);
ellipseMode (CENTER);
ellipse (0,0,rad,rad);
fill (255);
rectMode (CENTER);
rotate (random (0,180));
rect (0,0,5,22);
popMatrix();
}

