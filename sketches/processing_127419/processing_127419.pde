
PImage foto ;
PImage foto1;
PFont font1;
PImage foto2;
PImage foto3;
PImage foto4;
PImage foto5;

import ddf.minim.*;
AudioPlayer player;
Minim minim;

void setup() {
size(800,600);


foto=loadImage("fiocco.png");
foto1=loadImage("neve.png");
font1=loadFont("Verdana-130.vlw");
foto2=loadImage("Stella piena.png");
foto3=loadImage("sfondo natale.jpg");
foto4=loadImage("fiocco2.png");
foto5=loadImage("fiocco3.png");

 minim = new Minim(this);
  player = minim.loadFile("musica.mp3");
  player.play();
background(foto3);
}

void draw() {


fill(31,24,242);
textFont(font1,100);
text("Auguri",10,105); 
image(foto2,305.5,10);  
image(foto2,25,5);

textFont(font1,15);
fill(255);
text("premi i numeri da 1 a 4 e divertiti a far nevicare!",440,590);

}

void keyPressed() {
if(keyCode==49) {
image(foto1,mouseX-foto1.width/2,mouseY-foto1.height/2); 
}
if(keyCode==50) {
image(foto,mouseX-foto.width/2,mouseY-foto.height/2); 
}
if(keyCode==51) {
image(foto4,mouseX-foto4.width/2,mouseY-foto4.height/2); 
}
if(keyCode==52) {
image(foto5,mouseX-foto5.width/2,mouseY-foto5.height/2); 
}

if(keyCode==ENTER) {
 fill(0,0,255);  
textFont(font1,120);
text("Auguri",10,105); 
image(foto2,356,0);  
 background(foto3);

}
}



