
PImage imagen; 
void setup(){
  size(400,450,P3D);   
  imagen = loadImage("Fotoprueba.jpg"); 
  noStroke();

  background(255);  
  
}
void draw(){
  
  color este;  
  int x = int( random(400) );  
  int y = int( random(450) );  
  este = imagen.get(  x , y ); 
  fill( red(este) , green(este) , blue(este) , 100 ); 

  float lado = random(3,7);  
 smooth();
 noLights();
 translate( x , y , lado ); 
  sphere(lado);
  
}
void mousePressed(){
  background(255); 
  
}

