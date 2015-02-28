
int sz = 30;
PImage Foto;
PImage Foto2;
PImage Foto3;
var audioElement = document.createElement("audio"); //creem una variable d'audio

void setup(){
size(500,375);
Foto= loadImage ("tub.png"); 
Foto2=loadImage ("fons.jpg");
Foto3=loadImage ("fons2.jpg");
noStroke();
noCursor ();

}

void draw(){
image(Foto2,0,0);
image(Foto, mouseX-25, mouseY+40, 50,45);
}
void mousePressed(){
image(Foto3,0,0);  
audioElement.setAttribute("src", "audio.mp3");
  audioElement.play(); //inicia el so
}
  


