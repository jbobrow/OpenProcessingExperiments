
PImage imagen; 
void setup(){
  size(400,450);   
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
  stroke(este); 
  float lado = random(3,20);  
 smooth();
  ellipse( x , y, lado , lado ); 
}
void mousePressed(){
  background(0); 
  
}

