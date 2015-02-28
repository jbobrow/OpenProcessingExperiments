
/* @pjs preload="fondo.jpg,lol.png,pedo2.png"; 
 */
//Adan bachir 1r asix
PImage lol; //little girl img
PImage pedo2; //pedobear img
PImage fondo; //fondo

import ddf.minim.*;
AudioPlayer player; 
Minim minim; 

Lol[] lols = new Lol[3]; //cuantas little girls quieres?

Pedo2[] pedob = new Pedo2[1]; //pedobear

void setup(){
  size (625, 441);
 frameRate(100);
  minim = new Minim(this); 
  
  player = minim.loadFile("prueba1.mp3"); 
  
  player.play(); 

   
  
  for (int i = 0; i < pedob.length;i++){
     pedob[i] = new Pedo2(0, 220, 6);
   pedo2 =loadImage("pedo2.png");
  }
     for (int i = 0; i < lols.length;i++){
     lols [i] = new Lol(0, random(20,400), random( 5,7));
      lol =loadImage("lol.png");
 
 
  }
}
void draw(){
   fondo=loadImage("fondo.jpg");
  image(fondo, 0, 0, 625, 441);
  for (int i = 0;i < pedob.length;i++){
    pedob[i].dibuixa();
   pedob[i].moure();
  }
  for (int i = 0; i < lols.length;i++){
  lols[i].dibuixa();
  lols[i].moure();
  }
 }
 
 class Pedo2 {
  
  float xPos;
  float yPos;
  float xSpeed;
 
  
  Pedo2(){
    
    xPos = width/2;
    yPos = height/2;
    xSpeed = 1;
  }
  Pedo2(float x, float y, float vel){
   
    xPos = x;
    yPos = y;
    xSpeed = vel;
   
  }
  void dibuixa(){
 image(pedo2, xPos, yPos, 100, 100);
  }
  void moure(){
    xPos = (xPos + xSpeed)%width;
  }
}
class Lol {
 
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  
  Lol(){
    
    xPos = 100;
    yPos = height/2;
    xSpeed = 20;
    ySpeed = 2;
  }
  Lol(float x, float y, float vel){
 
    xPos = x;
    yPos = y;
    xSpeed = vel;
    ySpeed = vel;
  }
  void dibuixa(){
   image(lol, xPos, yPos, 100, 100);
    
  }
  void moure(){
    xPos = (xPos + xSpeed)%width;
    
  }
}

void stop(){  
  
  player.close(); 
  
 minim.stop(); 
 
  super.stop(); 


} 


  


