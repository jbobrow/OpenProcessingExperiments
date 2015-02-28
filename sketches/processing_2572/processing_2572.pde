
float posX; 
float posY; 
float velX; 
float velY; 
int tamanho=30; 
 
void setup() { 
 
  size (400,400); 
  posX=width/2; 
  posY=height/2; 
  velX=5+random(10); 
  velY=3+random(10); 
  background(0);
 
  smooth(); 
} 
 
void draw() {
   
 
  fill(234,26,26,30);
  noStroke();
 
 
  if(posX <= 0 || posX >=width) 
  { 
        velX=-velX; 
  } 
 
  if(posY <= 0 || posY >=height) 
  { 
    velY=-velY; 
  } 
 
  ellipse(posX,posY,tamanho,tamanho); 
 
  posX=posX+velX; 
  posY=posY+velY; 
 
 
 
}


