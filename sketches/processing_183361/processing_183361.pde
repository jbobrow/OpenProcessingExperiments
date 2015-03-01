
float posX, posY;
float sz = 20;
float velX = random(-10,10);
float velY = random(-10,10);
PImage space;
PImage iron;


void setup(){
  size(600,600);
  posX = width/2;
  posY = height/2;
  velX = 5;
  velY = 5;
  space = loadImage ("space1.jpg");
  

  
  
}

void mousePressed () {
posX = mouseX;
posY = mouseY;
velX = random(-10,10);
velY = random(-10,10);
sz = random (40,60);
fill(random (255), random (0), random(255));
}


void draw(){
  background(255);
  image (space,0,0);
 
  posX = posX+velX;
  posY = posY+velY;
  
  
//círculo y rebote contra paredes
  
noStroke();
  ellipse(posX,posY,sz,sz);
  

  if((posX-sz/2<0)||(posX>width-80)){
    velX = -velX;
  } 

  if((posY-sz/2<0)||(posY>height-80)){
    velY = -velY;
   
  } 

  if((posX-sz/2<0)||(posX<80)){
    velX = -velX;
  } 
  if((posY-sz/2<0)||(posY<80)){
    velY = -velY;
  } 

}



