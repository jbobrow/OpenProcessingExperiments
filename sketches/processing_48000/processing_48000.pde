
class Particula{
 float x;
 float y;
 float raio;
 float velX;
 float velY;
 float acelX;
 float acelY;
 float atrito;
 float cor1;
 float cor2;
 float cor3;
 
 Particula(){
      x = random ( width);
      y = random ( height);
      raio = random (10,50);
      atrito = 1.1;
      cor1 = random(255);
      cor2 = random(255);
      cor3= random(255);
   
 }
 

 
 void desenhar(){
  ellipse ( x, y, raio*2, raio*2); 
  fill(cor1, cor2, cor3,50);
  
   
 }
 void mudarCor(){
  cor1= random (255);
  cor2=random(255);
  cor3=random(255);
  
   
 }
 
 void mover(){
 
   velX += acelX;
   velY += acelY;
   velX /= atrito;
   velY /=atrito;
   x += velX;
   y += velY;
   acelX =0;
   acelY =0;
 
   
 }
 
 void aplicarForca (float forcaX, float forcaY){
 
 acelX += forcaX;
 acelY += forcaY;
 
 
 
 }
 
 void forcaRandom(){
 
   acelX += random (-1,1);
   acelY += random (-1,1);
 
 
 
 }
 
 
 void colisao(){
  
    if (x < raio){
    x = raio;
    velX -= velX;
  }
  
    if (y < raio){
    y = raio;
    velY -= velY;
  }
  
  
  if (x > width - raio){
    x = width - raio;
    velX = - velX;
  }
  
  if (y > height - raio){
    y = height - raio;
    velY = - velY;
  }
   
 }

}


