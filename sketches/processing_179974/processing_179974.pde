
import processing.serial.*;
Serial port;  // definisco la porta seriale

float val;    // informazioni dalla porta seriale
float val3;   //per aumentare speed 2
float val4;   //per alzare mercurio
float  val5;  //mostra il numero sotto al termometro
float easing=0.05;
float easedval;

// variabili per modifica colore attraverso potenziometro
float  valR;  
float R, R1;
float G, G1;
float B, B1;

//immagini termometro
PImage term1; //termometro
PImage term2; //blu sotto termometro
PImage ledrosso; //led sopra il termometro rosso quando il mercurio è a 0
PImage ledverde; //led sopra il termometro verde quando il mercurio è a 100
PImage ledspento; //led sopra il termometro spento
PImage monitor; //monitor RGB

PImage back; //background
PImage rot; //rotella
//mercurio
int xmerc = 664;
int ymerc = 450;
float easingmerc = 0.02;

//Creo 3 array contenente un certo numero di elementi
int N = 100;  // numero di sfere per array
Sfera[] sfere = new Sfera[N];


//stampare valori
int t1=20; 

//variabili movimento infinito
float angle1 = 0.0;
float a = 235;
float b = 800;
float xinf=50;
float yinf=50;
float speed = 0.05;
float speed2 = 0.10; //questa variabile doppia rispetto a speed crea l'infinito

//per muovere la palla
float x = 50; //posizione iniziale palla
float y = 50;
float velx = 1; //velocità palla
float vely = 1.5;
float angle = 0.0; // rotazione

void setup(){
size(900,500);
//porta seriale arduino
  frameRate(60);
  String arduinoPort = Serial.list()[2];
  port = new Serial(this, arduinoPort, 9600);
  
 term2 = loadImage("blu.png");
 image(term2,630,0); // sfondo azzurro termometro
 back = loadImage("background.png");
 image(back,0,0);
 image(term2,630,0); // sfondo azzurro termometro

 // creo un ciclo che permette di creare un numero di sfere uguale al numero di elementi presenti nell'array sfere, posizionandole in maniera casuale all'interno della finestra
  for(int i = 0; i < sfere.length ; i++){
   sfere[i] = new Sfera(random(20,590),random(20,height-20),random(0,255));
  }

  
}

void draw(){
 
 fill(145,194,212); 
 rect(0,0,603,500);


//ricezione dati da arduino e conversione 
 if (port.available() > 0) { // se vengono ricevuti dei dati
    val = port.read();        // assegna a val i dati ricevuti dalla porta seriale
    val = map(val, 0, 255, 20, 0);  // Convertire valore da 0-255 a width - 0. per potenziometro
  }
  
  //aumentare la velocità di infinito
 val3 = map(val,20, 0 , 0.05, 0.50);
 //stampare v  alori
 fill(#ff8833);
 textSize(20);
 
 

 fill(#ff8833);

//termometro e Led colorati
 term2 = loadImage("blu.png");
 term1 = loadImage("term.png");

 ledrosso = loadImage("Ledrosso.png");
 ledverde = loadImage("Ledverde.png");
 ledspento = loadImage("Ledspento.png");

  //movimento livello mercurio
 
 val4 = map(val,20, 0 , 0, 470); //creo una variabile che farà alzare o abbassare il livello di mercurio
 float targety = val4;

 ymerc += (targety - ymerc) * easingmerc;
 stroke(#FF9900);
 fill(#FF9900);
 rect(xmerc,ymerc,20,5); //Mercurio giallo
 stroke(#336699);
 fill(#336699);
 rect(xmerc,ymerc-20,20,5); //svuotamento termometro

 //immagine termometro e led
  image(term1,625,0);
  image(ledspento,662,5);
//il led verde si accende quando il mercurio arriva in cima
 if (ymerc<35){
    image(ledverde,662,5);
 }  
 if (ymerc>400){
  image(ledrosso,662,5); 
 }
 
  //scritta sul termometro
 val5 = map(val,20, 0 , 100, 0);
 int val5i = int(val5); // converto il valore da flost a int
 fill(0);
 textSize(40);
 text(val5i,635,470);

//cambio colore
    valR = map(val,20, 0 , 255, 0);
    
    
if (keyPressed) {
    if (key == '1') {
    R1=valR;
    }
    if (key == '2') {
    G1=valR;
    }
    if (key == '3') {
    B1=valR;
    }
}

 // converto i valori in numeri interi per visualizzarli sul display RGB
    int R = int(R1); 
    int G = int(G1);
    int B = int(B1);

 //Monitor sul pannello di controllo
 fill(R,G,B,10);
 rect(730,150,130,200);
 monitor = loadImage("monitor.png");
 image(monitor,730,10);
 

//stampa valori RGB sul monitor
fill(0);
textSize(28);
text(R,785,45);
text(G,785,89);
text(B,785,132);


//movimento infinito del colore opposto a quello del monitor
  fill(255-R,255-G,255-B,255);
  noStroke();
  float yinf = a + cos(angle) *50;
  float xinf = b + sin(angle1) *20;
  ellipse(xinf, yinf, 10, 10);
  angle += speed;
  angle1 += speed2;
 

//richiamo la funzione sfera e imposto i colori RGB
  stroke(0);
  fill(R,G,B);
  for(int i = 0; i < sfere.length ; i++){
   sfere[i].run();
  }

  
  
}

 
 

class Sfera{
 //variabili globali
 float x = 0;
 float y = 0;
 float z = 0;
 float speedX = random(-2,2); //velocità iniziale casuale
 float speedY = random(-2,2);
 float h = random(20,40);
 float distanza;  //serve per calcolare la distanza tra le sfere

//Costrutto  
  Sfera(float tempx, float tempy, float tempz){
     x = tempx;
     y = tempy;
     z = tempz;  
  }
  
//Funzioni  
  void run(){
    display();
    move();
    rimbalzo();
    gravita();
    collegamenti();
    casuale();
   }
  
  //disegna una sfera di dimensioni h e t alla posizione x , y 
  void display(){
      fill(R1,G1,B1,z);
      ellipse(x,y,h,h);

  }
  
  //genera il movimento della sfera
  void move(){
    x += speedX; 
    y += speedY;
     if (speedY>10)
      speedY=10 ; //limita la velocità Y
  }
  
  //fa rimbalzare l'oggetto quando raggiunge il bordo
  void rimbalzo(){
    if(x<h/2 || x>603-h/2) 
   speedX= -speedX; 
 if(y<h/2 || y>height-h/2) 
   { speedY = -speedY; }
  }
  
  // genera una forza di gravità che influenza il movimento della sfera
  void gravita() 
  { if (keyPressed) {
      if (key == 'q'){
      speedY += 0.3;
      }
      }   
   
 // impedisce che l'oggeto esca dallo schermo 
        if( x > 603 - h/2) 
         {x = 600 - h/2;}
        if(x<h/2)
         {x=h/2;}
        if(y>height-h/2) 
        {y= height-h/2;}
        if(y<h/2) 
        {y=h/2;} 
 }

 
 //collegamenti tra i centri delle sfere
   void collegamenti() {
    if (keyPressed) {
     if (key == 'e')
      for (int i = 1; i < sfere.length; i++) {
         distanza = dist(x, y, sfere[i].x, sfere[i].y); //individua la distanza tra i centri di ogni sfera dell'array
       if (distanza < val5) {   // se questa distanza è inferiore a un certo valore stabilito dal potenziometro allora crea una linea che congiunge i centri delle due sfere
        line(x, y, sfere[i].x, sfere[i].y);
        }
       }

     }
    }


//genera un movimento casuale della sfera 
 void casuale(){
    if (keyPressed) {
    if (key == 'w') 
    {
      x += random(-val, val);
      y += random(-val, val); 
       // impedisce che l'oggeto esca dallo schermo durante il movimento casuale 
        if( x > 600 - h/2) 
         {x = 600 - h/2;}
        if(x<h/2)
         {x=h/2;}
        if(y>height-h/2) 
        {y= height-h/2;}
        if(y<h/2) 
        {y=h/2;}    
      }
   }
   }
   

  
 
}




