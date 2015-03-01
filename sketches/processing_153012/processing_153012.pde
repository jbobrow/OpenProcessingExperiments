
SpaceInvader[] arregloSpaceIvader = new SpaceInvader[4];

int timeStart;
int timeEnd;
int xStep;
int yStep;
boolean cambio;
int limiteIZQ;
int limiteDER;
int desplazamiento;
int direccionX;
int direccionY;

void setup() {
  size(500, 500);
  xStep = 60;
  yStep = 50;
  
  timeStart = millis();
  cambio = false;
  desplazamiento = 120;
  for (int i=0;i<arregloSpaceIvader.length;i++) {
    arregloSpaceIvader[i] = new SpaceInvader(xStep+desplazamiento*i, yStep);
  }    
  limiteIZQ = 60;
  limiteDER = width -60;
  direccionX = 20;
  direccionY = 20;
}

void draw() {
  background(193, 172, 172);

  timeEnd = millis();
  if (timeEnd - timeStart > 1000)
  {
    for (int i=0;i<arregloSpaceIvader.length;i++) {
      arregloSpaceIvader[i].move(xStep+desplazamiento*i, yStep);
    }
    timeStart = timeEnd;
    xStep+=direccionX;
    yStep+=direccionY;
    cambio= !cambio;
    
    if(xStep+desplazamiento*(arregloSpaceIvader.length-1) > limiteDER || xStep < limiteIZQ){
      direccionX *= -1;
    }
    
  }


  if (cambio) {
    for (int i=0;i<arregloSpaceIvader.length;i++) {
      arregloSpaceIvader[i].displayA();
    }
  }
  else {
    for (int i=0;i<arregloSpaceIvader.length;i++) {
      arregloSpaceIvader[i].displayB();
    }
  }
}

class SpaceInvader {
  int x = 0;
  int y = 0;
  
  SpaceInvader(){
  }
  
  SpaceInvader(int x, int y){
    move(x,y);
  }

  void move(int x, int y) {
    this.x = x - 55;
    this.y = y - 35;
  }

  void displayA() {
    noStroke();
    fill(random(0, 255), random(0, 255), random(0, 255));
    rect(x+20, y+0, 10, 10);
    rect(x+80, y+0, 10, 10);
    
    rect(x+30, y+10, 10, 10);
    rect(x+70, y+10, 10, 10);
    
    rect(x+20, y+20, 10, 10);
    rect(x+30, y+20, 10, 10);
    rect(x+40, y+20, 10, 10);
    rect(x+50, y+20, 10, 10);
    rect(x+60, y+20, 10, 10);
    rect(x+70, y+20, 10, 10);
    rect(x+80, y+20, 10, 10);
    
    rect(x+10, y+30, 10, 10);
    rect(x+20, y+30, 10, 10);
    rect(x+40, y+30, 10, 10);
    rect(x+50, y+30, 10, 10);
    rect(x+60, y+30, 10, 10);
    rect(x+80, y+30, 10, 10);
    rect(x+90, y+30, 10, 10);


    rect(x+0, y+40, 10, 10);
    rect(x+10, y+40, 10, 10);
    rect(x+20, y+40, 10, 10);
    rect(x+30, y+40, 10, 10);
    rect(x+40, y+40, 10, 10);
    rect(x+50, y+40, 10, 10);
    rect(x+60, y+40, 10, 10);
    rect(x+70, y+40, 10, 10);
    rect(x+80, y+40, 10, 10);
    rect(x+90, y+40, 10, 10);
    rect(x+100, y+40, 10, 10);

    rect(x+0, y+50, 10, 10);
    rect(x+20, y+50, 10, 10);
    rect(x+30, y+50, 10, 10);
    rect(x+40, y+50, 10, 10);
    rect(x+50, y+50, 10, 10);
    rect(x+60, y+50, 10, 10);
    rect(x+70, y+50, 10, 10);
    rect(x+80, y+50, 10, 10);
    rect(x+100, y+50, 10, 10);

    rect(x+0, y+60, 10, 10);
    rect(x+20, y+60, 10, 10);
    rect(x+80, y+60, 10, 10);
    rect(x+100, y+60, 10, 10);

    rect(x+30, y+70, 10, 10);
    rect(x+40, y+70, 10, 10);
    rect(x+60, y+70, 10, 10);
    rect(x+70, y+70, 10, 10);
  }
  
  void displayB() {
    noStroke();
    fill(random(0, 255), random(0, 255), random(0, 255));
    rect(x+20, y+0, 10, 10);
    rect(x+80, y+0, 10, 10);
    
    rect(x+0, y+10, 10, 10);
    rect(x+30, y+10, 10, 10);
    rect(x+70, y+10, 10, 10);
    rect(x+100, y+10, 10, 10);
    
    rect(x+0, y+20, 10, 10);
    rect(x+20, y+20, 10, 10);
    rect(x+30, y+20, 10, 10);
    rect(x+40, y+20, 10, 10);
    rect(x+50, y+20, 10, 10);
    rect(x+60, y+20, 10, 10);
    rect(x+70, y+20, 10, 10);
    rect(x+80, y+20, 10, 10);
    rect(x+100, y+20, 10, 10);
    
    rect(x+0, y+30, 10, 10);
    rect(x+10, y+30, 10, 10);
    rect(x+20, y+30, 10, 10);
    rect(x+40, y+30, 10, 10);
    rect(x+50, y+30, 10, 10);
    rect(x+60, y+30, 10, 10);
    rect(x+80, y+30, 10, 10);
    rect(x+90, y+30, 10, 10);
    rect(x+100, y+30, 10, 10);

    rect(x+0, y+40, 10, 10);
    rect(x+10, y+40, 10, 10);
    rect(x+20, y+40, 10, 10);
    rect(x+30, y+40, 10, 10);
    rect(x+40, y+40, 10, 10);
    rect(x+50, y+40, 10, 10);
    rect(x+60, y+40, 10, 10);
    rect(x+70, y+40, 10, 10);
    rect(x+80, y+40, 10, 10);
    rect(x+90, y+40, 10, 10);
    rect(x+100, y+40, 10, 10);

    
    rect(x+10, y+50, 10, 10);
    rect(x+20, y+50, 10, 10);
    rect(x+30, y+50, 10, 10);
    rect(x+40, y+50, 10, 10);
    rect(x+50, y+50, 10, 10);
    rect(x+60, y+50, 10, 10);
    rect(x+70, y+50, 10, 10);
    rect(x+80, y+50, 10, 10);
    rect(x+90, y+50, 10, 10);
    

    
    rect(x+20, y+60, 10, 10);
    rect(x+80, y+60, 10, 10);
    

    rect(x+10, y+70, 10, 10);
    rect(x+90, y+70, 10, 10);
  }
}



