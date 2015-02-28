
int equis = 10;
void setup() {
  size (600, 600); 
  smooth();
}

void draw() {
  background (255); 
  segundos ();
  minutos (); 
  horas (); 
}

void segundos (){
  int sec = second();  // Values from 0 - 59
  noStroke();
  fill (0,0, sec*equis);
  rect  (10, sec*equis,100, sec*equis );
}

void minutos (){
  int minu = minute();  // Values from 0 - 59
  fill (0,minu*equis, 0);
  rect  (110, minu*equis, 200, minu*equis  );
}

void horas (){
  int ho = hour();    // Values from 0 - 23
  fill (ho*equis,0, 0);
  rect  (210, ho*5, 300, ho*5 );
}





