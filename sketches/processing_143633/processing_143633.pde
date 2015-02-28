
int a;
int b;
int posx, posy;

void setup() {

size(800,600);
posx=0;
posy=height/2;
}

void draw() {
background(250,166+(mouseX/10),200+mouseY/10);
stroke (1,1,1);
//Pestañas
strokeWeight (6);

//Barbilla
fill(250,166+(mouseX/10),200+mouseY/10);
arc(mouseX,mouseY +200,100, 150,0.2*PI,0.8*PI);

//Ceja Izquierda
arc(mouseX-400/5,mouseY-300/2.2, 400/5, 100,0.96*PI,2*PI);

//Ojo Izquierdo
arc(mouseX-400/5,mouseY, 114.2, 200,0.96*PI,2*PI);

//Ceja Derecha
arc(mouseX+400/5,mouseY-300/2.2, 400/5, 100,0.96*PI,2*PI);

//Ojo Derecho
arc(mouseX+400/5,mouseY, 114.2, 200,0.96*PI,2*PI);


//Dibujamos la de la Elipse boca
fill (0,0,0);
ellipse(mouseX,mouseY+150,80,200);

//Dibujamos el arco de la elipse de la lengua
stroke (255,30,30);
fill (255,30,30);
arc(mouseX,mouseY+196, 48, 100,0,PI);

//Redondeo superior de la lengua
ellipse(mouseX,mouseY+196,47,24);

//Mueca inferior
ellipse(mouseX,mouseY+196,47,24);

//Mueca superior
stroke (255,255,255);
fill (255,255,255);
arc(mouseX,mouseY+107,44.5, 100,PI,2*PI);

//Redondeo inferior de los dientes en blanco
ellipse(mouseX,mouseY+107,44.4,8);

posx=   posx+1;
}



