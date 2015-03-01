
// Papageimalen
// 12.12.2014

/* Aufgabenstellung
VerÃ�Â¤ndere das Programm so, dass die Linie auf der linken BildschirmhÃ�Â¤lfte orange, auf der rechten HÃ�Â¤lfte grÃ�Â¼n gezeichnet wird.*/

void setup(){
    size(600,600);
    background(0,157,188);
    }

void draw(){
     line(mouseX,mouseY,pmouseX,pmouseY);
 }
