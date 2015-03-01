
float speedX = 5;
float speedY = random(50,100);
float posX = 300;
float posY = 300;
 
 
void setup() {
  size(800,800);
  frameRate(30);
  background(0);
}
 
void draw() {
  noStroke(); 
   
  fill(0,1);
  rect(0,0,width,height);
  fill(227,48,48);
  ellipse(posX,posY,75,75);

  
   
  posX = posX + speedX; 
  if(posX+(75/2) >= 800 || posX-(75/2) <= 0 ){
    speedX = -speedX;
   }
  
  
 posY = posY + speedY;
  if(posY+(75/2) >= 800 || posY-(75/2) <= 0 ){
    speedY = -speedY;
   }
   
  posY = posY + speedY;
  if(posY+(75/2) >= 800 || posY-(75/2) <= 0 ){
    speedY = -speedY;

  }
}
