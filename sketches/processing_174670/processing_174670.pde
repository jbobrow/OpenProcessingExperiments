
// Farben
// 03.12.2014

/*Aufgabenstellung
Ã�ndere das Programm so, dass das blau intensiver wird, wenn man den Mauszeiger in VERTIKALER Richtung bewegt.
Ã�ndere nun das Programm so, dass sich die Farbe sowohl bei horizontaler als auch bei vertikaler Bewegung Ã¤ndert.*/

void setup(){
  size(800,800);
}

void draw(){
  background(0,0,mouseX,125);
}

