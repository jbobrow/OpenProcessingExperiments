
//Definisco le grandezze variabili nel codice
float d;   //diametro della bolla
//creo un sistema di coordinate all'interno della finestra per lo spawn delle bolle
float xbolla;//ascissa della bolla 
float ybolla; //ordinata della bolla

float a;     //{
float b;     //{parametri dei colori delle bolle
float c;     //{

//Creo la finestra di lavoro
void setup() {
  size(600,600);
  smooth();
  noStroke();
  background(255); 
  frameRate(3/2); //velocità di spawn delle bolle
}

//Funzione che disegna le bolle e le colora
void draw(){
  xbolla=random(d/2,width-(d/2));   //xbolla scelta casualmente all'interno della finestra
  ybolla=random(d/2,height-(d/2));  //ybolla scelta casualmente all'interno della finestra
  ellipse(xbolla,ybolla,d,d);       //forma base per disegnare le bolle
  
  a=random(0,255);    //
  b=random(0,255);    //{colori delle bolle casuali
  c=random(0,255);    //
  fill(a,b,c);        //forma base per colorare le bolle
     }
//Creo una funzione che cambia la dimensione delle bolle e ne regola lo spawn
void mouseClicked(){
   if (mouseButton== LEFT){ 
   d=random(2,100);  //diametro della bolla casuale
    loop();
  }
  else if (mouseButton== RIGHT){
    noLoop();
  }
}





