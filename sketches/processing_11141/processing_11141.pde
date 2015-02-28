
PImage imagen;
void setup(){
  size(375,525);   
  imagen = loadImage("monalisa.jpg");
  noStroke();
  rectMode(CENTER);
  background(255);
}
void draw(){
  float des = (height-mouseY) / 20;  
  color este; 
  int x = int( random(154) ); 
  int y = int( random(240) ); 
  este = imagen.get(  x , y ); 
  fill( red(este) , green(este) , blue(este) , 100 );
  stroke(este); 
  float lado = random(3,20);  
  rect( x * 2+25 , y * 2+25, lado , lado ); 
}
void mousePressed(){
  background(255); 
}

