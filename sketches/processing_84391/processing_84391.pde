
int chao;

float d;
float posX;
float posY;
float altura;
float largura;
float vel;
float vely;
float grav;
boolean pulando;
boolean dir;
boolean bafo;
float t0;
PImage dani;
int bafoQuadro;
int life;
boolean reset;

int i;
int t;
int v;
int s;
int k;
float p;
float r;

boolean teclaD;
boolean teclaA;
boolean teclaW;
boolean teclaS;
boolean tecla;

float cig;
float cigPosX;
float cigPosY;
boolean cigarro;
float lcig;
float acig;
boolean expCig;
int expc;

float posIni1X;
float posIni1Y;
float lIni1;
float aIni1;
boolean expIni1;
int exp1;
PImage porco;
float posIni2X;
float posIni2Y;
float lIni2;
float aIni2;
boolean expIni2;
int exp2;
PImage cavalo;
float posIni3X;
float posIni3Y;
float lIni3;
float aIni3;
boolean expIni3;
int exp3;
PImage moto;
boolean inimigo1;
boolean inimigo2;
boolean inimigo3;
float vel1;
float vel2;
float vel3;


void setup() {

  size(800, 600);  
  imageMode(CENTER);
  chao=height-50;
  dani = loadImage("dani_teste.png");
  porco = loadImage("porcoc.png");
  cavalo = loadImage("cavaloc.png");
  moto = loadImage("motoc.png");
  altura=166;
  largura=187;
  vel=10;
  vely=1300;
  grav=3000;
  t=0;
  posIni1X=-2*lIni1;
  posIni1Y=-2*aIni1;
  posIni2X=-2*lIni2;
  posIni2Y=-2*aIni2;
  posIni3X=-2*lIni3;
  posIni3Y=-2*aIni3;  
  vel1=0;
  vel2=0;
  vel3=0;
  v=0;
  life=100;
  lIni1=76;
  aIni1=58;
  lIni2=58;
  aIni2=52;
  lIni3=95;
  aIni3=58;
  lcig=30;
  acig=10;
  r=0.1;
  exp1=0;


  posX=width/2;
  posY=height;

  cig=100;
  cigPosX=(int)random(width);
  cigPosY=0;
}

void draw() {


  background(255);
  noStroke();
  fill(100);
  rect(0, chao, width, height-chao);  

  // PONTUAÇÃO ----------------------------------------------------------------------------------

  r=r+0.01;
  s=int(r);

  i = int(cig);
  fill(0);
  textSize(26);
  text("BAFO="+i, 30, 30);
  fill(0);
  textSize(26);
  text("LIFE="+life, 30, 60);
  fill(0);
  textSize(26);
  text("PONTOS="+s, 30, 90);

  // TRATA JOGADOR ------------------------------------------------------------------------------------------------

  if (teclaD==true) {
    posX=posX+vel;
    dir=true;
  }
  if (teclaA==true) {
    posX=posX-vel;
    dir=false;
  }
  if (posX>width-largura/2) {
    posX=width-largura/2;
  }
  if (posX<0+largura/2) {
    posX=0+largura/2;
  }
  if (teclaW==true && pulando==false) {
    pulando=true;
    t0=millis()/1000.0f;
  }
  if (teclaS==true) {
    bafo=true;
    cig=cig*0.99;
  }
  if (bafo) {
    bafoQuadro++;
    if (bafoQuadro>cig) {
      bafoQuadro=0;
      bafo=false;
    }
  }
  if (pulando) {
    float n;
    n=millis()/1000.0f-t0;
    posY=chao-100-vely*n+(grav/2)*n*n;
  } 
  if (posY>chao-100) {
    posY=chao-100;
    pulando=false;
  }
  if (!dir) {
    pushMatrix();
    scale(-1, 1);
    image(dani, -posX, posY);
    //image(queixo,-posX,posY);
    popMatrix();
  } 
  else {
    image(dani, posX, posY);
  }    

  // TRATA INIMIGOS ----------------------------------------------------------------------------------------------------------

  if (!inimigo1) {
    float p = random(1, 1000);
    if (p<5) {
      inimigo1=true;  
      posIni1X=0;
      posIni1Y=random(200, 520);
      vel1=random(1, 15);
    }
  }  
  else {
    posIni1X+=vel1;    
    if (posX - posIni1X <= 80 &&
      posIni1X - posX <= 80 &&
      posY - posIni1Y <= 100 &&
      posIni1Y - posY <= 100) {
      life=life-5; 
      //inimigo1=false;
      expIni1=true;
      posX+=4*vel1;
      background(255, 0, 0);
      //posIni1X=-lIni1/2;
    }    
    if (posIni1X>width+lIni1/2) {
      inimigo1=false;
    }
  }

  if (!inimigo2) {
    float p = random(1, 1000);
    if (p<5) {
      inimigo2=true;  
      posIni2X=0;
      posIni2Y=random(200, 520);
      vel2 = random(5, 15);
    }
  }  
  else {
    posIni2X+=vel2;
    if (posX - posIni2X <= 80 &&
      posIni2X - posX <= 80 &&
      posY - posIni2Y <= 100 &&
      posIni2Y - posY <= 100) {
      life=life-5; 
      //inimigo2=false;
      expIni2=true;
      posX+=4*vel2;
      background(255, 0, 0);
      //posIni2X=-50;
    }  
    if (posIni2X>width) {
      inimigo2=false;
      posIni2X=-lIni2/2;
    }
  }  

  if (!inimigo3) {
    float p = random(1, 1000);
    if (p<5) {
      inimigo3=true;  
      //posIni3X=width;
      posIni3Y=random(200, 520);
      vel3 = random(12, 18);
    }
  }  
  else {
    posIni3X-=vel3;
    if (posX - posIni3X <= 80 &&
      posIni3X - posX <= 80 &&
      posY - posIni3Y <= 100 &&
      posIni3Y - posY <= 100) {
      life=life-5; 
      //inimigo3=false;
      expIni3=true;
      posX-=4*vel3;
      background(255, 0, 0);
      //posIni3X=width+lIni3/2;
    }  
    if (posIni3X<0) {
      inimigo3=false;
      posIni3X=width+lIni3/2;
    }
  }

  // TRATA CIGARRO -----------------------------------------------------------------------------------------

  if (!cigarro) {
    float p = random(1, 1000);
    if (p<5) {
      cigarro=true;  
      cigPosX=(int)random(lcig/2, (width-lcig/2));
      if (cigPosX>width-lcig/2) {
        //cigPosX=width-lcig/2;
      }
      if (cigPosX<lcig/2) {
        //cigPosX=lcig/2;
      }
      cigPosY=-lcig/2;
    }
  }  
  else {
    cigPosY+=5;
    if (cigPosY>chao) {
      cigPosY=chao;
      //k=k+1;
      if (k>30) {
        //cigarro=false;
      }  
      //cigarro=false;
    }       
    if (posX - cigPosX <= 80 &&
      cigPosX - posX <= 80 &&
      posY - cigPosY <= 100 &&
      cigPosY - posY <= 100) {
      life=life-1; 
      cig=cig+10;
      background(0, 255, 0);
      cigPosY=-lcig/2;
      cigarro=false;
    }  
    if (cig>100) {
      cig=100;
    }
  }

  // DETECÇÃO DO BAFO NOS INIMIGOS -----------------------------------------------------------------------------------------------

  if (bafo) {    
    if (!dir) {  
      ellipseMode(RADIUS);  
      fill(0, 220, 20);  
      ellipse(posX-60, posY+60, 30+bafoQuadro*5, 30+bafoQuadro*5);
      if (!expIni1) {
        if (inimigo1) {
          if (posX-60+30+bafoQuadro*5 >= posIni1X &&
            posIni1X >= posX-60-30-bafoQuadro*5 &&
            posY-60+30+bafoQuadro*5 >= posIni1Y &&
            posIni1Y >= posY-60-30-bafoQuadro*5) {
            expIni1=true;
            r=r+1;
          }
        }
      }
    }    
    if (dir) {
      ellipseMode(RADIUS);  
      fill(0, 220, 20);  
      ellipse(posX+60, posY+60, 30+bafoQuadro*5, 30+bafoQuadro*5);
      if (!expIni1) {
        if (inimigo1) {
          if (posX+60+30+bafoQuadro*5 >= posIni1X &&
            posIni1X >= posX+60-30-bafoQuadro*5 &&
            posY+60+30+bafoQuadro*5 >= posIni1Y &&
            posIni1Y >= posY+60-30-bafoQuadro*5) {
            expIni1=true;
            r=r+1;
          }
        }
      }
    }    

    if (!dir) {  
      ellipseMode(RADIUS);  
      fill(0, 220, 20);  
      ellipse(posX-60, posY+60, 30+bafoQuadro*5, 30+bafoQuadro*5);
      if (!expIni2) {
        if (inimigo2) {          
          if (posX-60+30+bafoQuadro*5 >= posIni2X &&
            posIni2X >= posX-60-30-bafoQuadro*5 &&
            posY-60+30+bafoQuadro*5 >= posIni2Y &&
            posIni2Y >= posY-60-30-bafoQuadro*5) {
            expIni2=true;
          }
        }
      }
    } 
    if (dir) {
      ellipseMode(RADIUS);  // Set ellipseMode to RADIUS
      fill(0, 220, 20);  // Set fill to white
      ellipse(posX+60, posY+60, 30+bafoQuadro*5, 30+bafoQuadro*5);
      if (!expIni2) {
        if (inimigo2) {
          if (posX+60+30+bafoQuadro*5 >= posIni2X &&
            posIni2X >= posX+60-30-bafoQuadro*5 &&
            posY+60+30+bafoQuadro*5 >= posIni2Y &&
            posIni2Y >= posY+60-30-bafoQuadro*5) {
            expIni2=true;
          }
        }
      }
    } 

    if (!dir) {  
      ellipseMode(RADIUS);  
      fill(0, 220, 20);  
      ellipse(posX-60, posY+60, 30+bafoQuadro*5, 30+bafoQuadro*5);
      if (!expIni3) {
        if (inimigo3) {
          if (posX-60+30+bafoQuadro*5 >= posIni3X &&
            posIni3X >= posX-60-30-bafoQuadro*5 &&
            posY-60+30+bafoQuadro*5 >= posIni3Y &&
            posIni3Y >= posY-60-30-bafoQuadro*5) {
            expIni3=true;
          }
        }
      }
    } 
    if (dir) {
      ellipseMode(RADIUS);  // Set ellipseMode to RADIUS
      fill(0, 220, 20);  // Set fill to white
      ellipse(posX+60, posY+60, 30+bafoQuadro*5, 30+bafoQuadro*5);
      if (!expIni3) {
        if (inimigo3) {
          if (posX+60+30+bafoQuadro*5 >= posIni3X &&
            posIni3X >= posX+60-30-bafoQuadro*5 &&
            posY+60+30+bafoQuadro*5 >= posIni3Y &&
            posIni3Y >= posY+60-30-bafoQuadro*5) {
            expIni3=true;
          }
        }
      }
    } 

    if (!dir) {  
      ellipseMode(RADIUS);  // Set ellipseMode to RADIUS
      fill(0, 220, 20);  // Set fill to white
      ellipse(posX-60, posY+60, 30+bafoQuadro*5, 30+bafoQuadro*5);
      if (!expCig) {
        if (cigarro) {
          if (posX-60+30+bafoQuadro*5 >= cigPosX &&
            cigPosX >= posX-60-30-bafoQuadro*5 &&
            posY+60+30+bafoQuadro*5 >= cigPosY &&
            cigPosY >= posY+60-30-bafoQuadro*5) {
            expCig=true;
          }
        }
      }
    }    
    if (dir) {
      ellipseMode(RADIUS);  
      fill(0, 220, 20);  
      ellipse(posX+60, posY+60, 30+bafoQuadro*5, 30+bafoQuadro*5);
      if (!expCig) {
        if (cigarro) {
          if (posX+60+30+bafoQuadro*5 >= cigPosX &&
            cigPosX >= posX+60-30-bafoQuadro*5 &&
            posY+60+30+bafoQuadro*5 >= cigPosY &&
            cigPosY >= posY+60-30-bafoQuadro*5) {
            expCig=true;
          }
        }
      }
    }
  }  

  // EXPLOSAO INIMIGOS --------------------------------------------------------------------------------------------

  if (expIni1) {  
    exp1=exp1+1;
    ellipseMode(RADIUS);  
    fill(255, 0, 0);  
    ellipse(posIni1X, posIni1Y, 10+exp1*10, 10+exp1*10);
    if (exp1>1) {
      exp1=0;
      expIni1=false; 
      inimigo1=false;          
      posIni1X=-lIni1/2;
    }
  }     
  if (expIni2) {  
    exp2=exp2+1;
    ellipseMode(RADIUS);  
    fill(255, 0, 0);  
    ellipse(posIni2X, posIni2Y, 10+exp2*10, 10+exp2*10);
    if (exp2>1) {
      exp2=0;
      expIni2=false; 
      inimigo2=false;          
      posIni2X=-lIni2/2;
    }
  } 
  if (expIni3) {  
    exp3=exp3+1;
    ellipseMode(RADIUS);  
    fill(255, 0, 0);  
    ellipse(posIni3X, posIni3Y, 10+exp3*10, 10+exp3*10);
    if (exp3>1) {
      exp3=0;
      expIni3=false; 
      inimigo3=false;          
      posIni3X=width+lIni3/2;
    }
  }  
  if (expCig) {  
    expc=expc+1;
    ellipseMode(RADIUS);  
    fill(255, 0, 0);  
    ellipse(cigPosX, cigPosY, 10+expc*10, 10+expc*10);
    if (expc>10) {
      expc=0;
      expCig=false; 
      cigarro=false;          
      cigPosY=-acig/2;
    }
  }    

  // DESENHA TUDO ----------------------------------------------------------------------------------------------------

  image(porco, posIni1X, posIni1Y);
  image(cavalo, posIni2X, posIni2Y);
  image(moto, posIni3X, posIni3Y);
  noStroke();
  fill(255, 0, 0);
  rect(cigPosX, cigPosY-10, lcig, acig);
  textSize(12);
  text("CIGARRO", cigPosX, cigPosY-20);

  // GAME OVER -------------------------------------------------------------------------------------------------------

  if (life<1) {
    background(0);
    noStroke();
    fill(255, 0, 0);
    textSize(72);
    text("GAME OVER!", 50, 300);
    fill(0, 0, 255);
    textSize(36);
    text("PONTOS="+s, 50, 500);
    stop();
  }
}

// BOTÕES ---------------------------------------------------------------------------------------------------------

void keyPressed() {
  if (key=='d') {
    teclaD=true;
  }
  if (key=='a') {
    teclaA=true;
  }
  if (key=='w') {
    teclaW=true;
  }
  if (key=='s') {
    teclaS=true;
  }
  if (key==' ') {
    tecla=true;
  }
}

void keyReleased() {
  if (key=='d') {
    teclaD=false;
  }
  if (key=='a') {
    teclaA=false;
  }
  if (key=='w') {
    teclaW=false;
  }
  if (key=='s') {
    teclaS=false;
  }
  if (key==' ') {
    tecla=false;
  }
}



