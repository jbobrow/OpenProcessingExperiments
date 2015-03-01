
// Rumpelstilzchen
// 08.12.2014

/*Aufgabenstellung
Schreibe ein Programm, das einen selbst gewaehlten Text an der aktuellen Mausposition erscheinen laesst und ihn anschliessend langsam wieder ausblendet. 
Hinweis: In Abschnitt 2 (Aufbau von Programmen und eingebaute Variablen) findest du ein Beispiel, in dem eine Ellipse ausgeblendet wird. 
*/


void setup(){
size(400,400);
background(0,157,187);
smooth();
}

void draw(){
textSize(30);
text("Hallo",200,200);
}


