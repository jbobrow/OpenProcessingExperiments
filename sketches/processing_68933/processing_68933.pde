
final int on = 1;
final int off = 0; 
//----------------------------------------------------------------------------
//variable pour cercle
int etatCer;
float boutonCer = 0;
int cerclePositionX = 135;
int cerclePositionY = 200;
int cercleDia = 50;
int nbDeR = 15;
int longeurDeR = 50;
float quartier = TWO_PI / nbDeR;
//----------------------------------------------------------------------------
//variable pour le rectangle
int etatRect;
float boutonRect = 0;
//----------------------------------------------------------------------------
//etat initiaux à off
void setup(){
  size(400,400);
  smooth();
  etatRect = off;
  etatCer = off;
  }

void draw () {
  background(100,100,100);
   strokeWeight(5);
    stroke(0);
    
 //----------------------------------------------------------------------------
//code pour creer le bouton et la boucle while  aide par Ugo Dufour et Joel Lalancette
  
    
  int i = 0;
      while (i < boutonRect ) { //condition
      line (0,i*25,height,i*25); //code
      i = i + 1; // incrementation
      
    }
  
  if (etatRect == on) {
  
    if (boutonRect<20) {
      
      boutonRect = boutonRect +1;
      }
     
       fill(255,0,255);
   
  }
  else{
    if (boutonRect > 0 ) {
      boutonRect = boutonRect - 1;}
    fill(0,255,0);
  }
  
  rectangle();
   strokeWeight(2);
  stroke(0);
  //----------------------------------------------------------------------------
//code pour creer la boucle  aide par Ugo Dufour et Joel Lalancette
  
  float radient = 0;
  while ( radient < boutonCer ) {
    
    
    float x =  cerclePositionX + cos  (radient) *  (cercleDia/2 + 5);
    
    float y = cerclePositionY + sin  (radient) * (cercleDia/2 + 5);
   float x2 =   cerclePositionX + cos  (radient) * longeurDeR;
    float y2 = cerclePositionY + sin  (radient) * longeurDeR;
    
    line(x, y, x2, y2);
    radient = radient + quartier;
  }
  
//----------------------------------------------------------------------------
//dessine le cercle
 
  drawCercle();
   
}
 

//----------------------------------------------------------------------------
//l'endroit ou on peut cliquer sur le cercle
void mousePressed() { 
   float distance = dist(mouseX, mouseY, cerclePositionX, cerclePositionY);
  if (distance < cercleDia/2) {
    if (etatCer == off) {
      etatCer = on;
    }
    else {
      etatCer = off;
    }
  }
  
  //----------------------------------------------------------------------------
//l'endroit ou on peut cliquer sur le rectangle 
  
  if (mouseX> 275 && mouseX < 325 && mouseY > 175 && mouseY < 225 ) {
    if ( etatRect == off ) {
      etatRect = on;
      
    }
    else {
      etatRect = off;
      
    }
  }
}
//----------------------------------------------------------------------------
//tout revient à off quand on lache la souris
 
void mouseReleased() { 
  etatRect = off;
}
//----------------------------------------------------------------------------
//dessin du rectangle
      void rectangle(){
      
     rectMode(CENTER);
  noStroke();
  rect(300,200,50,50);
   }
   
//----------------------------------------------------------------------------
//dessin du cercle
void drawCercle() {
   
  if (etatCer == on) {
    if (boutonCer < 6) {
    boutonCer = boutonCer + 0.5;
    }
    fill(255, 10, 200);
  }
  else {
    if (boutonCer > 0 ) {
      boutonCer = boutonCer - 0.5;
    }
    fill(50, 255, 0);
  }
  noStroke();
  ellipse (cerclePositionX, cerclePositionY, cercleDia, cercleDia);
   }
