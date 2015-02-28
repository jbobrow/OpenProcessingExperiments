
float pos = 9.0;

  void setup(){
  size (600,600);
  frameRate (20);
  background(0);
  smooth();
}

void draw(){
  {
   fill(255);
   ellipse (300,300,30,30);
   ellipse(400,100,80,80);
   pos = pos + .07;
   float n= noise(pos)* width/2; 
   strokeWeight (15); //(randon(50)) y la definicion de la linea va cambiando
  
  stroke (random(209),random (98), random (227),50); //si le quito un numero le quito sutileza o etc.
   ellipse(70,70,400,n);
   
  stroke (random(143),random (227), random (98),50); 
  ellipse(70,70,200,n);
  
  
   
 }
}
