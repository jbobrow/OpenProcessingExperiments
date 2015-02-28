
float posX= random(600);
float posY= random(600);
float velX = random(-10, 10);
float velY = random(-10,10);
float sizeMod = 0; 
float sizeVal = .1;

void setup() {
  size(600, 600);
}

void draw(){
  background(0);
  color c = color(random(255),random(255),random(255));
  color cc = color(random(255),random(255),random(255));
 
  if (sizeMod > 5 || sizeMod < -5) 
  { 
     //sizeMod = 0;
     sizeVal = -sizeVal;
  }
   sizeMod += sizeVal;
  fill(c);
  stroke(cc);
  ellipse(posX, posY, 50*sizeMod, 50*sizeMod);
  posX += velX; 
  posY += velY; 
  
  if (posX > width || posX <0)
    velX = -velX;
    velX += random(-1,1);
    velY += random(-1,1);
    
    
  if (posY > height || posY<0)
    velY = -velY;
    velX += random(-1,1);
    velY += random(-1,1);
    /*
  if (posX <width-1 || posX>1)
    velX = velX *1;
    */
 // if (
}


