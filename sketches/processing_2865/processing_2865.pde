
void setup(){ 
  size(500,500); 
  background(0); 
  fill(random(0, 114), 25, random(0,180));  
  float alt=random(40,80);
  float anch=random (40,80);
} 
 
void draw(){ 
background(0); 
  for(int x=0;x<mouseX/75;x++){  //parametros de la variable x  al mover el mouse 
  for(int y=0;y<mouseY/75;y++){ 
    if (mousePressed)    { 
   float alt=random(40,80);
  float anch=random (40,80);
   
      stroke(random(0,180), random(0, 24), random(0, 24));  
     fill(random(0,180), random(0, 24), random(0, 24)); 
    ellipse(x*100, y*100, alt,anch); //
}  
  else { //si no se aprieta... 
    float alt=random(20,80);
  float anch=random (20,80);
    stroke(random(0, 114), 25, random(0,180));  
   fill(random(0, 9), random(0,5), random(0,134));  
    rect(x*100, y*100, alt,anch); 
  }  
  }  
}  
  
  
 } 
 
 void keyPressed(){   
  saveFrame("rectellipse_pulsatingwaves.jpg");   
  println("fotograma grabado");   
}   
  
 
 
 
 
 

