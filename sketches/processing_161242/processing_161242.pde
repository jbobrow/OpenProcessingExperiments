
int positionX,positionY,directionX,directionY,taille;
float X = 255;
float Y = 232;

void setup(){
  size(600,300);
  smooth();
  background(255);
  
  //ellipse au centre
  positionX = width/2;
  positionY = height/2;
}

void draw(){
  fill(255,30);
  rect(0,0,600,300);
  
  //direction aléatoire
  directionX = int(random(-4,4));
  directionY = int(random(-4,4));
  
  positionY = positionY + directionY;
  positionX = positionX + directionX;
  
  taille = int(random(2,25));
  
  //float taille=mouseY/2;
  fill(positionX,positionY,155,99);
  
  
  noStroke();
  ellipse(positionX,positionY,taille,taille);
}



