
Circulo[] arrayC={};
void setup(){
  //size(screen.width,screen.height);
  size(800,600);
  DibujaCirculo();
  frameRate(30);
  background(255,255,255);
}
void draw(){
  //background(255,255,255);
  for(int i=0;i< arrayC.length;i++){
    Circulo thisCir=arrayC[i];
    thisCir.update();
  }
  textMode(SCREEN);
  float frames = frameRate;
  text(frames,100,100);
}

void DibujaCirculo(){
  for(int i=0;i<70;i++){
    Circulo thisCir = new Circulo();
    arrayC = (Circulo[])append(arrayC,thisCir);
  }
}

void mousePressed(){
  saveFrame();
}

class Circulo{
  float posX,posY;
  float radio;
  color fillcol;
  float alfa;
  float Xvel,Yvel;
  float accel;
  float grav;
  float VarX;
  float VarY;
  
  Circulo(){
    posX=random(width);
    posY=random(height);
    radio = random(10)+30;
    fillcol = color(random(255),random(255),random(255));
    alfa = random(255);
    Xvel =random(1,4);
    Yvel =random(1,4);
    VarX = random(100);
    VarY = random(100);
  }
  
  void dibujar(){
    smooth();
    noStroke();
    fill(fillcol,50);
    VarX += 0.005;
    VarY += 0.005;
    posX += 2*Xvel*noise(VarX) - Xvel;
    posY += 2*Yvel*noise(VarY) - Yvel;
    //ellipse(posX,posY,radio,radio);
  }
  
  void update(){
    if(posX > (width - radio/2)){Xvel = -Xvel;}
    if(posX < (radio/2)){Xvel = -Xvel;}
    if(posY > (height-radio/2)){Yvel = -Yvel;}
    if(posY < radio/2){Yvel = -Yvel;}
    
    dibujar();
    for(int i=0;i<arrayC.length;i++){
      Circulo otroC = arrayC[i];
      if(otroC != this){
        float dis = dist(posX,posY,otroC.posX,otroC.posY);
        float encimado = dis;
        if(encimado > 0 && encimado < 100){
          float midx,midy;
          encimado *= -1;
          midx = (posX+otroC.posX)/2;
          midy = (posY+otroC.posY)/2;
          strokeWeight(0.7);
          stroke(fillcol,50);
          line(posX,posY,otroC.posX,otroC.posY);
        }
      }
    }
  }
}
