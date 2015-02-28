

void setup(){
  
background (0);

size (800, 400);
}

void draw(){
  
  float d2 = mouseX/2-20;
  
  float d1 = width/2 - (d2+40);
 
  smooth();
  
  translate (width/2, height/2);
  
  noFill();
  
  strokeWeight(random(5,20));
  
  stroke (random(255), random(255), random(255));
  
  ellipse (-width/4, 0, d1, d1);
  
  ellipse (width/4, 0, d2, d2);
  
}

