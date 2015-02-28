
//*** Al hacer mousePressed se cambia el tamaño y la posición de algunas
// nubes y el color de las llamas de las zapatillas.
// Además, la capa cambia de color según la posición en la que
// se encuentre.***

// El siguiente personaje se llama Amante Guisante y es el protagonista
// del videoclip -Te hiero mucho (Historia del amante guisante)-
// del grupo catalán Love of Lesbian.

// ***Se ha tomado como referencia centro el centro de la ellipse
// que forma el cuerpo del personaje.***

PFont font;
int posX, posY, velX, velY;
int value = (#FFAF2E); // Para el color de las llamas
int opacity = 120; // Para la opacidad del color de las llamas
int valor = 180; // Para la posición de algunas nubes
int X = 100; // Para el cambio de tamaño de algunas nubes


void setup(){
  size(1000,600);
  
  posX = width/2;
  posY = height/2;
  velX = 1;
  velY = 1;
  
  noCursor();
textFont(createFont("BrainFlower",32,true));
  
}

void draw(){
background(210,244,253);
fill(0);
text("...y en su capa había escrito un 'te amo' en luces de neón.",400,550);


posX = posX+velX;
posY = posY+velY;


noStroke();
fill(255,120);
ellipse(valor,400,140,X); // Nube 1
ellipse(valor,430,X,50);
ellipse(160,360,50,30);
ellipse(160,410,X,50);
ellipse(340,20,120,80); //Nube 2
ellipse(valor,20,80,40);
ellipse(320,50,80,40);
ellipse(valor+400,490,120,80); // Nube 3
ellipse(700,480,80,40);
ellipse(740,500,X,30);
ellipse(860,90,X,60); // Nube 4
ellipse(860,valor,160,90);
ellipse(920,140,X,40);
ellipse(540,valor,70,35);
ellipse(500,valor,40,25);

noStroke();
fill(21,139,55);
ellipse(posX+140,posY-40,160,130); // Cabeza
ellipse(posX,posY,240,130); // Cuerpo

rect(posX+100,posY,140,15); // Brazo izq
ellipse(posX+240,posY+7.5,25,20); // Mano izq
ellipse(posX+237.5,posY-2.5,5,10); // Dedo izq
rect(posX+60,posY+30,140,15); // Brazo der
ellipse(posX+200,posY+37.5,25,20); // Mano der
ellipse(posX+197.5,posY+27.5,5,10); // Dedo der

noStroke();
fill(21,139,55);
rect(posX-160,posY+10,130,15); // Pierna izq

noStroke();
fill(value,opacity);
triangle(posX-170, posY+10, posX-170, posY+25, posY-180, posY+17.5); // Triangulos llamas izq
triangle(posX-170, posY+22.5, posX-170, posY+35, posY-180, posY+27.5);
triangle(posX-170, posY+32.5, posX-170, posY+45, posY-180, posY+37.5);
triangle(posX-170, posY+42.5, posX-170, posY+55, posY-180, posY+47.5);
triangle(posX-170, posY+42.5, posX-170, posY+65, posY-180, posY+57.5);


strokeWeight(1.5);
stroke(0,180);
fill(255);
rect(posX-190,posY+10,30,30); // Zapato izq
arc(posX-175,posY+35, 30, 60, 0, PI);
strokeWeight(4);
stroke(0,150);
line(posX-189,posY+20,posX-170,posY+20);
line(posX-189,posY+27,posX-170,posY+27);
line(posX-189,posY+34,posX-170,posY+34);
noStroke();
fill(21,139,55);
rect(posX-190,posY+35,130,15); // Pierna der

noStroke();
fill(value,opacity);
triangle(posX-200, posY+35, posX-200, posY+50, posY-210, posY+42.5); // Triangulos llamas der
triangle(posX-200, posY+42.5, posX-200, posY+60, posY-210, posY+52.5);
triangle(posX-200, posY+52.5, posX-200, posY+70, posY-210, posY+62.5);
triangle(posX-200, posY+62.5, posX-200, posY+80, posY-210, posY+72.5);
triangle(posX-200, posY+72.5, posX-200, posY+90, posY-210, posY+82.5);

strokeWeight(1.5);
stroke(0,180);
fill(255);
rect(posX-220,posY+35,30,30); // Zapato der
arc(posX-205,posY+60, 30, 60, 0, PI);
strokeWeight(4);
stroke(0,150);
line(posX-219,posY+45,posX-200,posY+45);
line(posX-219,posY+52,posX-200,posY+52);
line(posX-219,posY+59,posX-200,posY+59);


noStroke();
fill(posX,0,posY); // Para cambio de color según la posición
rect(posX-40,posY-80,110,50,10); // Capa
rect(posX-140,posY-70,140,70,10);
rect(posX-280,posY-55,200,70,10);
rect(posX-20,posY-55,50,40,10);
rect(posX-100,posY-25,70,40,10);
rect(posX-300,posY-15,180,30,10);
rect(posX-310,posY+10,130,15,10);

noStroke();
fill(93,70,12);
arc(posX+140,posY-85, 160, 120, -PI, 0); // Casco
rect(posX+60,posY-85,160,25);
rect(posX+60,posY-80,20,100,50); // Patillas Casco
rect(posX+210,posY-80,10,100,50);
rect(posX+60,posY-40,140,15); // Junta gafas


stroke(93,70,12);
strokeWeight(6);
fill(255);
ellipse(posX+130,posY-30,60,40); // Ojo izquierda
ellipse(posX+210,posY-30,60,40); // Ojo derecha


noStroke();
fill(0);
ellipse(posX+115,posY+5,20,10); // Boca
ellipse(posX+145,posY-30,7,7); // Pupila izquierda
ellipse(posX+225,posY-30,7,7); // Pupila derecha


fill(255);
font = createFont("FineAgain",42);
textFont(font);
text("T E  A M O",posX-240,posY-5);


  if((posX<0)||(posX>width)){
    velX = -velX;
  } 

  if((posY<0)||(posY>height)){
    velY = -velY;
}
}

void mousePressed() {
  if (value == #FFAF2E) { // Para el cambio de color de las llamas
    value = #F0D802;
  } else {
    value = #FFAF2E;
  }
   if (valor == 180) { // Para el cambio de posición de algunas nubes
    valor = 260;
  } else {
    valor = 180;
  }
   if (X == 100) { // Para el cambio de tamaño de algunas nubes
    X = 140;
  } else {
    X = 100;
  }
}




