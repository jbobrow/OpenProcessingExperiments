
// Papageimalen
// 12.12.2014

/* Aufgabenstellung
VerÃ�Â¤ndere das Programm so, dass die Linie auf der linken BildschirmhÃ�Â¤lfte orange, auf der rechten HÃ�Â¤lfte grÃ�Â¼n gezeichnet wird.*/

void setup(){
    size(400,400);
    background(0,157,188);
    }

void draw(){
if(mouseX>200){
stroke(0,255,0);
}
if(mouseX<=200){
stroke(209,134,0);
}
     line(mouseX,mouseY,pmouseX,pmouseY);
}
