
float posX, posY;
float velX, velY;
float rad;


void setup(){
  size(800,400);
  smooth();
  noStroke();
  
  posX = 1;
  velX = -2.5;
  rad = 200;
  
  background(0);
}

void draw(){
  fill(0,0,0,50);
  rect(0,0,width,height);

    
  fill(0,0,255);
  ellipse(posX,posY,50,50);
 
  posX += 2*velX;
  posY = height/2 + cos(frameCount*0.1)*rad;
  
  if(posX > width || posX < 0){
   velX = velX*-1; 
  }
  
  
}

