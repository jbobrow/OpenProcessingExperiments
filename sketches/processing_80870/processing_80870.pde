
Lluvia[] gotas = new Lluvia[1000];

void setup() {
background(60);
size(640, 480);
fill(255,150);
smooth();
stroke(60,120);


for (int i = 0; i < gotas.length; i++) {

float x = random(width);
float y = random(height);
float diam = random(1,40);
float speed = 1000;
float scalar = 0.01;

gotas[i] = new Lluvia(x, y, diam, speed, scalar);
}

}

void draw() {
for (int i = 0; i < gotas.length; i++) {
if (mousePressed == true){
gotas[i].movimiento();
gotas[i].display();
}
}
}



class Lluvia{

float x;
float y;
float diam;
float speed;
float angle;
float scalar;
float angle2;

Lluvia(float tempX, float tempY, float diamH, float speedH, float scalarH){

x = tempX;
y = tempY;
diam = diamH;
speed = speedH;
scalar = scalarH;
//angle = angleH;

}

void movimiento(){

x+=cos(angle)*scalar;
y+=sin(angle)*scalar;
angle+=0.5;
scalar+=0.05;

} 

void display(){

ellipse(x,y,noise(diam)*6,noise(diam)*6);
angle2+=0.5;
}
}
