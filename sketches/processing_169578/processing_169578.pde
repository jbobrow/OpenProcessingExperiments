
void setup(){
  size(400,400);
}

void draw(){
  
  background(#B90909);
  fill(58,160,98);
  
  //cuerpo
  ellipse(200,200,300,300);
  
  //ojos
  noStroke( );
  fill(#F8FADE);
  ellipse(100,100,90,90);
  ellipse(300,100,90,90);
  
  //iris
  noStroke( );
  fill(#0C0F0E);
  //movimiento del iris en ambas direcciones
  ellipse(100,100,mouseX/10,20);
  ellipse(300,100,mouseY/10,20);
  
  //boca
  ellipse(200,280,100,50);
  
  //nariz
  fill(0);
  triangle(183,224,210,224,211,147);
  triangle(569,224,598,224,587,153);
  
}
