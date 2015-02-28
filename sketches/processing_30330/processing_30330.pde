
import ddf.minim.*;

Minim minim;
AudioPlayer musica;

PImage floresta;
PImage c1;
PImage c2;
PImage c3;
PImage c4;
PImage c5;
PImage buraco;
PImage aldeia;
PImage todas;

float posxc1;
float posxc2;
float posxc3;
float posxc4;
float posxc5;
float posxtodas;

void setup(){
  size(800, 600);
  
  minim = new Minim(this);
  musica = minim.loadFile("musica.mp3");
  musica.play();
  
  floresta = loadImage("floresta.jpg");
  c1 = loadImage("c1.png");
  c2 = loadImage("c2.png");
  c3 = loadImage("c3.png");
  c4 = loadImage("c4.png");
  c5 = loadImage("c5.png"); 
  buraco = loadImage("buraco.jpg");
  aldeia = loadImage("aldeia.jpg");
   todas = loadImage("todas.png");


posxc1=-150;
posxc2=800;
posxc3=800;
posxc4=800;
posxc5=800;
posxtodas=800;

  }
void draw(){
  background(0);
  
  

  image(floresta, 0, 0);
  image(c4, posxc4, 340);
  image(c1, posxc1, 390);
  image(c2, posxc2, 370);
  image(c3, posxc3, 450);
 
  
  
  posxc1=posxc1+1;
  
  if(posxc1>100){
  posxc1=100;
  posxc2=posxc2-1;
}
  
  if(posxc2<380){
  posxc2=380;
  posxc3=posxc3-1;
  
}
  
  if(posxc3<500){
  posxc3=500;
  posxc4 = posxc4-1;
  }
  
if(posxc4<0){
  image(buraco, 0, 0);
  image(c5, posxc5, 390);
   posxc5 = posxc5-0.5;
  
}

if(posxc5<450){
  posxc5=450;
image(aldeia, 0, 0);
image(todas, posxtodas, 350);
   posxtodas = posxtodas-0.5;


  
  
  
}
}

