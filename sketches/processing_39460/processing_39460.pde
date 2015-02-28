
void setup () {
  size (600, 600);
  background (0);
  smooth ();
}
void draw () {
  limon (pmouseY, pmouseX);
  mani( pmouseX, pmouseY);
  sopa (pmouseY, pmouseX);
  sopa (pmouseX, pmouseY);
}
void mani (int quezo, int mortadela) {

  quezo =quezo ++;
  mortadela = mortadela++;
  noStroke ();
  fill( 200, 50, 130, 80);
  ellipse (quezo, mortadela, 10, 10);
}
void limon (int quezo, int mortadela) {

  quezo =quezo ++;
  mortadela = mortadela++;
  noStroke ();
  fill( 219, 169, 255, 80);
  rect ( quezo, mortadela, 10, 10);
}

void sopa (int quezo, int mortadela) {

  stroke(240);
  strokeWeight (0);
  line ( 10, 10, mortadela, quezo);
}

                
                
