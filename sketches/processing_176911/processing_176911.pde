
// Papageimalen
// 12.12.2014

/* Aufgabenstellung
VerÃ¤ndere das Programm so, dass die Linie auf der linken BildschirmhÃ¤lfte orange, auf der rechten HÃ¤lfte grÃ¼n gezeichnet wird.*/

void setup(){
    size(400,400);
    background(0,157,188);
    }

void draw(){
     line(mouseX,mouseY,pmouseX,pmouseY);
 }
