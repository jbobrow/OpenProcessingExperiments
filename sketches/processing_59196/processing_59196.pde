
PImage imagem; 
PImage imagem2;
int numero;


void setup() {

size (500,800);
numero=30;
imagem=loadImage("G-01.png");
imagem2=loadImage("e2.jpg");
frameRate(5);
}

void draw() {
float r=random(255);
float b=random(255);
float g=random(255);
float a=random(100);
 
 
//println("gifAnimation"); 
 

colorMode(RGB,150);
smooth();
noStroke();
image (imagem,0,0);
//saturation (40);
fill(r,g,b,a);
rect (0,0,500,800);
//fill(r,b,g,a);
rect (0,0,400,700);
//fill(255,255,b,a);
rect (0,0,300,600);
//fill (r,g,b,a);
rect (0,0,200,500);
//fill(r,g,b,a);
//fill(b,a);
//tint (r,g,b);
image (imagem,0,0);
//ellipse (300,300,20,20);
//loop();
//save("gradiente.gif");

}

