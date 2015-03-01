
int ancho=30;  // variables que delimitan los rectangulos oclusores
int x_uno=100;
int x_dos=180;


void setup() {  //setup function called initially, only once
 size(300,300);
}
int i=0;
void draw() {  //draw function loops 
background(255);
color ai,ab, ac; // definicion del color.
    ai=color(0,0,255);
    ab=color(0,255,0);
    ac=color(255,0,0);
   i=i+1;
if((i<x_uno)||(i>x_dos)){ 
 cuadrados(i,150,10,10,ac );
 }

 cuadrados(x_uno,20,ancho,260, ai) ;
 cuadrados(x_dos,20,ancho,260, ab) ;
 if(i>=300){
 i=0;
 }
 
}

void cuadrados(int x, int y, int a, int h, color c){ // ubicacion de cuadrados. , coordenadas inciales 
fill(c); // se ooloca el color "c" antes de crear el objeto.
rect(x,y,a,h);
}

