
// Papageimalen
// 12.12.2014

/* Aufgabenstellung
VerÃ�ï¿½Ã�Â¤ndere das Programm so, dass die Linie auf der linken BildschirmhÃ�ï¿½Ã�Â¤lfte orange, auf der rechten HÃ�ï¿½Ã�Â¤lfte grÃ�ï¿½Ã�Â¼n gezeichnet wird.*/

void setup(){
    size(400,400);
    background(5,157,188);
    }

void draw()
{
     ellipse(mouseX, mouseY ,63 ,12);
     ellipse(mouseY ,mouseX ,77 ,63);
     stroke(242,103,93);
     strokeWight(0);
 }
