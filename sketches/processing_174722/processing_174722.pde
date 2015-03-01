
// Wirrwar
// 03.12.2014

/*  Schreibe ein Programm, das zufÃ�Â¤llige Linien zeichnet. Ihre Farbe sollen GrÃ�Â¼n- und BlautÃ�Â¶ne sein. Der Anteil der roten Farbe ist dementsprechend Null.
*/

void setup(){
size(400,400);
}

void draw(){
stroke(0,random(225),random(225));
line(random(300),random(400),mouseX,mouseY);

}



