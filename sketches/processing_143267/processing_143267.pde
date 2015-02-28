
// El siguiente personaje se llama Amante Guisante y es el protagonista
// del videoclip -Te hiero mucho (Historia del amante guisante)-
// del grupo catalán Love of Lesbian.

// ***Se ha tomado como referencia centro el centro de la ellipse
// que forma el cuerpo del personaje.***

PFont font;

void setup(){
  size(1000,600);
  noCursor();
textFont(createFont("BrainFlower",32,true));
}

void draw(){
background(210,244,253);
fill(0);
text("...y en su capa había escrito un 'te amo' en luces de neón.",400,550);

noStroke();
fill(255,120);
ellipse(200,400,140,90); // Nube 1
ellipse(230,430,80,50);
ellipse(160,360,50,30);
ellipse(160,410,100,50);
ellipse(340,20,120,80); //Nube 2
ellipse(280,20,80,40);
ellipse(320,50,80,40);
ellipse(760,490,120,80); // Nube 3
ellipse(700,480,80,40);
ellipse(740,500,70,30);
ellipse(860,90,100,60); // Nube 4
ellipse(860,120,160,90);
ellipse(920,140,80,40);
ellipse(540,280,70,35);
ellipse(500,270,40,25);


noStroke();
fill(21,139,55);
ellipse(mouseX+140,mouseY-40,160,130); // Cabeza
ellipse(mouseX,mouseY,240,130); // Cuerpo

rect(mouseX+100,mouseY,140,15); // Brazo izq
ellipse(mouseX+240,mouseY+7.5,25,20); // Mano izq
ellipse(mouseX+237.5,mouseY-2.5,5,10); // Dedo izq
rect(mouseX+60,mouseY+30,140,15); // Brazo der
ellipse(mouseX+200,mouseY+37.5,25,20); // Mano der
ellipse(mouseX+197.5,mouseY+27.5,5,10); // Dedo der

noStroke();
fill(21,139,55);
rect(mouseX-160,mouseY+10,130,15); // Pierna izq

noStroke();
fill(245,114,7,100);
triangle(mouseX-170, mouseY+10, mouseX-170, mouseY+25, mouseY-180, mouseY+17.5); // Triangulos llamas izq
triangle(mouseX-170, mouseY+22.5, mouseX-170, mouseY+35, mouseY-180, mouseY+27.5);
triangle(mouseX-170, mouseY+32.5, mouseX-170, mouseY+45, mouseY-180, mouseY+37.5);
triangle(mouseX-170, mouseY+42.5, mouseX-170, mouseY+55, mouseY-180, mouseY+47.5);
triangle(mouseX-170, mouseY+42.5, mouseX-170, mouseY+65, mouseY-180, mouseY+57.5);

strokeWeight(1.5);
stroke(0,180);
fill(255);
rect(mouseX-190,mouseY+10,30,30); // Zapato izq
arc(mouseX-175,mouseY+35, 30, 60, 0, PI);
strokeWeight(4);
stroke(0,150);
line(mouseX-189,mouseY+20,mouseX-170,mouseY+20);
line(mouseX-189,mouseY+27,mouseX-170,mouseY+27);
line(mouseX-189,mouseY+34,mouseX-170,mouseY+34);
noStroke();
fill(21,139,55);
rect(mouseX-190,mouseY+35,130,15); // Pierna der

noStroke();
fill(245,114,7,100);
triangle(mouseX-200, mouseY+35, mouseX-200, mouseY+50, mouseY-210, mouseY+42.5); // Triangulos llamas der
triangle(mouseX-200, mouseY+42.5, mouseX-200, mouseY+60, mouseY-210, mouseY+52.5);
triangle(mouseX-200, mouseY+52.5, mouseX-200, mouseY+70, mouseY-210, mouseY+62.5);
triangle(mouseX-200, mouseY+62.5, mouseX-200, mouseY+80, mouseY-210, mouseY+72.5);
triangle(mouseX-200, mouseY+72.5, mouseX-200, mouseY+90, mouseY-210, mouseY+82.5);

strokeWeight(1.5);
stroke(0,180);
fill(255);
rect(mouseX-220,mouseY+35,30,30); // Zapato der
arc(mouseX-205,mouseY+60, 30, 60, 0, PI);
strokeWeight(4);
stroke(0,150);
line(mouseX-219,mouseY+45,mouseX-200,mouseY+45);
line(mouseX-219,mouseY+52,mouseX-200,mouseY+52);
line(mouseX-219,mouseY+59,mouseX-200,mouseY+59);


noStroke();
fill(240,22,42);
rect(mouseX-40,mouseY-80,110,50,10); // Capa
rect(mouseX-140,mouseY-70,140,70,10);
rect(mouseX-280,mouseY-55,200,70,10);
rect(mouseX-20,mouseY-55,50,40,10);
rect(mouseX-100,mouseY-25,70,40,10);
rect(mouseX-300,mouseY-15,180,30,10);
rect(mouseX-310,mouseY+10,130,15,10);

noStroke();
fill(93,70,12);
arc(mouseX+140,mouseY-85, 160, 120, -PI, 0); // Casco
rect(mouseX+60,mouseY-85,160,25);
rect(mouseX+60,mouseY-80,20,100,50); // Patillas Casco
rect(mouseX+210,mouseY-80,10,100,50);
rect(mouseX+60,mouseY-40,140,15); // Junta gafas


stroke(93,70,12);
strokeWeight(6);
fill(255);
ellipse(mouseX+130,mouseY-30,60,40); // Ojo izquierda
ellipse(mouseX+210,mouseY-30,60,40); // Ojo derecha


noStroke();
fill(0);
ellipse(mouseX+115,mouseY+5,20,10); // Boca
ellipse(mouseX+145,mouseY-30,7,7); // Pupila izquierda
ellipse(mouseX+225,mouseY-30,7,7); // Pupila derecha


fill(255);
font = createFont("FineAgain",42);
textFont(font);
text("T E  A M O",mouseX-240,mouseY-5);


}


