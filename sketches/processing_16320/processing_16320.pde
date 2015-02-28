

PImage piltri;
PImage piltriscuro;

void setup(){
  size (1200,800);
  background (4,6,46);
 piltriscuro= loadImage ("piltri-o.png");
 piltri= loadImage ("piltri-p.png"); 
}

void draw(){
 
  image (piltriscuro, 0,309,1200,491); 
  
 //smooth ();
  noStroke ();
  fill (random(230,255),random(230,255),random(250, 255));
  rect (random (-10, 1200), random (-50,500), random (2, 2), random (1, 1));
 
  if (mouseX>=65 && mouseX<=135 && mouseY>=45 && mouseY<=115 ){
    smooth();
    noStroke (); 
    image (piltri, 0,309,1200,491); 
    fill (255,50);
    ellipse (100, 80, 70, 70);
    
}else if (mouseX>=65 && mouseX<=1200 && mouseY>=45 && mouseY<=900 ){
  
   smooth();
   noStroke (); 
   fill (40,50,76);
   ellipse (100, 80, 70, 70);
    
   
}else if (mouseX>=0 && mouseX<=135 && mouseY>=0 && mouseY<=115 ){
  
   image (piltri, 0,309,1200,491); 
}
  
}
  

