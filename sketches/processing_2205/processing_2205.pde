
float tamanoBrazo;   
float vel=0.3; 
float angle=386;

 
void setup(){ 
  size(800,800); 
  tamanoBrazo=450; 
} 
 
void draw(){ 
 
  background(230); 
  stroke(255,120); 
  strokeWeight(20); 
  smooth(); 
 
// Dibujar 

 angle+=vel; 
 dibujaBrazos(angle); 
} 
   
  void dibujaBrazos (float angle) 
  { 
  //pushMatrix(); 
 line (0,height/2,width,width/2); 
 translate(width/2,height/2);   
   
  rotate(radians(-angle)); 
  line(0,0,0,(-tamanoBrazo/3));
  noStroke(); 
  fill(0);
  ellipse(0,0,10,10); 
  
 
  translate(0,(-tamanoBrazo/3)); 
  rotate(radians((angle*4))); 
  stroke(255,120); 
  strokeWeight(20); 
  line(0,0,0,(-tamanoBrazo/4)); 
  noStroke(); 
  ellipse(0,0,6,6); 
   
  translate(0,(-tamanoBrazo/4)); 
  rotate(radians((angle*4))); 
  stroke(255,120); 
  strokeWeight(20); 
  line(0,0,0,(-tamanoBrazo/6)); 
  noStroke(); 
  ellipse(0,0,6,6); 
  
  //cabeza
  translate(0,(-tamanoBrazo/6));
 
  ellipse(0,0,60,60); 
  fill(255); 
  strokeWeight(3); 
  stroke(70);
  ellipse(0-15,-2,60/2,60/2); 
  ellipse(0+15,-2,60/2,60/2);
  noStroke();
  fill(0);
  ellipse(0-18,3,60/4,60/4); 
  ellipse(0+18,3,60/4,60/4);
  
  if  (angle<= 304){
    vel =-vel;
  }
    
  if (angle >=416) {
    vel =-vel;
  }

  
   //println (angle);
   
 // popMatrix(); 
} 
 
 void mousePressed() {
  noLoop();
}

void mouseReleased() {
  loop();
}

