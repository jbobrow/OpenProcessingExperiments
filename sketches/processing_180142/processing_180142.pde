
// Wabern II
// 12.12.2014

/* Aufgabenstellung
Entwickle ein Programm, bei dem beim gedrueckter Maustaste Kreise an der aktuellen Mausposition gezeichnet werden, ansonsten Kreuze.*/

void setup(){
size(400,400);
background(0,157,188);
}

void draw(){
if(mousePressed == true){
fill(255,255,0);
ellipse(mouseX,mouseY,30,30);
}}
