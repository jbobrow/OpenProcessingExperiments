
/*
Pràctica 5_a: IMATGE I SO
Ona Bombí Aymerich
Grup 02 
Informàtica 
2n GEDI 2012-2013
*/

// Variables de so
var audioElement = document.createElement("audio");
var audioElement1 = document.createElement("audio");


// Imatges 
PImage foto,fons;

void setup(){
  
  // Dimensions pantalla
  size(800,500);
  
  // Amagar el cursor
  noCursor();
     
  // Carregar les imatges
  foto = loadImage("mussol.png"); // Foto que es trasllada
  fons = loadImage("forest_night.jpg"); // Foto de fons fixa
  
  // Carregar el so de fons
  audioElement.setAttribute("src","HarryPotter_soundtrack.mp3");
  audioElement.play();
     
}

void draw(){ 
  
  // Col·locar el fons pantalla
  image(fons,0,0,width,height);

  // La imatge importada es mou en funció del moviment del cursor
  image(foto,mouseX-width/4,mouseY-height/4,width/2,height/2.5);   
}

// Al clicar el ratolí s'activa el so del cant d'un mussol
void mousePressed(){  
  //Carregar el so 2
    audioElement1.setAttribute("src","owl.wav");
    audioElement1.play();

}



