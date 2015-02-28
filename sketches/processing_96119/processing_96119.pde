
/* Cristina Torres. Seminari 2 */
/* Pinzell que es mou amb el mouse i a mesura que pasa pels
rectangles "de la paret els pinta" i canvien de color */

int x; int y;

void setup(){
size(500,500);
background(51,101,149);
}

void draw(){
background(38,41,93); 

/* Rectangles que canvien de color al passar el ratolí per sobre.
L'hem de moure en vertical o hortizontal depenent del rectangle */

/* Rectangle 1 */
fill(mouseY,147,98);
rect(0,0,125,500);
/* Rectangle 2 */
fill(125,mouseX,98);
rect(125,0,130,500);
/* Rectangle 3 */
fill(32,100,mouseY);
rect(250,0,125,500);
/* Rectangle 4 */
fill(mouseX,100,26);
rect(375,0,125,500);

/* Pinzell */
fill(144,59,16);
stroke(98,35,3);
strokeWeight(2);
rect(mouseX-25,mouseY-25,50,50);

fill(219,147,31);
noStroke();
rect(mouseX+25,mouseY-25,20,50);
rect(mouseX+35,mouseY-12.5,70,25);
ellipse(mouseX+105,mouseY-0,25,25);

fill(38,41,93);
ellipse(mouseX+105,mouseY-0,10,10);

}


