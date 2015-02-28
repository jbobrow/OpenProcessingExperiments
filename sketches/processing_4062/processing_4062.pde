
 /** <strong> "Jeu d'enfants" </strong> 
*Proyecto Final de II Trimestre de 2009
*Lenguaje Computacional Cero - Processing
*Entrega: Martes 25 de Agosto. 
*Por Samira Bajbuj. 
*Basado en ejemplo de tutorial de  
* 
*<strong>Descripción General de la Animación</strong> 
* 
*La animación consiste Actividades básicas para niños pequeños;
*tales como un Laberinto (1), un Cuadro en blanco para colorear (2),
*y un Papel para escribir (3).
*Estas tres Actividades se realizan con un pincel único manejado con el mouse que cambia
*autónomamente a todos los colores del arcoiris.
*La Actividad (1) está destinada a introducir a las actividades siguientes, en tanto
*las actividades (2) y (3) están destinadas a crear dibujos o textos, adornados por marcos
*decorativos (como opción utilizar la función "Imp Pnt" del teclado para copiar y guardar las creaciones).
* 
* 
* 
*Una vez que se ha realizado el Laberinto (1), se presiona la tecla izquierda 
*del mouse que nos deriva a la actividad (2) Cuadro para colorear; ésta tecla siempre nos llevará
*al cuadro en blanco, por lo mismo si queremos volver a dibujar la presionamos nuevamente. 
*Para ir a la Actividad (3) La carta, solo debemos presionar la tecla "A" del teclado. 
*/


int so;
void setup(){

size(400,600);     // tamaño del lienzo
background(255);   
colorMode(HSB);    
so = 0;

size(400,600);    // tamaño de la imagen 
PImage b = loadImage("laberinto.jpg");  // imagen (1)
image(b,0,0,400,600);                   //ubicación de la imagen dentro del lienzo 


}
void draw(){             //pincel

so = (so+1) % 256;                
noStroke();

fill(so,255,255,255);
ellipse(
random(mouseX+2, mouseX+2) ,random(mouseY,mouseY) 
, 15 , 15 );



}



void mousePressed(){                 // Opción que lleva a la imagen (2) con el click del mouse.
size(400,600);
PImage b = loadImage("cuadro.jpg");
image(b,0,0,400,600);

}

void keyPressed( ){                 // Opción que lleva ala imagen (3) con la tecla "A" del teclado.
    if(key=='a'||key=='a')
size(400,600);
PImage c = loadImage("carta.jpg");
image(c,0,0,400,600);

}



