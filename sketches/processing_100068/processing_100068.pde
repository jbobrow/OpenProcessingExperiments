
int timeOld, timeNew;
int dt;
ball pelota;
ball pelotaB;
  
void setup() {  
  frameRate(60);
  size(400,500);
  //size(displayWidth,displayHeight);
  smooth();
  
  pelota = new ball(10, 30);
  pelotaB = new ball(20, 10);
  timeOld = 0;
}

void draw() {
  background(200);
  timeNew = millis();
  dt = (timeNew - timeOld);
  pelota.mostrar(dt);
  pelotaB.mostrar(dt);
  
  timeOld = timeNew;
  
          
}


class ball {
  int radio;
  float posX, posY;
  
  int dirX, dirY;
  float velX, velY;
  float dx, dy;
 
  
  ball(int radio, float velocidad){
    this.radio = radio;  
    posX = 100;
    posY = 100;
    
    dirX = round( pow(-1,round(random(1,10)) ) );
    dirY = round( pow(-1,round(random(1,10)) ) );
    
    velX = velocidad*dirX;
    velY = velocidad*dirY;
  } 
  
  void mostrar(int dt){
    ellipse(posX,posY, 2*radio, 2*radio);
    
    dx = velX*dt/100;
    dy = velY*dt/100;

    posX += dx;
    posY += dy;
  
    if (velX < 0 && posX <= 0 || velX > 0 && (posX + radio) >= width) 
          velX = -velX;
    if (velY < 0 && posY < 0 || velY > 0 && (posY + radio) >= height - radio) 
          velY = -velY;
   
  }
}


