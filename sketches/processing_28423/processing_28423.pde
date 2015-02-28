
// *leicht* - Processing-Hausaufgabe 2 = For Schleifen - Pattern
// HTW Sommersemester 2011 - Creative Coding
// (c) Nicklas Luckwald

//Abstand der Schleife
int abstand = 15;

//Grundeinstellungen der Szene
void setup(){
  size(500, 500);
  smooth();
  background(0);
}

//Auszuführende Befehle
void draw(){
  background(0);

//Die Schleife
  for(float y = 2.5; y <= height; y = y + abstand + 10){
    for(float x = 2.5; x <= width; x = x + abstand + 5){
      
//Inhalt der Schleife  
      fill(255, 100);
      rect(x, y,15, 15);
      ellipse(x+7.5, y+7.5, 40, 40);
      noStroke();
    }
  }

}

