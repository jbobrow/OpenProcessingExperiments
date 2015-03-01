
int value = 255;
void setup() {
size(500,500);
}


void draw()
{ 
println (mouseX + " " + mouseY);
background(0);


noStroke();
//CABEZA EXTERIOR
fill(255,0,0);
//ellipse(250,180,180,250);
arc(250,160,170,230,PI,TWO_PI);

//oreja izquierda
rect(155,160,20,50);
triangle(155,160,170,150,170,160);
triangle(155,210,182,235,182,210);

//oreja derecha
rect(325,160,20,50);
triangle(345,160,330,150,330,160);
triangle(345,210,318,235,318,210);

//barbilla
rect(182,225,136,25);
rect(210,250,80,45);
triangle(182,250,210,295,210,250);
triangle(290,250,290,295,318,250);

//---------------------------------
rect(175,160,153,65);
fill(255, 223, 21);
//(para tapar posibles agujeros)
rect(210,150,80,102);
triangle(170,200,250,200,250,280);
triangle(250,200,250,280,330,200);


//izquierda
triangle(170,200,220,250,220,280);
triangle(170,200,210,230,220,255);
triangle(170,200,190,150,280,255);
triangle(185,100,185,210,250,210);

//derecha
triangle(280,250,280,280,330,200);
triangle(330,200,290,230,280,250);
triangle(220,250,309,150,330,200);
triangle(315,100,315,210,250,210);

//----------------------------
//BOCA
rect(220,250,60,30);

//--------------------------------
//RELLENO: parte cejas y frente
rect(190,150,120,20);
triangle(210,90,240,152,185,105);
triangle(186,105,190,150,240,150);
triangle(290,90,315,105,260,150);
triangle(310,103,309,150,260,150);


//---------------------------------
//DETALLES
strokeWeight(3);
stroke(255,0,0);


//parte izquierda
line(185,100,190,150);
line(190,150,190,170);

//parte derecha
line(315,100,309,150);
line(309,150,309,170);

//ceja dos ojos
line(190,170,309,170);

//ojo izquierdo
line(190,170,200,185);
line(200,185,230,185);
line(230,185,240,170);

//ojo derecho
line(260,170,270,185);
line(270,185,304,185);
line(304,185,309,170);

//boca 
line(220,250,280,250);

//mandibula izquierda
line(170,200,210,230);
line(210,230,220,250);
fill(255,0,0);

//mandibula derecha
line(330,200,290,230);
line(290,230,280,250);

//inferior izq inferior derch
strokeWeight(1);
triangle(210,270,220,250,220,280);
triangle(280,250,280,280,290,270);

//-------------------------------------
//OJOS
fill(255,255,255);

noStroke();
//ojo izquierdo
triangle(190,170,200,185,240,170);
triangle(240,170,230,185,200,185);
//ojo derecho
triangle(260,170,270,185,309,170);
triangle(270,185,304,185,309,170);


//----------------------------------
//CORAZON ENERGETICO
noStroke();
//strokeWeight(3);
//stroke(0,0,0);
fill(0, 255, 255);
ellipse(250,380,100,100);
fill(255,255,255);
ellipse(250,380,90,90);


fill(0, 255, 255);
ellipse(250,380,60,60);
fill(255,255,255);
ellipse(250,380,50,50);

strokeWeight(2);
noFill();
stroke(0, 255, 255);
ellipse(250,380,120,120);
ellipse(250,380,130,130);
ellipse(250,380,150,150);

noStroke();
strokeWeight(3);
fill(0, 255, 255);
ellipse(250,380,100,100);
fill(255,255,255);
ellipse(250,380,90,90);


fill(0, 255, 255);
ellipse(250,380,60,60);
fill(255,255,255);
ellipse(250,380,50,50);

//elipses moviles
strokeWeight(2);
noFill();
stroke(0, 255, 255);
ellipse(250,380,mouseX-20,mouseX-20);
ellipse(250,380,mouseY-40,mouseX-40);
ellipse(250,380,mouseX-60,mouseY-60);
ellipse(250,380,mouseY-80,mouseX-80);
ellipse(250,380,mouseX-100,mouseY-100);
ellipse(250,380,mouseY-120,mouseX-120);
ellipse(250,380,mouseX-140,mouseY-140);
ellipse(250,380,mouseY-180,mouseX-180);
ellipse(250,380,mouseX-200,mouseY-200);
ellipse(250,380,mouseX-220,mouseX-220);

//elipses laterales
fill(0, 255, 255);
ellipse(100,100,random(50,80),random(50,80));
ellipse(400,100,random(50,80),random(50,80));
fill(255);
ellipse(100,100,random(30,40),random(30,40));
ellipse(400,100,random(30,40),random(30,40));
fill(0);
ellipse(100,100,10,10);
ellipse(400,100,10,10);


}




