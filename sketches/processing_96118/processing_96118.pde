
/*Marta Donoso Piñol_2º Gedi_Informàtica
Dibuix doraemon amb el casquet volador que segueix sempre al ratolí mitjançant mouseX i mouseY
juntament amb les funcions setup i draw.*/

int x; int y;
/*Aquí en el setup defineixo el tamany del dibuix i el color de fons utilitzat*/
void setup(){
size(600,600);
background(202,205,250);
stroke(255);
strokeWeight(0);
}



/*He agafat el dibuix que ja havia fet en el seminari 1 i e afegit el casquet volador,al fer el moviment, per aconseguir
que el cursor estigués centrat amb el dibuix al moure's, he tingut que buscar cada punt
de cada figura per a sumar o restar en el mouseX I mouseY en les coordenades. Amb el draw, 
aconsegueixo l'animació del dibuix.*/

void draw(){

background(202,205,250);//en aqui he posat un background per tal de que se'm vagi borrant la figura i no quedi el rastre//
fill(mouseX,240,245);//els núvols que seguidament he dibuixat, he fet que canvïn de color quan el mouse es mou en l'eix de les X//
stroke(178,234,245);
ellipse(180,80,110,60);
ellipse(120,50,160,80);
ellipse(500,120,160,80);
ellipse(440,140,110,60);
fill(218,240,245);
ellipse(180,80,90,40);
ellipse(120,50,140,60);
ellipse(440,140,90,40);
ellipse(500,120,140,60);
fill(255,238,49);
ellipse(315,80,140,140);
fill(100,34,37);
rect(0,600,600,-50);
stroke(62,87,245);
fill(62,87,245,255);
ellipse(mouseX,mouseY-10,110,100);//el doraemon, es un conjunt de diferents formes, és per això que cada peça ha de tenir les seves pròpies coordenades amb mouseX i mouseY tenint en compte que el cursor ha d'estar al centre.//
stroke(0);
fill(255);
ellipse(mouseX,mouseY,85,80);
fill(255,0,0,255);
ellipse(mouseX,mouseY-10,15,15);
fill(255);
ellipse(mouseX-15,mouseY-25,25,28);
fill(255);
ellipse(mouseX+15,mouseY-25,25,28);
fill(0);
ellipse(mouseX-8,mouseY-20,7,7);
fill(0);
ellipse(mouseX+8,mouseY-20,7,7);
line(mouseX,mouseY,mouseX,mouseY);
stroke(62,87,245,255);
fill(62,87,245,255);
rect(mouseX-35,mouseY+35,70,75);
fill(255);
ellipse(mouseX-25,mouseY+110,50,15);
fill(255);
ellipse(mouseX+25,mouseY+110,50,15);
fill(62,87,245);
rect(mouseX+30,mouseY+35,45,15);
rect(mouseX-75,mouseY+35,45,15);
fill(255);
ellipse(mouseX+75,mouseY+40,20,20);
ellipse(mouseX-75,mouseY+40,20,20);
stroke(0);
fill(255,0,0,255);
rect(mouseX-40,mouseY+30,78,7);
fill(255);
ellipse(mouseX,mouseY+70,60,50);
fill(244,245,62);
ellipse(mouseX,mouseY+43,17,17);
fill(255,0,0,255);
ellipse(mouseX,mouseY+10,60,5);
fill(255,227,8);
stroke(255,227,8);
rect(mouseX-23,mouseY-64,45,5);
rect(mouseX-2,mouseY-64,5,-15);
fill(242,246,250);
stroke(242,246,250);
ellipse(mouseX,mouseY-74,50,10);
/*Finalment, al posar el mouseX i mouseY a totes aquelles peces que formen el conjunt del doraemon, he aconseguit que 
se'm mogui tot a la vegada i que el cursor del ratolí es trobi centrat al dibuix. Aquest dibuix amb moviment representa
el "mateix" moviment que fa e doraemon amb el casquet volador*/

}



