
// Wirrwar
// 03.12.2014

/*  Schreibe ein Programm, das zufÃ¤llige Linien zeichnet. Ihre Farbe sollen GrÃ¼n- und BlautÃ¶ne sein. Der Anteil der roten Farbe ist dementsprechend Null.
*/

void setup(){
size(400,400);
}

void draw(){
stroke(0,random(255),random(225));
line(random(400),random(400),200,155);

}
