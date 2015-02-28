
//Imatges
var audioElement = document.createElement("audio");
PImage espai;
PImage buitre;
//SO


void setup () {

 size (700,271); 
 background (0);
 espai= loadImage ("espai.jpg");
 buitre= loadImage ("buitre.gif");

  
}

void draw() {

  noCursor();
  image (espai,0,0); 
  image(buitre,mouseX, mouseY, 70,70);
    
      
}

 void mousePressed() {
  audioElement.setAttribute("src","sobuitre.mp3");
  audioElement.play();
 
}



