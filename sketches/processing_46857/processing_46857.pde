

void setup (){
  

  
  size (600,600);
 background (0); 
}

void draw (){
  
  smooth ();
  
  if (mousePressed) {
  stroke (0,random(0,255),99,random(25,255));
  strokeWeight (random(0,25));
  line (mouseX,mouseY,600,mouseY);
  
  } 
}

