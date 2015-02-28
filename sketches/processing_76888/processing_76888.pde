
//Nom del dibuix: "BOB ESPONJA EN UN AFTER"
//author Carlos Cevallos Manzano
//clase 1r de ASIX 

//variable fondo
int fondo = #5AB6CE;

//variables burbuja alpha
float pos1 = 600;
float anch1 = 5;
float altu1 = 10;
//variables burbuja beta
float pos2 = 600;
float anch2 = 7;
float altu2 = 12;
//variables burbuja gamma
float pos3 = 600;
float anch3 = 6;
float altu3 = 11;
//variables burbuja omega
float pos4 = 600;
float anch4 = 5;
float altu4 = 10;
//variable pupila 
float pupianch = 20;
float pupialtu = 20;


void setup (){
//tamany del dibuix 
  size (600, 600); 
}

void draw (){
//fondo
background (fondo);
//cuerpo de Bob Esponja
fill (255, 255, mouseX-51);
stroke (#D0D13D);
strokeWeight (10);
rect (mouseX/65+60, 80, 290, 295);

//contorno ojos 
fill (#FFFFFF);
stroke (mouseX+#000000);
strokeWeight (3);

//ojos
ellipse (mouseX/155+150, 190, 100, 100);
ellipse (mouseX/255+250 , 190, 100, 100); 

//relleno de ojos 
fill (mouseX+10, 160, 198);
stroke (#000000);
strokeWeight (3);
ellipse (170, 190, 45, 45);
ellipse (240, 190, 45, 45);

//pupila de ojos 
fill (mouseX-255, 0, 0);
noStroke ();
ellipse (170, 190, mouseX/15, mouseY/15);
ellipse (240, 190, mouseX/15, mouseY/15);

//nariz
fill (255, 255, mouseX-51);
stroke (161, 179, 13);
strokeWeight (3);
arc (mouseX/200+195, 230, 40, 45, 2.01 , 3.05 * PI / 1.32);

//boca
noFill ();
stroke (#000000);
strokeWeight (3);
arc (mouseX/200+195, 250, 215, 110, 19.01, 21.80);

//comisuras boca
stroke (#000000);
strokeWeight (3);
line (mouseX/87+82, 259, 102, 259);
line (mouseX/297+292, 259, 312, 259);

//mejillas sonrisa
noFill ();
stroke (255, 0, 0);
strokeWeight (3);
arc (mouseX/310+305, 255, 40, 35, 2.85 , 3.05 * PI / 1.32);
arc (mouseX/100+95, 255, 40, 35, 2.01 , 3.05 * PI / 1.42);
fill (255, 0, 0);
ellipse (mouseX/90+85, 250, 5, 4);
ellipse (mouseX/110+105, 250, 5, 4);
ellipse (mouseX/100+95, 253, 5, 4);
ellipse (mouseX/300+295, 250, 5, 4);
ellipse (mouseX/320+315, 250, 5, 4);
ellipse (mouseX/310+305, 253, 5, 4);

//agujeros de la esponja
fill (161, 179, 13);
noStroke ();
ellipse (mouseX/100+95, 120, 23, 42); 
ellipse (mouseX/320+315, 130, 18, 27); 
ellipse (mouseX/90+85, 160, 13, 22); 
ellipse (mouseX/125+120, 340, 23, 42);
ellipse (mouseX/100+95, 310, 13, 22);
ellipse (mouseX/320+315, 310, 23, 42);
ellipse (mouseX/320+315, 350, 13, 22);

//dientes
fill (#FFFFFF);
stroke (#000000);
strokeWeight (2);
rect (mouseX/165+160, 305, 30, 20);
rect (mouseX/205+200, 305, 30, 20);

//camiseta
fill (#FFFFFF);
stroke (#000000);
strokeWeight (3);
rect (mouseX/65+60, 375, 290, 30);

//giros camiseta
fill (#FFFFFF);
stroke (#000000);
strokeWeight (3);
triangle (mouseX/140+135, 375, mouseX/190+185, 375, mouseX/165+160, 395);
triangle (mouseX/210+205, 375, mouseX/260+255, 375, mouseX/235+230, 395);

//pantalon
fill (222, 147, 41);
stroke (#000000);
strokeWeight (3);
rect (mouseX/65+60, 405, 290, 40);
fill (#000000);
noStroke ();
rect (mouseX/85+80, 410, 25, 10);
rect (mouseX/145+140, 410, 25, 10);
rect (mouseX/250+245, 410, 25, 10);
rect (mouseX/310+305, 410, 25, 10);

//corbata 
fill (255, 0, 0 );
noStroke();
rect (mouseX/188+182, 377, 24, 40);
triangle (mouseX/188+182, 417, mouseX/212+206, 414, mouseX/200+194, 432);

//barbilla
noFill ();
stroke (249, 155, 204);
strokeWeight (3);
arc (mouseX/179+174, 315, 60, 65, 0.81 , 2.55);
arc (mouseX/225+220, 318, 60, 65, 0.61 , 2.55);

//muslos 
fill (222, 147, 41);
stroke (#000000);
strokeWeight (2);
rect (mouseX/130+125, 445, 50, 20);
rect (mouseX/240+235, 445, 50, 20);

//pierna izquierda
fill (255, 255, mouseX-51);
stroke (#000000);
strokeWeight (2);
rect (mouseX/145+140, 465, 20, 50);
fill (#FFFFFF);
stroke (#000000);
strokeWeight (2);
rect (mouseX/145+140, 515, 20, 40);
fill (#000000);
stroke (#000000);
rect (mouseX/145+140, 510, 20, 10);
fill (255, 0, 0); 
stroke (#000000);
strokeWeight (1);
rect(mouseX/145+140, 538,20, 7);
fill (0, 160, 198);
stroke (#000000);
strokeWeight (1);
rect (mouseX/145+140, 524,20, 10);

//zapatos pierna izquierda
fill (#000000);
stroke (#000000);
ellipse (mouseX/155+150, 565, 30, 30);
ellipse (mouseX/125+120, 565, 50, 35);

//pierna derecha
fill (255, 255, mouseX-51);
stroke (#000000);
strokeWeight (2);
rect (mouseX/255+250, 465, 20, 50);
fill (#FFFFFF);
stroke (#000000);
strokeWeight (2);
rect (mouseX/255+250, 515, 20, 40);
fill (#000000);
stroke (#000000);
rect (mouseX/255+250, 510, 20, 10);
fill (255, 0, 0); 
stroke (#000000);
strokeWeight (1);
rect(mouseX/255+250,538,20, 7);
fill (0, 160, 198);
stroke (#000000);
strokeWeight (1);
rect (mouseX/255+250, 524,20, 10);

//zapatos pierna derecha
fill (#000000);
stroke (#000000);
ellipse (mouseX/265+260, 565, 30, 30);
ellipse (mouseX/295+290, 565, 50, 35);

//brazos izquierdo
fill (#FFFFFF);
stroke (#000000);
strokeWeight (3);
rect (mouseX/40+35, 360, 25, 50);
fill (255, 255, mouseX-51);
stroke (#000000);
strokeWeight (3);
rect (mouseX/45+40, 410, 20, 50);

//mano izquierda
fill (255, 255, mouseX-51);
stroke (#000000);
strokeWeight (3);
ellipse (mouseX/55+50,480, 30, 50);
ellipse (mouseX/45+40, 485, 10, 30);
ellipse (mouseX/52+47, 488, 10, 30);
ellipse (mouseX/59+54, 488, 10, 30);
ellipse (mouseX/66+61, 485, 8,30);

//brazos derecho
fill (#FFFFFF);
stroke (#000000);
strokeWeight (3);
rect (mouseX/355+350, 360, 25, 50);
fill (255, 255, mouseX-51);
stroke (#000000);
strokeWeight (3);
rect (mouseX/355+350, 410, 20, 50);

//mano derecha
fill (255, 255, mouseX-51);
stroke (#000000);
strokeWeight (3);
ellipse (mouseX/365+360,480, 30, 50);
ellipse (mouseX/355+350, 485, 10, 30);
ellipse (mouseX/362+357, 488, 10, 30);
ellipse (mouseX/369+364, 488, 10, 30);
ellipse (mouseX/376+371, 485, 8,30);

//burbujas de agua 
fill (#7CB8E8);
stroke (#479EE3);
strokeWeight (2);

  //burbuja alpha 
  pos1 = (pos1+599) %600;
  anch1 = (anch1+5) %50;
  altu1 = (altu1+5) %60;
  ellipse (450, pos1, anch1, altu1);
  //burbuja beta
  pos2 = (pos2+599.2)%600;
  anch2 = (anch2+4) %55;
  altu2 = (altu2+3) %65;
  ellipse (500, pos2, anch2, altu2);
  //burbuja gamma 
  pos3 = (pos3+599.3) %600;
  anch3 = (anch3+4) %50;
  altu3 = (altu3+3.5) %50;
  ellipse (410, pos3, anch3, altu3);
  //burbuja omega
  pos4 = (pos4+599.4) %600;
  anch4 = (anch4+2) %50;
  altu4 = (altu2-4) %60;
  ellipse (540, pos4, anch4, altu4);
  
  //punto 
  fill (#F091A4);
  noStroke ();
  ellipse ( mouseX-10, mouseY-10, 15, 15 );
  
  //texto
  fill (#FFFFFF);
  text ("Instrucciones de uso, presionar -q-", 5, 5, 600, 600);
  
  if (key == 'q'){
  fill (#FFFFFF);
   text ("Bob Dopado y bailaor = mover cursor. Quitar instruc = Cualquier tecla (-q). Fondo Lila = p. Fondo Verde= g. Fondo Gris = mantener click. Color original= click", 30,20, 600,600);
}
}
void mousePressed (){
  fondo = (#484848);
  }
  
void mouseReleased (){
  fondo = (#5AB6CE);
  }
void keyPressed () {
  if (key == 'r'){
    fondo = (#FF98D9);
  }
  
  if (key == 'p'){
    fondo = (#AA3780);
  }
  if (key == 'g'){
    fondo = (#5BFF50);
  }
}


