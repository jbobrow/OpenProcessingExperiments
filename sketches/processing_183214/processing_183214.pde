
//Pràctica 3 Taller de Creació de Videojocs UPF 2015
//Realitzat per Eric Sueiro Eglicerio: "Muscles of Love"
//Comencem

// Precarrega fotos //
  // @pjs preload= "penis.png" //
    // @pjs preload= "vagina.png" //
      // @pjs preload= "family.jpg" //
        // @pjs preload= "family2.jpg" //


float posicioX;
float posicioY;
float velocitatX;
float velocitatY;
float mida = 20;

PImage foto;
PImage foto2;
PImage family;
PImage family2;
boolean click = true;

void setup() {
 size (800, 450);
 posicioX = 300;
 posicioY = 300;
 velocitatX = random(0,10);
 velocitatY = random(0,10);
 frameRate(30);
 
 foto = loadImage ("penis.png");
 foto2 = loadImage ("vagina.png");
 family = loadImage ("family.jpg");
 family2 = loadImage ("family2.jpg");

}

void draw() {

fill(0,20);
image(family,0,0,width,height);
 posicioX = posicioX + velocitatX;
 posicioY = posicioY + velocitatY;

//Posicions
 if(posicioX >= width || posicioX <= 0){
  velocitatX = -velocitatX; 
 }
  if(posicioY >= height || posicioY <= 0){
  velocitatY = -velocitatY; 
 }

//Intercalar foto-foto2
  if(click == true){
image(foto,posicioX,posicioY);
} else {
image(foto2,posicioX,posicioY);
}

}

void mousePressed() {
 velocitatX = random(-5,10);
 velocitatY = random(-5,10);
 posicioX = mouseX;
 posicioY = mouseY;

//Intercalar foto-foto2 al clicar 
 if(click==true){
click = false;
}else {
click = true;
}

//Canvi de fons que es manté constant
family = family2;
  
 }





