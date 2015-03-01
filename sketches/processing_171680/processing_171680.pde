
float posX, posY, velX, velY;
int sz = 20;
int recordedMillis = 0;
int interval = 2000;
int totalRebots = 0;

void setup() {
   
    //fill(255,0,0,30);
    //rect(0,0,width, height);
    //noFill();
       
  size(300, 200);
   //background(200, 200, 200); 
  posX = width/2;
  posY = height/2;
  velX = 10;
  velY = 10;
}

void actualizaPosiciones() {
  if (recordedMillis + interval < millis()) {
    background(0, 0, 0);
    text ("Slow Motion",width/2-30,height/2); 
   frameRate(10);
    recordedMillis = millis();
  }
  
 else if (recordedMillis + interval/2 < millis()){
    background(200, 200, 200);  
   frameRate(60);
   // recordedMillis = millis();
  }
    posX = posX+velX;
    posY = posY+velY;

    if ((posX<0)||(posX>width)) {
      velX = -velX;
      totalRebots ++;
    } 
    //comprobem posY
    if ((posY<0)||(posY>height)) {
      velY = -velY;
      totalRebots ++;
    } 
    fill(127);
  }
  
  void dibujaBola() {
    fill(255);
    ellipse(posX, posY, totalRebots, totalRebots);
  }

  void cuentaRebotes() {
    text (totalRebots, 15, height-15);
  }

  void draw() {
    actualizaPosiciones();
    dibujaBola();
    cuentaRebotes();
  }


