
int sec;
int differenceSec;
int dak; // dak means minute in turkish :)
int differenceDak;
int saat; // hour in turkish
int differenceSaat;
int numBarsforSec;
int numBarsforMin;


void setup() { 
  size(600, 600);
}

void draw() {
  int runningTime = millis();
  background(255,0,0);
  
  if ( differenceSaat > 1000*60*60) {
    saat = runningTime;
  }
  differenceSaat = runningTime -saat;

  if ( differenceDak > 1000*60) {
    dak = runningTime;
    numBarsforMin ++;
    numBarsforSec = 0;
  }
  differenceDak = runningTime - dak;
  println(differenceDak);

  if ( differenceSec > 1000 ) {
    sec = runningTime;
    numBarsforSec ++;
  }
  int rectheight = 0;
  for ( int i=0; i< numBarsforSec ; i++) {
    fill( map(i, 0, 60, 0, 255 ) ); 
    rect ( 0, rectheight, width, height/60 ); 
    rectheight += height/60;
  }
  int rectWidth = 0;
  for ( int i=0; i< numBarsforMin; i++) {
    fill( map(i, 0, 60, 0, 255));
    rect ( rectWidth, 0, width/60, height);
    rectWidth += width/60;
  }

  differenceSec = runningTime - sec;
  println(differenceSec);
}



