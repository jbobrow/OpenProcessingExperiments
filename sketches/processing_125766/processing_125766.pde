
void setup() {
size(600, 600);
}
void draw() {
background(170,167,167);
//disegno il muso
fill(118,31,31);
quad(250,300,100,420,150,480,280,400);
//disegno la linea della bocca
stroke(0,0,0);
line(180,420,125,450);
//disegno il collo
fill(118,31,31);
quad(400,300,300,400,300,600,600,600);
//disegno il corno
fill(118,31,31);
quad(450,100,300,200,350,250,500,100);
//disegno la testa
ellipseMode(CENTER);
fill(118,31,31);
ellipse(300,300,200,200);
//disegno l'occhio
fill(245,245,245);
ellipse(260,260,60,30);
//disegno la pupilla
fill(0,0,0);
ellipse(260,260,20,20);
if (mousePressed)
background(170,167,167);
//disegno il muso
fill(118,31,31);
quad(250,300,100,420,125,450,280,400);
//disegno la bocca aperta con palle di fuoco
if(mousePressed) {
fill(118,31,31);
quad(280,400,280,500,280,500,300,400);
fill(242,168,71);
ellipse(250,480,50,50);
ellipse(180,480,50,50);
ellipse(150,550,50,50);
}
//disegno il collo
fill(118,31,31);
quad(400,300,300,400,300,600,600,600);
//disegno il corno
fill(118,31,31);
quad(450,100,300,200,350,250,500,100);
//disegno la testa
ellipseMode(CENTER);
fill(118,31,31);
ellipse(300,300,200,200);
//disegno l'occhio
fill(245,245,245);
ellipse(260,260,60,30);
//disegno la pupilla
fill(0,0,0);
ellipse(260,260,20,20);
}
