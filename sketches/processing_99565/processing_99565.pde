
PImage fondo,nave;
float posX,posY;
float posX2,posY2;
float posX3,posY3;
float posX4,posY4;
float posX5,posY5;
float transparencia;
float transparencia2; 
float transparencia3;
float transparencia4;
float transparencia5;
float bolita1;
float bolita2;
float bolita3;
float bolita4;
float bolita5;
float Puntaje;

void setup(){
fondo=loadImage("Space-Wallpapers.jpg");
nave=loadImage("nave.png");
size(800,600);
background(fondo);
smooth();
posX=800;
posY=50;
posX2=800;
posY2=500;
posX3=800;
posY3=400;
posX4=800;
posY4=100;
posX5=800;
posY5=200;
transparencia=255;
transparencia2=255;
transparencia3=255;
transparencia4=255;
transparencia5=255;
bolita1=0;
bolita2=0;
bolita3=0;
bolita4=0;
bolita5=0;
Puntaje=0;
noStroke();
}
void draw(){
background(fondo);
textSize(30);
//punto1
fill(255,transparencia);
ellipse(posX,posY,20,20);
posX=posX-5;
//punto2
fill(255,transparencia2);
ellipse(posX2,posY2,20,20);
posX2=posX2-1; 
//punto3
fill(255,transparencia3);
ellipse(posX3,posY3,20,20);
posX3=posX3-10;
//punto4
fill(255,transparencia4);
ellipse(posX4,posY4,20,20);
posX4=posX4-3;
//punto5
fill(255,transparencia5);
ellipse(posX5,posY5,20,20);
posX5=posX5-8;

//desaparecer punto1
if(mouseX>=posX){
transparencia=0;
bolita1=1;
}
//desaparecer punto2
if(mouseX>=posX2){
transparencia2=0;
bolita2=1;
}
//desaparecer punto3
if(mouseX>=posX3){
transparencia3=0;
bolita3=1;
}
//desaparecer punto4
if(mouseX>=posX4){
transparencia4=0;
bolita4=1;

}
//desaparecer punto5
if(mouseX>=posX5){
transparencia5=0;
bolita5=1;
}

//nave
image(nave,mouseX,mouseY,70,70);
tint(0,50);
image(nave,mouseX+10,mouseY+10,70,70);
noTint();
//marcador
fill (255);
textSize(30);
text("Puntaje="+Puntaje,20,30);
//Puntaje
Puntaje=bolita1+bolita2+bolita3+bolita4+bolita5;

if(Puntaje==5){
  textSize(30);
  text(("¡Ganaste!"),height/2,width/2);
}

  
}
