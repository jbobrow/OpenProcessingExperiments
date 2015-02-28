
/*Paula Vilanova
INFORMÀTICA - Pràctica 5_a: Imatge i so
Grup 02 - Anna Maria del Corral
2n GEDI - 2012/13
*/


//definim les variables
int i,x;
PImage Foto;
PImage Foto2;

var audioElement = document.createElement("audio"); //creem una variable d'audio


void setup(){
  background(0);
  size(600,600);
  frameRate(30);
  
  
  //carraguem la imatge
  Foto=loadImage("escacPNG.png");
  Foto2=loadImage("static.png");
  noCursor(); //amaguem el cursor
  
  for(i=0; i<width; i+=width/2.5){ //Determinem un patro en l'eix Y i després en l'eix X per tal que quedi la pantalla plena de rectangles blancs.
    for(x=0; x<height; x+=height/2.5){
    noStroke();
    fill(255);
    rect(i,x,width/5,height/5);
  }
  }
  
  for(i=0; i<width; i+=width/2.5){ //Determinem un patro en l'eix Y i després en l'eix X per tal que quedin els rectangles blancs del mig.
    for(x=0; x<height; x+=height/2.5){
    rect(i+width/5,x+width/5,width/5,height/5);
    }
  }
  
}

void draw(){
  background(0); //repetim tot el fons perque només el vegi un cop la imatge (escac)
  for(i=0; i<width; i+=width/2.5){
    for(x=0; x<height; x+=height/2.5){
    noStroke();
    fill(255);
    rect(i,x,width/5,height/5);
  }
  }
  
  for(i=0; i<width; i+=width/2.5){
    for(x=0; x<height; x+=height/2.5){
    rect(i+width/5,x+width/5,width/5,height/5);
    }
  }
  image(Foto,mouseX-80,mouseY-130,160, 260); //surt escac

    if (mousePressed==true){
      audioElement.setAttribute("src", "soroll.mp3");
      audioElement.play(); //inicia el so
      image(Foto2,0,0,width,height); //surt la imatge borrosa de tv mentre apretes el boto
  }

}





