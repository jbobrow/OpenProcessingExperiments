
// Lokalisierung
// 03.12.2014

/*Aufgabenstellung
Veraendere das Programm so, dass in einem Abstand von 10 Pixeln von der aktuellen Mausposition zufaellig Punkte erzeugt werden. Wird die Maus geklickt, aendere sich die Farbe.
Spoiler: random(a,b) erzeugt eine Zufallszahl zwischen a und b*/



void setup(){
size(400,400);
background(0,155,187);
}

void draw(){

//zeichne Punkte
point(random(mouseX(random-10),mouseX(random+10),mouseY));

//wenn die Maus gedrÃ¼ckt wird...
// ... dann

}

