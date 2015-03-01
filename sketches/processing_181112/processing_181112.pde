
// Gluehwuermchen
// 08.12.2014

/*Aufgabenstellung
Schreibe ein Programm, das deine letzte Mausbewegung mit einer Linie nachzeichnet. Diese verbindet also die aktuelle und die vorherige Mausposition.
Aendere das Programm so, dass die Linien eine zufaellige Farbe und Dicke (achte trotzdem auf schoenheit!) haben.
*/

void setup()
{
size(400,400);
background(200,0,200);
}
void draw(){
if(mouseX==pmouseX);
strokeWeight(random(20));
stroke(random(255),random(255),random(255));
if(mouseY==pmouseY);
}
line(mouseX,mouseY,pmouseX,pmouseY);
}
