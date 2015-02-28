
void setup(){
  size (500,600);
  background(#4c2d28);
  smooth();
  
  
  
}


void draw(){
  
  

  fill(#2063b2);
  
  noStroke();
rect(10,10,480,580);

stroke(1);
strokeWeight(3);

//fill(#da1334);
//beginShape();
//vertex(30, 20);
//bezierVertex(80, 0, 80, 75, 30, 75);
//bezierVertex(50, 80, 60, 25, 30, 20);
//endShape();

//grande bola abajo
fill(#E31212); //rojo
ellipse(100,500, 150,100);
fill(#8ce53f); //verde 
ellipse(100,500, 130,80);
fill(#E39E12); //amarillo
ellipse(100,500, 100,60);
fill(0); //negro
ellipse(100,500, 10,10);
//fin grande bola abajo

fill(#E31212); //esfera roja grande
ellipse(200,150, 60,60);

noFill(); //Palo Grande
beginShape();
curveVertex(600,  600);//Hacia a donde apunta el segundo punto
curveVertex(100,  500);//primer punto
curveVertex(200,  150);//segundo punto
curveVertex(600,  0);//Hacia donde se dirige el primer punto
endShape();

fill(#E39E12); //esfera amarilla chica encima de la roja
ellipse(200,150, 30,30);

fill(#030303); //esfera en la primera linea
ellipse(52,220, 40,40);

noFill(); //palo mediano
beginShape();
curveVertex(100, 310);
curveVertex(77,  400);
curveVertex(50,  200);
curveVertex(50,  200);
//curveVertex(400,  200);
endShape();

fill(#E39E12);
ellipse(105,160, 40,40);

noFill(); //palo chico
beginShape();
curveVertex(0, 310);
curveVertex(100,  310);
curveVertex(120,  150);
curveVertex(400,  200);
endShape();
fill(#E39E12);
ellipse(100,225, 25,25);


line (200,420,200,500); //perrito
fill(#E39E12);
ellipse(200,420, 110,80);
noFill();
bezier(200,500,350,500,350,400,300,450); //perrito
fill(0);
line (200,500,175,550);
ellipse(175,550, 10,10);
line (200,500,225,550);
ellipse(225,550, 10,10);
line (280,488,255,550);
ellipse(255,550, 10,10);
line (280,488,305,550);
ellipse(305,550, 10,10);
noFill();
bezier(170,420,170,470,230,380,230,420);
fill(0);
ellipse(170,420, 10,10);
ellipse(230,420, 10,10);
noFill();
//bigotes
bezier(280,420,265,430,260,420,255,420);
bezier(276,410,280,410,260,420,253,410);
//fin de perrito


//flor derecha
fill(#E39E12);
ellipse(375,80, 100,100);
fill(#E31212);
ellipse(375,80, 80,80);

fill(0);
ellipse(310,190, 90,90);
fill(#E31212);
ellipse(310,190, 50,50);

fill(#5FDE2B);
ellipse(310,300, 100,70);
fill(#287109);
ellipse(310,300, 50,50);

fill(#5FDE2B);
ellipse(400,400, 120,120);
fill(#E31212);
ellipse(400,400, 120, 60);

noFill();
bezier(400,50,265,200,260,300,440,420);

//pesitas
fill(0);
line(200,350,190,300);
ellipse(200,350, 25,25);
ellipse(190,300, 25,25);

fill(0);
line(450,300,400,225);
ellipse(450,300, 25,25);
ellipse(400,225, 25,25);

fill(0);
line(30,170,50,120);
ellipse(30,170, 10,10);
ellipse(50,120, 25,25);

//estrellitas
line(220,280,220,200);
line(190,270,250,210);

line(250,270,190,210);

line(180,240,260,240);




//ojo

noFill();
fill(0);
bezier(30,75,150,0,150,0,300,75);
bezier(30,75,150,130,150,130,300,75);
fill(#5FDE2B);
bezier(50,75,150,30,150,30,280,75);
bezier(50,75,150,120,150,120,280,75);
fill(#E39E12);
ellipse(160,75, 68,68);
fill(#E31212);
ellipse(160,75, 40,40);

//circulos encimados
fill(#E31212);
ellipse(405,500, 50,50);
fill(#8ce53f); //verde
ellipse(360,550, 40,40);

fill(#E39E12);
ellipse(400,530, 100,60);

fill(0); //negro
ellipse(450,550, 60,60);
fill(#8ce53f,80); //verde
ellipse(360,550, 40,40);
fill(#E31212,80); //rojo
ellipse(405,500, 50,50);

}




