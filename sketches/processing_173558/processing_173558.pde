
Globo [] globos = new Globo[600];
int totalglobos = 0;
 
void setup(){
size (700, 1300);
smooth();
noStroke();
frameRate(20);
}
 
void draw(){
background(0);
globos[totalglobos] = new Globo(color(0),random(width),random(height));
totalglobos++;
 
if (totalglobos >= globos.length) {
totalglobos = 20; //empezar de nuevo pero siempre teniendo 10
}
 
for (int i = 0; i < totalglobos; i++){
globos[i].cae();
globos[i].show();
}
}
 
class Globo{
color c;
float xpos;
float ypos;
 
 
Globo (color c_, float xpos_, float ypos_){
c = c_;
ypos = ypos_;
xpos=xpos_;
}
 
void show(){
rectMode(CENTER);
fill(random(180), random(0), 90);
rect(xpos, ypos, random(10, 50), 50);
stroke(255);
line(xpos, 0, xpos, height);
}
 
void cae(){
ypos = ypos + 10;
 
}
}

