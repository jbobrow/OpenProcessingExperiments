
// *schwer* - Processing-Hausaufgabe 2 = For Schleifen - Pattern
// HTW Sommersemester 2011 - Creative Coding
// (c) Nicklas Luckwald

int abstand = 15;

//Grundeinstellungen der Szene
void setup(){
  size(500, 500);
  smooth();
  background(255);
}

//Auszuführende Befehle
void draw(){
  background(255);

//Die Schleife
  for(float y = 2.5; y <= height; y = y + abstand + 40){
    for(float x = 2.5; x <= width; x = x + abstand + 15){
      
//Inhalt der Schleife  
      fill(0, 50);
      rect(x+5, y+5, 5, 5);
      rect(x+5, y+5, 5, 5);
      rect(x+5, y+5, 5, 5);
      rect(x, y,15, 15);
      rect(x, y+2.5, 20, 10);
      rect(x, y+5, 30, 5);
      rect(x, y+5, 30, 5);
      ellipse(x+7.5, y+7.5, 40, 30);
      ellipse(x+7.5, y+7.5, 40, 40);
      ellipse(x+7.5, y+7.5, 40, 50);
      ellipse(x+7.5, y+7.5, 40, 60);
      ellipse(x+7.5, y+7.5, 40, 70);
      noStroke();
    }
  }

}

