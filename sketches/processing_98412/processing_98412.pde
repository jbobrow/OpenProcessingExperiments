
PImage foto;
PImage foto2;
PImage foto3; 

var audioElement=document.createElement("audio"); 

void setup(){
  size(500,370);
  foto=loadImage("flower.jpg");
  foto2=loadImage("colebri.png");
  foto3=loadImage("colebri2.png"); 
  noCursor();
  
//fiquem la imatge de fons i la imatge del col·librí que es mogui amb el 
//cursor.  

}

void draw(){
  background(0);
  image(foto,0,0);
  image(foto2,mouseX-50,mouseY-80); 

//que canvi de posició quan s'estigui pressionant el mouse! 
 
   if (mousePressed == true) {
  image(foto,0,0);
  image(foto3,mouseX-50,mouseY-80);
  } else {
  image(foto,0,0);
  image(foto2,mouseX-50,mouseY-80);
  }
 
}

//afegim el so!

void mousePressed(){
  audioElement.setAttribute("src","ringtone.mp3");
  audioElement.play();
  
}





