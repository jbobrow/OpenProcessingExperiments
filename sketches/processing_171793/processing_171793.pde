

void setup(){
  size(400, 500);
}
void draw()
{
  background(#3F3F3F);
  line(mouseX, 20, mouseX, 40);
  background(#3F3F3F);
  line(20, mouseY, 40, mouseY);

//strokeWeight(7);
noFill();
background(255,255,255);
//cuernos y aureola
if (mouseY > 0 && mouseY <47 ) {
  fill(#FFFAB6);
  ellipse(198,22,230,35);
  noFill();
  ellipse(198,22,200,20);
}
if (mouseY > 373 ) {

  line(266,65,268,46);
  line(268,46,236,4);
  line(236,4,310,46);
  line(310,46,281,76);

  line(127,65,127,46);
  line(127,46,159,4);
  line(159,4,85,46);
  line(85,46,110,76);

}
if (mouseY > 358 ) {

  stroke(#DA1A1A);
  line(106,144,109,144);
line(109,144,112,140);
line(109,144,112,146);

}
if (mouseY > 370) {
stroke(#DA1A1A);
line(163,152,160,148);
line(160,148,157,145);
line(160,148,156,150);
stroke(0);
}
if (mouseY > 380 ) {
 stroke(#DA1A1A);
line(120,153,124,150);
line(124,150,129,147);
line(124,150,130,152);
line(124,136,128,138);
line(128,138,130,136);
line(128,138,130,140);
stroke(0);
}
if (mouseY > 358 ) {
  stroke(#DA1A1A);
  line(215,145,222,145);
line(222,145,226,140);
line(222,145,226,150);
stroke(0);
}
if (mouseY > 370) {
 stroke(#DA1A1A);
line(278,139,270,139);
line(270,139,265,136);
line(270,139,265,142);
stroke(0);
}
if (mouseY > 380 ) {
 stroke(#DA1A1A);
line(267,154,262,150);
line(262,150,258,147);
line(262,150,258,153);
stroke(0);
}

println(mouseX,mouseY);

//orejas
arc(316,186,28,80,0,HALF_PI);
arc(74,186,28,80,HALF_PI, PI);
line(321,221,321,250);//pendiente izquierdo
line(70,221,70,250);//pendiente derecho

//primer ojo
arc(140,145,70,20,0,PI);
arc(140,145,70,20,PI,TWO_PI);
//segundo ojo
arc(250,145,70,20,0,PI);
arc(250,145,70,20,PI,TWO_PI);
//pupila de los ojos
ellipse(145,145,20,20);
ellipse(245,145,20,20);
//labios: parte superior e inferior
arc(195,250,180,60,0,PI);
arc(195,250,180,150,0,PI);
//dientes
arc(196,270,173,60,0,PI);
line(196,280,196,325);//linea del medio
line(226,278,226,320);//segunda linea derecha
line(166,278,166,320);//segunda linea izquierda
line(256,272,256,305);//tercera linea derecha
line(136,272,136,305);//cuarta liena izquierda
//primera y segunda bolsa del ojo
arc(135,150,90,70,0,HALF_PI);
arc(255,150,90,70,HALF_PI, PI);
//tabique de la nariz
arc(180,160,10,160,0,HALF_PI);
arc(210,160,10,160,HALF_PI, PI);
//ceño de la nariz
line(187,145,191,160);
line(205,145,200,160);
arc(196,145,10,15,0,PI);
//fosas nasales
ellipse(175,252,35,15);
ellipse(215,252,35,15);
arc(175,258,10,10,PI,TWO_PI);
arc(214,258,10,10,PI,TWO_PI);
//cabeza: parte superior
arc(195,185,270,280,PI,TWO_PI);
//pomulos: derecha e izquierda
line(60,185,90,275);
line(330,185,300,275);
//barbilla
arc(195,275,210,200,0,PI);
arc(195,345,70,20,PI,TWO_PI);
fill(0,0,0);
triangle(180,360,210,360,195,395);//perilla
//cejas: izquierda y derecha 
triangle(100,110,100,90,175,mouseY/10+90);
triangle(290,110,290,90,215,mouseY/10+90);
//punto de las pupilas
strokeWeight(mouseY/35);
point(148,148);
point(242,148);
strokeWeight(4);
point(321,250);
point(70,250);
strokeWeight(2);
point(206,115);
point(184,115);
point(206,100);
point(184,100);
point(206,85);
point(184,85);
}


