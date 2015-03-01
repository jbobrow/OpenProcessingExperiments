
// Gluehwuermchen
// 08.12.2014

/*Aufgabenstellung
Schreibe ein Programm, das deine letzte Mausbewegung mit einer Linie nachzeichnet. Diese verbindet also die aktuelle und die vorherige Mausposition.
Aendere das Programm so, dass die Linien eine zufaellige Farbe und Dicke (achte trotzdem auf schoenheit!) haben.
*/

void setup(){
size(400,400);
}

void draw(){
background(0,155,188);
strokeWeight(2);
stroke(255,206,0);

line(mouseX,mouseY,pmouseX,pmouseY);
}
