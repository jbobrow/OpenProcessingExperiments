
/*     Ominopaco 
 (primo tentativo di disegno per programmazione di Visualpaco)
 25 aprile 2009   */


void setup () {
  size (200,350);
  background (0,80,225);
  frameRate (25);
}
void draw () { 
  background (0,mouseX,mouseY);
  smooth ();
  rectMode (CENTER);
  ellipseMode (CENTER);

  //corpo
  fill (250,250,0);
  stroke (0,0,0);
  rect (mouseX,mouseY,30,100);

  //testa
  fill (mouseX-100,mouseY,0);
  ellipse (mouseX,mouseY-30,60,60);

  //occhi)
  fill (0);
  ellipse (mouseX-15,mouseY-30,15,15);
  ellipse (mouseX+15,mouseY-30,15,15);

  //gambe e piedi
  line (mouseX-15,mouseY+50,84,189);
  line (mouseX+16,mouseY+50,116,189);
  line (116,189,125,189);
  line (84,189,76,189);

  //braccia
  line (mouseX-16,mouseY-5,72,150);
  line (mouseX+16,mouseY-5,128,150);

  //mani
  ellipse (73,147,5,10);
  ellipse (128,147,5,10);

  //bocca (ci si prova!!)
  curve (100,100,mouseX-10,mouseY-12,mouseX+10,mouseY-12,100,100);
}





