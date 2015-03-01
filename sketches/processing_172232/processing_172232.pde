
float posX, posY, velX, velY;
int sz = 20;

int totalRebots = 0;

void setup() {
  size(300,200);
  posX = width/2;
  posY = height/2;
  velX = random(8,15);
  velY = random(8,15);
}

void draw() {
background(0); 
actualizaPosiciones();
cuentaRebotes();
dibujaBola();

}
void actualizaPosiciones() {
  posX = posX+velX;
  posY = posY+velY;
}

void dibujaBola()

{
 fill(255);
 ellipse(posX,posY,totalRebots,totalRebots);
  
}

void cuentaRebotes(){
  
if((posX<0)||(posX>width)) {
    velX = -velX;
    totalRebots ++;
  } 
  if((posY<0)||(posY>height)) {
    velY = -velY;
    totalRebots ++;
  } 
  fill(127);
  text (totalRebots, 15, height-15);
}



 
 




