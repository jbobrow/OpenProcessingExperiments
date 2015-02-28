

/*__TWISTER__*/
/*Carolina Núñez*/
/*Basado en "TinyBox" por Nick Bennet
/*
La aplicación consta de cuadrados de diferentes tamaños
que siguen al mouse. A su vez el eje y determina la rotación
de los cuadrados y el grosor de los bordes, mientras que el
eje x determina el color de los bordes, siguiendo una escala
de grises.
Al hacer click en el mouse, el color de los cuadrados cambia a azul,
y al apretar una tecla cambia a morado.
*/


int i,x,y,
z=255;

void setup(){
size(400,400);
}

void draw(){
x=mouseX;
y=mouseY;

fill(50,100,70);
if(mousePressed){ // al hacer click el color de los cuadros cambia a azul
  fill(44,64,173);
}
if(keyPressed){ // al apretar una tecla el color cambia a morado con transparencia
  fill(110,23,144,10);
}


strokeWeight(y>>3); // el y determina el grosor del borde
stroke(~x&y,170); // el borde de los cuadrados me arroja una escala de grises,
//partiendo desde el blanco en los 2 extremos del eje x, hasta los 170 pixeles.
translate(x/2,y/2);

for(i=0;i<y;i++,
rotate(y*PI/9), // rota solo cuando la posición del mouse pasa por el eje y

scale(0.9)) // corresponde a los cuadrados que rotan en la esquina del cuadrado grande
rect(-50/2,-50/2,z,z);} 



