

 
PImage pistes1;
PImage Captura1;
PImage Captura;

//var audioElement=document.createElement("audio");

void setup(){
  noCursor();
  size(300,300);
 //Minim minim;
//AudioPlayer daSound;
 
     
  
  size(800,800);
  pistes1 = loadImage("pistes1.jpg");
 Captura = loadImage("Captura.PNG");
  Captura1 = loadImage("Captura1.PNG");
   
   
   
}
 
 
void draw (){
  
image(pistes1,0,0,width, height);//centrada
if (mousePressed==true)
 
  image(Captura1,mouseX,mouseY);
 
else{
  image(Captura,mouseX,mouseY);
}
}
 
void mousePressed(){
  if (mousePressed==true){
//  audioElement.setAttribute("src","poik.mp3");
// audioElement.play();
}
}



