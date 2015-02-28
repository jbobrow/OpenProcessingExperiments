
PImage imagen; 
void setup(){
  size(400,450,P3D);   
  imagen = loadImage("tipas.jpg"); 
  noStroke();

  background(0);  
  
}
void draw(){
  
  color este;  
  int x = int( random(400) );  
  int y = int( random(450) );  
  este = imagen.get(  x , y ); 
  fill( red(este) , green(este) , blue(este) , 100 ); 

  float lado = random(3,20);  
 smooth();
 noLights();
 translate( x , y , lado ); 
  sphere(10);
  
}
void mousePressed(){
  background(255); 
  
}

