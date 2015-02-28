
int valorrandom;


int n=5;
float x[ ] = new float [n];
float y[ ] = new float [n];

PFont [] tiposlocos = new PFont [5]; //
float v=0.05; // la velocidad de las letras

void setup(){

size(800,600);

valorrandom =int(random(0,4));
 //Misterial //cuando le ponemos create font no se necesita el vlw.

tiposlocos[0]=createFont("Cambria-Bold",1);

tiposlocos[1]=createFont("CenturyGothic",1);

tiposlocos[2]=createFont("Garamond",1);

tiposlocos[3]=createFont("Chalkboard",1);

tiposlocos[4]=createFont("Cochin",1);


 //declaras tipo prenombrada y tamaño
}

void draw() {
  
  background(102);
//mueve la posición de la primera letra
// hacia la posición del apuntador del ratón.

x[0] +=v* (mouseX-x[0]); //aplica pa la primera letra 
y[0] +=v* (mouseY-y[0]);


// has lo mismo para todo
//mueve cada siguiente letra un poco hacia la posición de la letra previa.

for(int i=1; i<n; i++) { //este es el motor y hace que i cambie de valores del 1 hasta el 29
x[i] +=v*(x[i-1]-x[i]); //se sustituye i por valores entre 0 y 29
y[i] +=v*(y[i-1]-y[i]);
}

//dibuja las letras

for(int i=0; i<n; i++) {
  textFont(tiposlocos[i],48);
text("mario", x[i],y[i]);
}

}

