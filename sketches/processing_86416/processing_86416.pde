
// fonction des particules du monstre séparé du reste du code pour la création.

float xDotR, yDotR;
float cR, cG, cB, cT, ecRGB, ecT ;



// variable pour particule:
int nbDotPE =500;

float[] xDotPE=new float [nbDotPE]; //pour la continuité des couleurs dans les particules
float[] yDotPE=new float [nbDotPE];
float[] cRPE=new float [nbDotPE];
float[] cBPE=new float [nbDotPE];
float[] cGPE=new float [nbDotPE];
float[] cTPE=new float [nbDotPE];
float[] xyDeepPE=new float [nbDotPE];

// variable locale à detecPartEauSourie
float xVitesse = 0; //la vitesse accumulée
float yVitesse = 0; 

float k=0.15;   //premier paramètre de l'élasticité (entre 0 et 1)
float d=0.9;    //deuxième paramètre de l'élasticité (entre 0 et 1)
float xVStable=d;//PErmet de stabilisé la vitesse lorsque mousePressed=0
float yVStable=d/4;

int souriePressed=0;

float mouseXOld=0;
float mouseYOld=0;
int lastTime=0;


void setup() {
  size(400, 400);
  smooth();

  noStroke();

  cR=55;
  cG=105;
  cB=205;
  cT=105;
  ecRGB=40;
  ecT=50;
  xDotR=30;
  yDotR=30;
  setupPartEau(-100, -100, 500, 500);
}

void draw() {

  background(0, 0, 5);

  if (souriePressed==1) {

    xVitesse=(mouseX - mouseXOld);
    yVitesse=(mouseY - mouseYOld); 
    mouseXOld=mouseX; //en second pour avoir une vitesse p/r à la sourie et rachaichir
    mouseYOld=mouseY;  

    dessinPartEau(-100, -100, 500, 500);
    xVitesse = d * (xVitesse + k * (mouseX - mouseXOld)); //PErmet d'être pret lorsque mouseRelease 
    yVitesse = d * (yVitesse + k * (mouseY - mouseYOld));
  }

  else { 
    mouseXOld=mouseX; //présent afin d'initialié le mouseOld, 
    mouseYOld=mouseY;
    xVitesse = d * (xVitesse + k);
    yVitesse = d * (yVitesse + k);
    dessinPartEau(-100, -100, 500, 500);
  }
}


void mousePressed() {
  if ( mouseButton == LEFT ) { //appliqué uniquement 1 fois
    souriePressed = 1;
    xVStable=0;
    yVStable=0;
  }
}

void mouseReleased() {
  souriePressed = 0;
  xVStable=d;
  yVStable=d/1.5;
}

void dessinPartEau(float gaucheBox, float hautBox, float droiteBox, float basBox) {
  
  
  
  for (int i=0;i<nbDotPE;i++) {

   fill (cGPE[i], cGPE[i], cBPE[i], cTPE[i]); 


    xDotPE[i] = xDotPE[i] + (xVitesse-xVStable)*xyDeepPE[i]*1.3;
    yDotPE[i] = yDotPE[i] + (yVitesse-yVStable)*xyDeepPE[i]*1.3;
    xDotR=30*(xyDeepPE[i]);
    yDotR=30*(xyDeepPE[i]);

    if (xDotPE[i]>droiteBox+xDotR) {
      xDotPE[i] = xDotPE[i] - droiteBox + xDotR  + gaucheBox ;
    }
    if (yDotPE[i] > basBox + yDotR ) {
      yDotPE[i] = yDotPE[i] - basBox + yDotR  + hautBox ;
    }
    if (xDotPE[i] < gaucheBox -xDotR) {
      xDotPE[i] = xDotPE[i] + droiteBox - xDotR  - gaucheBox ;
    }
    if (yDotPE[i]<hautBox-yDotR) {
      yDotPE[i] = yDotPE[i] + basBox - yDotR  - hautBox ;
    }
    ellipse (xDotPE[i], yDotPE[i], xDotR, yDotR); // ne dessine pas lorsque hors cadre!!
  }
}

void setupPartEau(float gaucheBox, float hautBox, float droiteBox, float basBox) {//forme pour le fond afin qu'il ne se déplace pas avec x et y

  for (int i=0;i<nbDotPE;i++) {
    xyDeepPE[i] = random(0.2, 1.2); 
    xDotPE[i] = random (gaucheBox, gaucheBox+droiteBox);

    yDotPE[i] = random(hautBox, hautBox+basBox); 
    cRPE[i]=(int)random ( cR-ecRGB, cR+ecRGB)*map(xyDeepPE[i], 0.2, 1.2, 0.6, 1.2);
    cGPE[i]=(int)random ( cG-ecRGB, cG+ecRGB)*map(xyDeepPE[i], 0.2, 1.2, 0.6, 1.2);
    cBPE[i]=(int)random ( cB-ecRGB, cB+ecRGB)*map(xyDeepPE[i], 0.2, 1.2, 1.5, 0.6);
    cTPE[i]=(int)random ( cT-ecT, cT+ecT)*map(xyDeepPE[i], 0.2, 1.2, 0.6, 1.2);
  }
}
