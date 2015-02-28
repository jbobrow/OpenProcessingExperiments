
PImage caliente[];
int indice = 0;

void setup() {
size(400,400);
caliente = new PImage[20];
for(int i=0; i<=19;i=i+1) {
caliente[i] = loadImage("caliente"+i+".gif");
}
}

void draw(){

image(caliente[indice],0,0);

if ((mouseX > 0) && (mouseX <=20)) {
indice = 0;
}
if ((mouseX > 20) && (mouseX <=40)) {
indice = 1;
}
if ((mouseX > 40) && (mouseX <=60)) {
indice = 2;
}
if ((mouseX > 60) && (mouseX <=80)) {
indice = 3;
}
if ((mouseX > 80) && (mouseX <=100)) {
indice = 4;
}
if ((mouseX > 100) && (mouseX <=120)) {
indice = 5;
}
if ((mouseX > 120) && (mouseX <=140)) {
indice = 6;
}
if ((mouseX > 140) && (mouseX <=160)) {
indice = 7;
}
if ((mouseX > 160) && (mouseX <=180)) {
indice = 8;
}
if ((mouseX > 180) && (mouseX <=200)) {
indice = 9;  
}
if ((mouseX > 200) && (mouseX <=220)) {
indice = 10;
}
if ((mouseX > 220) && (mouseX <= 240)) {
indice = 11;
}
if ((mouseX > 240) && (mouseX <=260)) {
indice = 12;
}
if ((mouseX > 260) && (mouseX <=280)) {
indice = 13;
}
if ((mouseX > 280) && (mouseX <=300)) {
indice = 14;
}
if ((mouseX > 300) && (mouseX <=320)) {
indice = 15;
}
if ((mouseX >320) && (mouseX <=340)) {
indice = 16;
}
if ((mouseX > 340) && (mouseX <=360)) {
indice = 17;
}
if ((mouseX > 360) && (mouseX <=380)) {
indice = 18;
}
if ((mouseX > 380) && (mouseX <=400)) {
indice = 19;
}
if (indice >=20) {
indice = 0;  
}
}




