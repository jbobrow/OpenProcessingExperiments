
// Ampelschaltung
// 12.12.2014

/*Aufgabenstellung
Entwickle ein Programm, das eine Ampel simuliert. Processing zeichnet standardmaessig 60 Bilder pro Sekunde. Mittels des frameRate(n) Befehls kannst du diese Zahl Ã¤ndern.*/

int vergangeneZeit=0;

void setup()
{
size(400,400);
background(0,195,187);
}

void draw()
{
strokeWeight (12);
stroke (21,42,194);
ellipse (mouseX, mouseY, 50,50);
ellipse (mouseY, mouseX, 35,23);
}
