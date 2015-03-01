
// Farben
// 03.12.2014

/*Aufgabenstellung
Ändere das Programm so, dass das blau intensiver wird, wenn man den Mauszeiger in VERTIKALER Richtung bewegt.
Ändere nun das Programm so, dass sich die Farbe sowohl bei horizontaler als auch bei vertikaler Bewegung ändert.*/

void setup(){
  size(300,300);
}

void draw(){
  background(0,0,mouseX);
}

