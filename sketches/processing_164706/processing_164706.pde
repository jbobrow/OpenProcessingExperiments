
/* @pjs globalKeyEvents=true; 
preload="chiave.png"; 
 */

//creo la classe Pennello
class Pennello {
  //definisco la variabile del colore
  color colore;
  //posizioni di x e y
  float posizionex;
  float posizioney;
  //velocità di x
  float velx;
 
//creo il costruttore 
  Pennello(color c, float x, float y, float vx) {
     
    //assegno le variabili universali a quelle specifiche di questo caso
    colore = c;
    posizionex = x;
    posizioney = y;
    velx = vx;
  }
   
  //metodo per disegnare e colorare le ellissi
  void pennellate() {
    noStroke();
    fill(colore);
    //ellisse con posizione x,y e dimensione orizzontale di 100 px e verticale di 60px
    ellipse(posizionex, posizioney, 100, 60);
  }
   
  //metodo per far muovere l'ellisse e controllare quando esce dalla finestra per farla ripartire da zero
  void move() {
    posizionex = posizionex + velx;
    if (posizionex > width) {
      posizionex = 0;
    }
  }
}
 
//Richiama il costruttore sopra e crea un nuovo oggetto di tipo Pennello chiamato pennelli secondo le regole definite dal costruttore
Pennello[] pennelli = new Pennello[0];

  
 //definisco il primo metodo decidendo la grandezza della finestra ed il colore dello sfondo 
void setup() {
  size (800, 600);
  background(255,255,255);
  
}

//definisco il secondo metodo 
void draw () {
  //creo il ciclo For per richiamare ciclicamente i due metodi della classe
for (int i = 0; i < pennelli.length; i = i + 1) {
     pennelli[i].pennellate();
     pennelli[i].move();
  }
   //se mousePressed è vero, creo un oggetto p di tipo Pennello 
   if (mousePressed) {
 Pennello p = new Pennello(color(int(random(255)),int(random(255)),int(random(255)),int(random(255))), int(random(width)), int(random(height)), int(random(1,5)));
  pennelli = (Pennello[]) append(pennelli,p);

   }
   //se mousePressed è falso, verrà caricata l'immagine "chiave.png" e con il comando image la disegno
   else  {
    PImage img;
img = loadImage("chiave.png");
image(img, 0, 173); 
   }
  //definisco lo spessore del bordo delle righe del pentagramma e la loro posizione sul foglio
  strokeWeight(4);
  
   line(0,200,800,200);
   line(0,250,800,250);
   line(0,300,800,300);
   line(0,350,800,350);
   line(0,400,800,400);
   
    
}


//questo metodo si attiva quando premo i tasti corrispondenti sulla tastiera (A B C D E F G)
void keyPressed() {
  
strokeWeight(8);
  fill(0,0,0);
  if (key == 'c'){
    fill(0,0,0);
     rect(160,447,80,6);
    
  ellipse(200,450,40,40);
  }
  if (key == 'd'){ 
  ellipse(270,425,40,40);
  }
  if (key == 'e'){
  ellipse(340,400,40,40);
  }
  if (key == 'f'){
  ellipse(410,375,40,40);
  }
  if (key == 'g'){
  ellipse(480,350,40,40);
  }
  if (key == 'a'){
  ellipse(550,325,40,40);
  }
  if (key == 'b'){
  ellipse(620,300,40,40);
  }
 
  
  
}
 


