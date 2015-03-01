
// Wabern II
// 12.12.2014

/* Aufgabenstellung
Entwickle ein Programm, bei dem beim gedrueckter Maustaste Kreise an der aktuellen Mausposition gezeichnet werden, ansonsten Kreuze.*/

void setup(){
size(400,400);
background(0,157,188);
}

void draw(){


//wenn die Maus gedrÃ¼ckt ist...
// ...dann
if(mousePressed){
stroke(255,255,255);
ellipse(mouseX,mouseY,50,50);
}
//... sonst
else{ 
stroke(0,0,0);
line(mouseX-66, mouseY, mouseX+66, mouseY);
line(mouseX, mouseY-66, mouseX, mouseY+66);
}
}
