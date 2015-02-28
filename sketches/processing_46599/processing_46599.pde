
int x=0;

PImage imagen; 
int direccion =5;

void setup(){   // bloque de codigos es una parte que la computadora lee una sola vez ,se 

size (800, 800); // set the size to 1000 x 1000
background (10,25,4); // set the background to black
//framerate (5)

imagen = loadImage ("Neptune1.jpg");
}
void draw (){

background (0,0,0);
 image (imagen,0,150,x,300);

 x= x + direccion;

if (x>= width || x<=0)  { 
direccion = direccion *-1; 
}
}

