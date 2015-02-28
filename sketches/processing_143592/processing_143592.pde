
void setup(){
size(500,500);
}

void draw(){
Fondo();
Mouse();
}

void Fondo(){
background(255);
}

void Mouse(){

//Cuerpo
fill(98,189,164);strokeWeight(2);rect(mouseX-87.5,mouseY-125,175,250,20);

//Pantalla
fill(222,255,238);rect(mouseX-67.5,mouseY-105,135,110,15);
noFill();arc(mouseX-25,mouseY-70,10,10,0,PI);arc(mouseX+25,mouseY-70,10,10,0,PI);arc(mouseX,mouseY-60,50,50,+HALF_PI-QUARTER_PI,+HALF_PI+QUARTER_PI);

//Ranura
fill(16,41,41);rect(mouseX-55,mouseY+17.5,55,8);

//Conector
fill(8,24,107);ellipse(mouseX+45,mouseY+21.5,8,8);

//Cruz
fill(254,237,32);strokeWeight(2);rect(mouseX-55,mouseY+55,20,6);rect(mouseX-48,mouseY+48,6,20);
noStroke();rect(mouseX-53.5,mouseY+56.5,18,4);

//BotonDoble
fill(8,24,107);stroke(0);strokeWeight(1);rect(mouseX-60,mouseY+97.5,15,4,2);rect(mouseX-40,mouseY+97.5,15,4,2);

//Triangulo
fill(0,222,255);strokeWeight(2);triangle(mouseX+12.5,mouseY+58,mouseX+32.5,mouseY+58,mouseX+22.5,mouseY+42);

//CirculoVerde
fill(0,255,57);strokeWeight(2);ellipse(mouseX+55,mouseY+61,15,15);

//CirculoRojo
fill(255,0,0);ellipse(mouseX+33.75,mouseY+85,25,25);

//BrazoDerecho
fill(98,172,180);rect(mouseX+87.5,mouseY+58,50,20,0,0,20,0);rect(mouseX+117.5,mouseY-10,20,68,5,5,0,0);
noStroke();rect(mouseX+119,mouseY+30,17,38);
stroke(0);line(mouseX+(367.5+20/3-250),mouseY-9,mouseX+(367.5+20/3-250),mouseY-2);line(mouseX+(367.5+40/3-250),mouseY-9,mouseX+(367.5+40/3-250),mouseY-2);

//BrazoIzquierdo
fill(98,172,180);rect(mouseX-137.5,mouseY+58,50,20,20,0,0,0);rect(mouseX-137.5,mouseY+78,20,68,0,0,5,5);
noStroke();rect(mouseX-136,mouseY+70,17,38);
stroke(0);line(mouseX-(250-112.5-20/3),mouseY+138,mouseX-(250-112.5-20/3),mouseY+145);line(mouseX-(250-112.5-40/3),mouseY+138,mouseX-(250-112.5-40/3),mouseY+145);

//PieDerecho
rect(mouseX-45,mouseY+125,20,90,0,0,10,10);

//PieIzquierdo
rect(mouseX+25,mouseY+125,20,90,0,0,10,10);

noCursor();
}


