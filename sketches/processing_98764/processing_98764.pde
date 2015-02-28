

//s'inicien les variables
int i,x;

PImage foto;

var audioElement = document.createElement("audio");// variable d'audio


void setup(){
  background(65,183,214);//fons blau cel
  size(500,500);
  frameRate(30);// definim la velocitat de movimeent
  // Definim el fons en bucles
  for(i=0; i<width; i+=width/5){//bucle rodones verdes
    for(x=0; x<height; x+=height/5){
    noStroke();
    fill(179,227,71);
    ellipse(i+50,x+50,width/5,height/5);
    } 
  }
  for (i=0; i<width+100; i+=width/5){//bucle rodones taronjes
    for(x=0; x<height+100; x+=height/5){
      noStroke();
      fill(255,133,3);
      ellipse(i,x,width/10,height/10);
    }
}
foto = loadImage("taza.png");//carreguem la imatge escollida
noCursor();

}

void draw(){
  background(65,183,214);// Repetim elfons pq la imatge no es repeteixi i no deixi rastre
   for(i=0; i<width; i+=width/5){
    for(x=0; x<height; x+=height/5){
    noStroke();
    fill(179,227,71);
    ellipse(i+50,x+50,width/5,height/5);
    } 
  }
  for (i=0; i<width+100; i+=width/5){
    for(x=0; x<height+100; x+=height/5){
      noStroke();
      fill(255,133,3);
      ellipse(i,x,width/10,height/10);
    }
}
  image(foto,mouseX-125,mouseY-125,width/2,height/2);//Definim que la iatge es mogui seguint el mouse
}
void mousePressed(){// definim que apretan el mouse s'activi la músici i q al tornar a apretar es reinini
  audioElement.setAttribute("src","cafeteria.mp3");
  audioElement.play();
}
  


