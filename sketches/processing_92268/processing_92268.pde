
int x = 50; // definisco le variabili x = posizione orizzontale
int y = 1; // movimento verso dx di 1
int m = 50; // variabile m = posizione verticale 
int z = 1; // movimento verso il basso di 1

void setup() // dati impostati
{
  size(500,300,P2D);   // size(width,height) w,h
}

void draw() // ciclo di dati 
{
  background(x,y,m); // sfondo che serve per cancellare la traiettoria
  fill(y,m,x);
  ellipse(x,m,100,100); // cerchio 
  x = x + y; m = m + z; // variabili del centro del cerchio
  if (x >450||x<50)      // if clause: max e min della x
  {
   y=y * -1;            // se si supera il w max o w min: rimbalzo
  }                     
  if (m>250||m<50)       // max min della m
  {
   z=z * -1;            // se si supera la h max o h min: rimbalzo
  }
  println(x);           // vedere valori x 
  println(m);           // vedere valori y
}
