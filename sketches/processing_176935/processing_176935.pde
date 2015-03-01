
// Papageimalen
// 12.12.2014

/* Aufgabenstellung
VerÃ�Â¤ndere das Programm so, dass die Linie auf der linken BildschirmhÃ�Â¤lfte orange, auf der rechten HÃ�Â¤lfte grÃ�Â¼n gezeichnet wird.*/

void setup(){
    size(400,400);
    background(0,0,0);
    }

void draw(){
strokeWeight(20);
if(mouseX<200){
stroke(212,161,237);
}
if(mouseX>200){
stroke(32,196,214);
}

     line(mouseX,mouseY,pmouseX,pmouseY);
 }
