
// Ampelschaltung
// 12.12.2014

/*Aufgabenstellung
Entwickle ein Programm, das eine Ampel simuliert. Alle zehn Sekunden soll sie eine Phase weiterschalten.

Spoiler: 

Processing zeichnet standardmaessig 60 Bilder pro Sekunde. Mittels des frameRate(n) Befehls kann man diese Zahl aendern.
Mittels % erhaeltst du den Rest beim Dividieren. 5%2 ist beispielsweise 1, da 5=2*2 rest 1 ist. Nutze diese Funktion, damit du nach 31 Sekunden wieder in die Rot-Phase wechseln kannst. Sekunde 1 wird also genauso behandelt, wie Sekunde 31.

*/

int vergangeneZeit=0;

void setup(){
    size(400,400);
    background(0,155,187);
}

void draw(){
    frameRate(1); // Nun wird ein Bild pro Sekunde gezeichnet.
// Zeichnen der Ampel
    stroke(0,0,0);
    fill(50,50,50);
    rect(125,50,150,300);
    stroke(255,255,255);
    ellipse(200,100,50,50);
    ellipse(200,200,50,50);
    ellipse(200,300,50,50);

// wenn vergangeneZeit zwischen 0 und 10, 31 und 40 ...
// ... dann

// wenn vergangeneZeit zwischen 11 und 20, 41 und 50 ...
// ... dann

// wenn vergangeneZeit zwischen 21 und 30, 51 und 60...
// ... dann

vergangeneZeit=vergangeneZeit+1; //Eine Sekunde vergeht
}
