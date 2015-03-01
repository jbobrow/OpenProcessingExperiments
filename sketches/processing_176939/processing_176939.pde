
// Wabern
// 12.12.2014

/*Aufgabenstellung
Schreibe ein Programm, bei dem mittels einer Variable helligkeit ein schwarzes Quadrat langsam heller wird.
Aendere das Programm so, dass das Quadrat wieder dunkler wird, sobald die helligkeit maximal ist.*/

int helligkeit = 66;

void setup(){
size(400,400);
}

void draw(){
background(0,155,187);
fill(0,0,0);
rect(100,100,200,200);
}
