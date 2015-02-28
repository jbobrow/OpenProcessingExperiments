
int numeroPetalos=50;
float deg= 360;


void setup (){
size (400,300);
smooth();


}

void draw(){
  background (0,53);
//LINEA

translate (width/2, height);
float ang = atan2 (mouseY-height,mouseX-width/2);
rotate (ang+0.5*PI);
line (0,0,0,-100);
stroke(255);

//HOJA
ellipse(10,-50, 20, 10);

//CENTRO FLOR
translate (0,-120);
ellipse(0,0,50,50);
fill(83,250,20);

//PETALO1
for(int i=0; i<numeroPetalos; i++){
rotate(TWO_PI/numeroPetalos);
//fill(#FF05FC);¿PORQUE ME CAMBIOA EL COLOR A TODOS LOS FILLS?
ellipse(0,30,10,30);
}
 
//PETALO2
fill(#FF05FC);
for(int i=0; i<numeroPetalos; i++) {
rotate(TWO_PI/numeroPetalos);
ellipse(0,40,10,15);
  }
}

