
float sz = 40;
float posX = 100;
float posY = 100;
float velX = 2;
float velY = 2;
float interior = 255;
float interior2 = 255;
float interior3 = 255;


void setup (){
  size(800,600);
 
}

void draw (){
   
  //estela
  noStroke();
  fill(0, 50);
  rect(0, 0, width, height);
 
 //figura 
  posX = posX + velX;
  posY = posY + velY;
   fill(255);
   ellipse(posX,posY,sz*2,sz*2);
  fill(interior);
  ellipse(posX,posY,sz,sz);
  fill(interior2);
  ellipse(posX,posY,sz/2,sz/2);
 
  
 //rebotar
 if(posX<100||posX>700){
  velX=-velX;
  }
  if(posY<100||posY>500){
    velY=-velY;
  }
  }


void mousePressed(){
  posX=mouseX;
  posY=mouseY;
  velX=random(-4,10);
  velY=random(-6,14);
  sz = random(10,50);
  interior = random (255);
  interior2 = random(10,255);
  interior3 = random(10,255);
  colorMode(RGB);
}
  




