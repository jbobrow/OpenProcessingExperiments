
//FET PER ADRIÀ SÁNCHEZ GALLEGO 1ºDAM
//CARA DE SR.PATATA(TOY STORY)
int fondo=#00ffff;
void setup(){
size(300,300);
smooth();
}
void draw(){
 
background(#00ffff);
//arco+linea
//barret
fill(0);
arc(150,55,80,60,3.14,6.28);
 
ellipse(150,60,130,20);
//redondas
//cara
fill(fondo);
stroke(fondo);
ellipse(150,150,160,190);

fill(0);
ellipse(150,60,80,20);
//ojos
//ojo izquierdo
fill(255,255,255);
ellipse(125,100,40,mouseX/5);
fill(0);
ellipse(125,100,15,mouseX/15);
//ellipse(100,70,50,20);
//ojo derecho
fill(255,255,255);
ellipse(175,100,40,40);
fill(0);
ellipse(175,100,15,15);

//orejas
//oreja izaquierda+oreja derecha
fill(255,192,203);
arc(82,105,30,30,2.1,5.2);
arc(221,105,30,30,4.2,7.4);

//bigote
fill(0);
ellipse(150,180,100,20);

  //nariz
fill(255,112,40);
ellipse(150,150,50,50);
//arcos
//boca
fill(255,255,255);
arc(150,190,100,mouseY/3,6.2,9.5);

//pies
fill(0,0,250);
ellipse(115,250,60,20);
ellipse(180,250,60,20);
//rect(mouseX-5,mouseY-5,10,10);
}

void mousePressed(){
fondo=#00ffff;
}
void mouseReleased(){
  fondo=#c86400;
}




