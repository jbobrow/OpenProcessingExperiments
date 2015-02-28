
// *weich* - Processing-Hausaufgabe 2 = For Schleifen - Pattern
// HTW Sommersemester 2011 - Creative Coding
// (c) Nicklas Luckwald

//Abstand der Schleife
int abstand = 15;

//Grundeinstellungen der Szene
void setup(){
  size(500, 500);
  smooth();
  background(250);
}

//Auszuführende Befehle
void draw(){
  background(255);

//Die Schleife
  for(float y = 2.5; y <= height; y = y + abstand + 40){
    for(float x = 2.5; x <= width; x = x + abstand + 40){
   
//Inhalt der Schleife     
      fill(0, 20);
      rectMode(CENTER);
      ellipseMode(CENTER);

      ellipse(x , y, 10, 10);
      ellipse(x , y, 40, 40);
      ellipse(x , y, 80, 80);
      rect(x, y, 20 , 20 );
      rect(x, y, 40 , 40 );

      strokeWeight(2);
      stroke(0, 30);
    }
  }

}

