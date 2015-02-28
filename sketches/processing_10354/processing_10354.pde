
  /*
PROYECTO 01 SESION 2 :
Titulo: miro continuo
Nombre:Lluc Llobell
Fecha:  26/05/2010
Lugar:Girona
*/
void setup()
{
//fondor
smooth();
size(504,361);


 
//color fondo
fill(229,223,212);
rect(0,0,543,391);
noStroke();



fill(10);
pushMatrix(); // hace que afecte a un solo objeto
rotate(1.5);
ellipse (305,-100,200,1500);
popMatrix(); // cierra para que no coja mas objetos
// creamos la caja.


fill(50);
pushMatrix(); // hace que afecte a un solo objeto
rotate(1.5);
ellipse (335,-100,200,1500);
popMatrix(); // cierra para que no coja mas objetos
// creamos la caja.
}

void draw()
{

// verde
noStroke();
fill(63,77,68);
ellipse (120,40,25,25);

//azul
noStroke();
fill(61,07,175);
ellipse (76,160,20,20);
 
//al lado de la roja
noStroke();
fill(143,54,46);
ellipse (350,129,25,25);
 
//gris
noStroke();
fill(51,55,56);
ellipse (430,80,20,20);
 
//marron claro
noStroke();
fill(69,66,56);
ellipse (470,146,10,10);
 
//marron oscuro
noStroke();
fill(103,50,40);
ellipse (126,310,12,12);
 
//naranja
noStroke();
fill(170,71,28);
ellipse (359,290,22,22);


//borde blanco
stroke(255);
strokeWeight(10);
noFill();
rect(0,0,width,height);

//difuminar
filter(BLUR, 2); 

//circulo grande
noStroke();
fill(200,0,0);
ellipse (230,90,220,160);

//difuminar
filter(BLUR, 1); 
}

