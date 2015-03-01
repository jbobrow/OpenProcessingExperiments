
size(400,500);
//strokeWeight(7);
noFill();
background(255,255,255);
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
triangle(100,110,100,90,175,135);
triangle(290,110,290,90,215,135);
//punto de las pupilas
strokeWeight(8);
point(148,148);
point(242,148);
strokeWeight(5);
point(321,250);
point(70,250);
strokeWeight(2);
point(206,115);
point(184,115);
point(206,100);
point(184,100);
point(206,85);
point(184,85);


