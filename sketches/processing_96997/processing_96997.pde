
float posX, posY, velX, velY;
float sz = 80;
void setup() {
  size(800, 600);
  posX = width/2;
  posY = height/2;
  velX = 5;
  velY = 5;
  
}

void draw() {
  background(0,0,250);
  posX = posX+velX;
  posY = posY+velY;
  fill(250, 250, 0);
  ellipse(posX, posY, sz, sz);
  fill(0);
  ellipse(posX-10, posY-15, 10, 10);
  ellipse(posX+10, posY-15, 10, 10);
  noFill();
  strokeWeight(5);
  arc(posX, posY, 50, 50, 0, PI);
  if ((posX<40)||(posX>width-40)) {
    velX = -velX;
  } 
  if ((posY<40)||(posY>height-40)) {
    velY = -velY;
  }
  if(posX>width/2){
    background(250,250,0);
    fill(0,0,250);
    ellipse(posX,posY,sz,sz);
    fill(0);
   ellipse(posX-10, posY-15, 10, 10);
  ellipse(posX+10, posY-15, 10, 10);
  strokeWeight(5);
  noFill();
 
  arc(posX, posY, 50, 50, 0, PI);
 
  }

if(mousePressed==true){
  fill(0);
  ellipse(posX+42,posY,15,30);
  ellipse(posX-42,posY,15,30);
  noFill();
  arc(posX,posY-5,90,90,PI,TWO_PI);
  velX=random(-10,10);
  velY=random(-10,10);
  
 
 }
}





