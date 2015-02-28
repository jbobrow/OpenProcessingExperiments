
float a;

void setup(){
size(800,600);
background(175); 
smooth();
}

void draw(){   
noStroke();

fill(mouseX,mouseY,random(0,255),150); // cambia el color segun la posicion del mouse
rectMode(CENTER);
rect(random(800), random(600), a,a); //cambia la posicion y tamaño del cuadrado random

a= random (0,100); //varia el tamaño del cuadradito


}               
