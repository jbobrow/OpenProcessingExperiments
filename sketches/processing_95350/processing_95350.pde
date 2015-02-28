
//******************************************************************
//
// CAMPO da CALCIO
//
// versione: 1.3 del 16-03-2013
// Autori: L. Sciamanna, F. Magri, A. Gavezzoli, D. Deliu, D. Daga
// Classe: 4 E/F anno scolastico 2012-2013
//
// Descrizione: lo scopo del programma è tirare la palla in porta 
//              eludendo il portiere
//
// Comandi: posizionare il mouse nella posizione in cui si vuole
//          mettere la palla. Cliccare mouse sinistro per confermare
//          la posizione della palla. Cliccare mouse destro per 
//          tirare la palla
//
//*******************************************************************
//
// definizione delle variabili
//
boolean tira_palla = false;
boolean rimbalza_palla = false;
boolean calcola_distanza = true;
boolean verifica_goal = false;
boolean verifica_bug =false;
int tiri = 0;
int goal = 0;
float palla_x = 0;
float palla_y = 0;
float goal_x;
float goal_y;
float distanza_x = 0;
float distanza_y = 0;
float vel = 0.1;
float start=165;
float stop=235;
float x=165;
float y=40;
boolean Goal;
float posizione_portiere = start; // posiziona il portiere alla sinistra
//
//******************************************************************
//
// Funzione che disegna il portiere
//
void portiere (float x,float y){
  rectMode(CENTER);  // le coordinate sono nel centro
  noStroke();
  fill(255,128,0);
  rect(x, y, width*0.08, height*0.03);// disegna il rettangolo
  }
// Funzione che muove il portiere
//
void muove_portiere(){
 if (posizione_portiere == start){ 
 x = x + 2; // sposta il portiere a destra
 if(x == stop) posizione_portiere = stop;
 }
 if(posizione_portiere == stop){ 
 x = x - 2; // sposta il portiere a sinistra
 if(x == start) posizione_portiere = start; 
 }
 portiere(x, y);
}  
// Funzione che disegna il campo da calcio
//
void  disegna_campo(){
   background(0, 187, 94); // colore dell'erba del campo da calcio
   // disegna la linea di centro campo  
   stroke(255);
   strokeWeight(4);  // Thicker
   // x1, y1  --  x2, y2
   line(width*0.1, height/2, width*0.9, height/2);
   // disegna il bordo del campo rettangolo
   noFill(); // il rettangolo non è riempito di colore
   rectMode(CORNER);  // Default rectMode is CORNER
   // posizione x1, posizione y1, altezza, larghezza
   rect(width*0.1, height*0.1, width*0.8, height*0.8);
   // disegna l'area centrale (cerchio)
   ellipseMode(CENTER);  // le coordinate corrispondono al centro
   //fill(255);  // riempi con un colore
   noFill(); // il cerchio non è riempito di colore
   strokeWeight(4);  // spessore normale
   ellipse(width/2, height/2, 90, 90);  // disegna un quarto di cerchio
   // disegna i calci d'angolo
   ellipseMode(CENTER);  // le coordinate corrispondono al centro
   fill(255);  // riempi con un colore
   strokeWeight(1);  // spessore normale
   // centro x1, y1, posizione x2, y2 grandezza x3, y3 angolo inizio e fine
   arc(width*0.1, height*0.1, 50, 50, 0, HALF_PI);  // disegna angolo in alto a sinistra
   arc(width*0.9, height*0.9, 50, 50, PI, PI+HALF_PI);  // disegna angolo in basso a destra
   arc(width*0.9, height*0.1, 50, 50, HALF_PI, PI);  // disegna angolo in alto a destra
   arc(width*0.1, height*0.9, 50, 50, HALF_PI+PI, PI+PI);  // disegna angolo in basso a sinistra
   // disegna area di rigore
   strokeWeight(3);  // spessore area di rigore
   noFill();//non riempimento area
   rectMode(CENTER);  // le coordinate sono nel centro
   rect(width*0.5, height*0.15, width*0.26, height*0.10);// area piccola alto
   rect(width*0.5, height*0.85, width*0.26, height*0.10);// area piccola basso
   //  pali della porta
   strokeWeight(3);  // spessore area piccola 2
   stroke(0);//colore linea porta
   line(width/2-52, height*0.10, width/2-47, 7);// palo sinistra
   line(width/2+52, height*0.10, width/2+57, 7);// palo destra
   line(width/2-47, 7, width/2+57, 7);// traversa
   //************************************************
}

void setup() {
  size(400, 400); // area dello schermo usato dal programma
  frameRate(30); // velocità di refresh del video
  // Posizione della palla all'inizio del gioco
  palla_x = width/2;
  palla_y = height/2;
  goal_x = width/2;
  goal_y = height*0.06;
  // create a font with the third font available to the system:
  PFont myFont = createFont(PFont.list()[2], 14);
  textFont(myFont);
}

void draw() {
  disegna_campo();
  // scrivi il testo "tiri in porta"
  fill(0);
  text(tiri, width*0.1, height-10);
  text("Tiri in porta",  width*0.1+27, height-10);
  //Goal
  text(goal, width*0.7, height-10);
  text("Goal",  width*0.7+27, height-10);
  if (verifica_goal == true){
     if (palla_y < 40){
       if (palla_x >=width/2-52 && palla_x <= width/2+52){
         verifica_goal = false;
         goal++;
         } 
       }
     }
  
   
  //*********************************************************
  muove_portiere();
  //*********************************************************
  // verifica se la palla è stata parata
  //
  if(palla_y >= y && palla_y <= y+height*0.04){
    if(palla_x >= x-width*0.05  &&  palla_x <= x+width*0.05) {
      tira_palla=false;
      rimbalza_palla = true;
      }   
  }
   //************************************************
   //  muovi la PALLA
   //
   fill(0);  // riempi con un colore
   strokeWeight(4);  // spessore 4
   ellipse(palla_x, palla_y, width*0.04, height*0.04);  // disegna un cerchio
   // muovi la palla in porta
   if(tira_palla == true){
     if(calcola_distanza){
       distanza_x = palla_x - goal_x;
       distanza_y = palla_y - goal_y;
       calcola_distanza = false;
     }
     //palla_x = palla_x + Distanza_x * vel;
     //palla_y = palla_y + Distanza_y * vel;
     if(distanza_x > 0) palla_x = palla_x - 5;
     if(distanza_x < 0) palla_x = palla_x + 5;
     if(distanza_y > 0) palla_y = palla_y - 15;
     if(palla_y <= goal_y){
       tira_palla = false;
       calcola_distanza = true;
       }     
     } 
 if(rimbalza_palla == true){
     palla_x = palla_x + palla_x * vel;
     palla_y = palla_y + palla_y * vel;
     if(palla_x <= width*0.1  ||  palla_x >= width*0.90){
       rimbalza_palla = false;
       }     
     }  
}
//******************************************************************
//  Questa funzione viene chiamata quando viene premuto uno
//  qualsiasi dei pulsanti del mouse
//
void mousePressed() {
  // riconosce se è stato premuto il tasto sinistro
  if (mouseButton == LEFT) {
    tira_palla = false;
    palla_x = mouseX;
    palla_y = mouseY;
  } 
  // riconosce se è stato premuto il tasto destro
  if (mouseButton == RIGHT) {
    tira_palla = true;
    tiri++; // aumenta i tiri in porta
    verifica_goal = true;
       }
}
 



