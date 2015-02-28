
/*altezza iniziale*/
int ys = 100;
int yh = 100;

/*incremento per il movimento*/
int hard = 5;
int soft = 5;

/*controllo altezza*/
int tops = 0;
int toph = 0;

void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  background(0);

  /*movimento pallina dura
  yh = yh - hard;
  movimento pallina morbida
  ys = ys - soft;*/

  /*CONTROLLO SUGLI ESTREMI: se la y della palline è maggiore o uguale al massimo
  o maggiore dell'altezza*/
  if ((ys <= tops) || (ys > height-16)) {
  
    /*cambia direzione */
    soft = soft * - 1;
    /*incremento altezza*/
    ys = ys - soft;
  }
  else
  {
    /*quando è in mezzo, abbassa il limite dell'altezza*/
    tops++;
    ys = ys - soft;
    /*controllo finale: se il limite di altezza raggiunge la fine della 
    finestra, i valori vengono azzerati*/
    if (tops == height-32) {
      soft=0;
      ys=height-16;
    }
  }
  
  
  if ((yh < toph) || (yh > height)) {
    hard = hard * - 1;
  }

  noStroke();
  fill(187, 110, 116);
  ellipse(150, ys, 32, 32);

  noStroke();
  fill(179, 73, 56);
  ellipse(350, yh, 32, 32);
}



