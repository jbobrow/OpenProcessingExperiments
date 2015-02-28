
int cos = (#0066FF);
int fons = (#00FF00);

void setup(){
  size(500,500);
  smooth();
}

void draw (){
  
  background (fons);

  stroke(0,0,0);

  //Cap exterior blau
  fill (cos);
  ellipse (250,300,480,480);

  //Cap interior blanc
  fill (255,255,255);
  ellipse (250,400,380,480);

  //Ull Dret
  fill (255,255,255);
  ellipse (300,150,100,125);

  //Ull esquerra
  fill (255,255,255);
  ellipse (200,150,100,125);

  //Interior ull dret, moviment
  fill (0,0,0);
  ellipse (300,150,mouseY/10,mouseX/10);

  //Interior ull esquerra, moviment
  fill (0,0,0);
  ellipse (200,150,mouseX/10,mouseY/10);

  //Ralla nas-boca
  line (250, 200, 250, 412);

  //Nas
  fill (238,0,0);
  ellipse (250,200,50,50);

  //Boca
  noFill ();
  arc (250,375,200,75,0,3.6);

  //Bigotis esquerra
  line (80, 220, 200, 250);
  line (70, 280, 190, 280);
  line (80, 340, 200, 310);

  //Bigotis dreta
  line (300, 250, 420, 220);
  line (310, 280, 430, 280);
  line (300, 310, 420, 340);

  //Collar
  fill (205,0,0);
  rect (40, 445, 420, 55, 12, 12, 12, 12);

  //Picarol exterior
  fill (255,215,0);
  ellipse (250,475,70,70);

  //Rodona picarol
  fill (0,0,0);
  ellipse (250,485,13,13);

  //Ralla picarol
  line (250, 485, 250, 500);

}

void mousePressed() {
  if (cos == #FFFF00) {
    cos = #0066FF;
  } else {
    cos = #FFFF00;
  }
}

void mouseReleased() {
  if (fons == #00FF00) {
    fons = #FF00FF;
  } else {
    fons = #00FF00;
  }
}

