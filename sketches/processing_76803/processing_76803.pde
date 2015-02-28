
int fons = 205;
int bizq = #FA9CE3;
int bder = #FA9CE3;
int pieder = #E51C69;
int pieizq = #E51C69;
int cuerpo = #FA9CE3;
int boca = #000000;
int ojoizq = #050505;
int pupizq = #FFFCFE;
int ojoder = #050505;
int pupder = #FFFCFE;
int mejiizqui = #E34280;
int mejider = #E34280;
int bocados = #CB4277;

void setup() {
size(500,500);
smooth();
}
void draw() {
strokeWeight(5);
background(fons);
//brazo izquierdo
fill(bizq);
arc(140, 160, 70, 90, 3.95, 10.28);
noFill();
//brazo derecho
fill(bder);
arc(380, 250, 70, 90, 3.95, 8.08);
noFill();
//pie derecho
fill(pieder);
arc(335, 350, 150, 60, 5.05, 8.28);
noFill();
//pie izquierdo
fill(pieizq);
arc(200, 350, 200, 60, 1.95, 9.28);
noFill();
//cuerpo
fill(cuerpo);
ellipse(250, 250, 270, 270);
strokeWeight(4);
//boca
fill(boca);
arc(245, 300, 70, 95, 3.95, 5.55);
arc(245, 280, 50, 63, 5.70, 9.95);
noFill();
fill(bocados);
arc(245, 310, 50, 75, 3.55, 5.95);
noFill();

//ojo izquierdo
fill(ojoizq);
ellipse(220, 200, 30, 80);
noFill();
//pupila izquierda
fill(pupizq);
ellipse(220,185,25,35);
noFill();
//ojo derecho
fill(ojoder);
ellipse(270, 200, 30, 80);
noFill();
//pupila derecha
fill(pupder);
ellipse(270,185, 25, 35);
noFill();
//mejilla izquierda
fill(mejiizqui);
ellipse(180, 240, 45, mouseY/25);
noFill();
//mejilla derecha
fill(mejider);
ellipse(310, 240, 45, mouseX/25);
noFill();
}

// aqui s pone el color que se quiere al darle un click
void mousePressed(){
  fons = #E55DB6;
  bizq = #52A6F7;
  bder = #52A6F7;
  pieder = #1E3CF7;
  pieizq = #1E3CF7;
  cuerpo = #52A6F7;
  boca = #000000;
  pupizq = #FFFCFE;
  pupder = #FFFCFE;
  mejiizqui = #1E3CF7;
  mejider = #1E3CF7;
 }
//aqui se pone el color que se quiere para al darle otro click salga el color que hayas puesto
void mouseReleased(){
  fons = #2334E5;
  bizq = #FA9CE3;
  bder = #FA9CE3;
  pieder = #E51C69;
  pieizq = #E51C69;
  cuerpo = #FA9CE3;
  boca = #000000;
  pupizq = #FFFCFE;
  pupder = #FFFCFE;
  mejiizqui = #E34280;
  mejider = #E34280;
}

