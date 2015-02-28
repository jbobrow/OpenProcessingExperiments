
int a;
int b;

int c;
int d;
int e;
int f;
int g;
int h;

c=(a+a/3);
d=b;
e=(a+a/2.7);
f=(b+b/40);
g=(a+a/2.3);
h=b;


size(800,600);
a=(width/2);
b=(height/2);


background(250,167,200);

//Pestañas
strokeWeight (6);
line(a+a/3,b,a+a/2.7,b+b/40);
line(a+a/2.7,b+b/40,a+a/2.3,b);

line(a-a/3,b,a-a/2.7,b+b/40);
line(a-a/2.7,b+b/40,a-a/2.3,b);

line(a-a/3,b-b/10,a-a/2.7,b+b/40-b/10);
line(a-a/2.7,b+b/40-b/10,a-a/2.3,0.9*b);

line(a-a/3,b-b/5,a-a/2.7,b+b/40-b/5);
line(a-a/2.7,b+b/40-b/5,a-a/2.3,b-b/5);

line(a+a/3,b-b/5,a+a/2.7,b+b/40-b/5);
line(a+a/2.7,b+b/40-b/5,a+a/2.3,b-b/5);

line(a+a/3,b-b/10,a+a/2.7,b+b/40-b/10);
line(a+a/2.7,b+b/40-b/10,a+a/2.3,b-b/10);




//Barbilla
fill(250,167,200);
stroke (0,0,0);
strokeWeight (6);
arc(a,b+b/1.5, a/4, b/2,0.2*PI,0.8*PI);

//Ceja Izquierda
strokeWeight (8);
arc(a-a/5,b-b/2.2, a/5, height/6,0.96*PI,2*PI);

//Ojo Izquierdo
strokeWeight (8);
arc(a-a/5,b, width/7, height/3,0.96*PI,2*PI);

//Ceja Derecha
strokeWeight (8);
arc(a+a/5,b-b/2.2, width/10, height/6,0.96*PI,2*PI);

//Ojo Derecho
strokeWeight (8);
arc(a+a/5,b, width/7, height/3,PI,2.04*PI);



//Dibujamos la de la Elipse boca
fill (0,0,0);
ellipse(width/2,height-height/4,width/10,height/3);

//Dibujamos el arco de la elipse de la lengua
stroke (255,30,30);
fill (255,30,30);
arc(a,b+(height/3.05), width/17, height/6,0,PI);

//Redondeo superior de la lengua
stroke (255,30,30);
ellipse(a,b+(height/3.05),width/17,height/25);

//Mueca inferior
ellipse(a,b+(height/3.05),width/17,height/25);

//Mueca superior
stroke (255,255,255);
fill (255,255,255);
arc(a,b+(b/2.8), width/18, height/6,PI,2*PI);

//Redondeo inferior de los dientes en blanco
ellipse(a,b+(b/2.8),width/18,height/75);







