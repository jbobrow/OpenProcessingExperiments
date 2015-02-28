
forme[] plsformes = new forme[10];
boolean dessin = false;
boolean nettoie = true;

void setup(){
  //size(1748,2480);
  size(742,302);
  background(255);
  smooth();

  for(int i=0; i<plsformes.length; i++){
    plsformes[i]= new forme();
  }
}

void draw(){

  if(nettoie == true){
    nettoyer();
  }
  if(dessin == true){
    dessiner();
  }
}

void nettoyer(){
  noStroke();
  fill(255);
  rect(0,0,width,height);
  nettoie = false;
  dessin = true;
}

void dessiner(){
  for(int i=0; i<plsformes.length; i++){
    plsformes[i].draw();
  } 
}

class forme{

  float xA;
  float xB;
  float yA;
  float yB;
  float dX;
  float dY;
  float X;
  float Y;
  float tB;
  float tA;
  float dT;
  float T;
  float vieT;
  float vieX;
  float vieY;
  float vitS;
  float prct;
  float sW;
  float sC;
  float rC;
  float vC;
  float bC;

  void draw(){

    if(prct <= 0.0){
      vitS = 0.002/2;
      xB = random(50+((width-height)/2),(width-((width-height)/2))-50);
      yB = random(50,height-50);
      tB = random(10/4,10/2);
      tA = random(20/2,100/4);
      sC = 0;
      rC = 255;
      vC = 255;
      bC = 255;
      xA = width/2;
      yA = height/2;
      dT = tB - tA;
      dX = xB - xA;
      dY = yB - yA;
      vieT = 0;
      vieX = 0;
      vieY = 0;
    }


    prct += vitS;

    if (prct < 1.0) {
      vieT = random(-2/2,2/2);
      vieX += random(-10/4,10/4);
      vieY += random(-10/4,10/4);
      X = (xA + (prct * dX) + vieX);
      Y = (yA + (prct * dY) + vieY);
      T = (tA + (prct * dT) + vieT);
    }

    if (prct > 0.9999) {
      sC = 255;
      vC = 0;
      rC = 0;
    }

    if (T < 0){
      T = 1;
    }

    if (prct >= 1.0){
      prct = 0.0;
      nettoie = true;
    }

    sW = (1/20)+(T/40);
    strokeWeight(sW);
    stroke(0,0,sC);
    fill(rC,vC,bC);
    ellipse(X,Y,T,T);
  }
}

