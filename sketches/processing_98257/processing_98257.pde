
//creoImatges
PImage fondo; 
PImage hierba;
PImage mexicano;
var audioElement = document.createElement("audio");//create audio player//
 




void setup(){
  size(500,500);
 
  
 //carregoImatges
  fondo = loadImage("fondo.jpg"); 
  hierba = loadImage("hierba.gif");
  mexicano = loadImage("mexicano.gif");
  
  
}
void draw(){
  if(mousePressed){ audioElement.setAttribute("src", "disparo.mp3");//import mp3 data//
  audioElement.play();}
 
  noCursor();

  //imagen fondo

 image(fondo, 0, 0);
//movimentHerba

for (float i=0; i<=5; i = i +1){
 
   
image(hierba,random(0,500), random(0,500)); 

}
//Cursor mexicano
image(mexicano, mouseX-30,mouseY-30);
}




