

//import ddf.minim.*;
//import ddf.minim.signals.*;
//import ddf.minim.analysis.*;
//import ddf.minim.effects.*;

PImage fondo2;
PImage globo;
PImage pez1;
// Minim minim;
//AudioPlayer daSound;
 var audioElement=document.createElement("audio");
void setup(){
  noCursor();
  size(640,480);
// minim = new Minim(this);// l'objecte de so
//  daSound = minim.loadFile("bubble.wav");//so

    
 
  size(640,480);
  fondo2 = loadImage("fondo2.jpg"); 
  pez1 = loadImage("pez1.jpg");
  globo = loadImage("globo.jpg");
  
  
  
}


void draw (){
 
image(fondo2,0,0,width, height);//centrada
if (mousePressed==true) 

  image(globo,mouseX,mouseY);

else{
  image(pez1,mouseX,mouseY);
}
}

void mousePressed(){
  if (mousePressed==true){
  audioElement.setAttribute("src","poik.mp3");
  audioElement.play();
}
}




