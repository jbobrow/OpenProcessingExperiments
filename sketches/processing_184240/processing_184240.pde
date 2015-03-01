
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

if(mousePressed){

stroke(random(255),random(255),random(255));
point(random(mouseX-10,mouseX+10),random(mouseY-10,mouseY+10));
//zeichne Punkte
}
else{
stroke(0,0,0);
point(random(mouseX-10,mouseX+10),random(mouseY-10,mouseY+10));
}
//wenn die Maus gedrÃ¼ckt wird...
// ... dann

}

