

PImage foto;
PImage foto1;
PImage foto2;
PImage foto3;

boolean boto=true;
int mida=70;
int mida2=85;

var audioElement = document.createElement("audio");



void setup(){
  size(500,400);
  foto1=loadImage("W_nit.jpg");
  foto=loadImage("wbarcelona.jpg");
  foto2=loadImage("moon.jpg");
  foto3=loadImage("sun.gif");
}

void draw (){
  
  background(0);
  
  if (boto){
    image(foto,0,0,width,height);
    image(foto3,mouseX-mida/2,mouseY-mida/2,mida,mida);
    
  }else{
    image(foto1,0,0,width,height);
    image(foto2,mouseX-mida2/2,mouseY-mida/2,mida2,mida);
    
  }
  
  
  
}


void mousePressed (){
  boto=!boto;
  audioElement.setAttribute("src","poik.mp3");
  audioElement.play();

}


