

void setup (){
  

  
  size (600,600);
 background (0); 
}

void draw (){
  
  smooth ();
  noFill ();
  
  if (mousePressed) {
  stroke (random(0,255),random(0,255),random(0,255),random(25,255));
  strokeWeight (random(0,30));
  rect (mouseX,mouseY,random(5,150),random(5,150));
  
  
  } 
}

