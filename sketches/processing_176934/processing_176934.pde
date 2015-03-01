
// Wabern II
// 12.12.2014

/* Aufgabenstellung
Entwickle ein Programm, bei dem beim gedrueckter Maustaste Kreise an der aktuellen Mausposition gezeichnet werden, ansonsten Kreuze.*/

void setup(){
size(400,400);
background(0,157,188);
}

void draw(){
if(mousePressed==true){
ellipse(mouseX,mouseY,60,60);
}
if(mousePressed==false){
triangle(mouseX,mouseY,60,90,29,55,33);
}

}
