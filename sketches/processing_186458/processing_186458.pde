
//mides rectangle gran
  int esquerra = 100; 
  int dret = 700;
  int alt = 100;
  int baix = 500;
//distancia entre rectangles
  int ample = 60;
//mides rectangle petit
  int esquerrap = esquerra + ample; 
  int dretp = dret - ample;
  int altp = alt + ample;
  int baixp = baix - ample;
//taules boles minuts
  float [] posX = new float [60];
  float [] posY = new float [60];
//diàmetre boles
  int dia = 18;
//taules rectangles hores
  float [] hora_altX = new float [12];
  float [] hora_altY = new float [12];
  float [] hora_baixX = new float [12];
  float [] hora_baixY = new float [12];



void setup() {
  //límit posició boles
  int left = 125;
  int right = 650;
  int up = 125;
  int down = 460;
  int posX_act = left;
  int posY_act = up;
  
 size(800,600); 
 //preparo dades boles minuts
   for (int i =0; i<60; i++) {
    posX[i] = posX_act;
    posY[i] = posY_act;
     
    if ((posX_act < right) && (posY_act == up)) {
      posX_act = (posX_act + 30);   //quan les boles vagin de 100 fins a 700, se li sumarà 27 cada cop
    }                    
    else if ((posX_act >= right) && (posY_act < down)) { //quan les boles arribin a 700, baixaran cap a baix fins al "down"
      posY_act = (posY_act+29); 
    }
    
    else if ((posX_act <= left) && (posY_act > up)){   //de baix a dalt
      posY_act = (posY_act-31); 
    }
    else if ((posY_act >= down)) { //quan arribin al 475, tiraran enrere fins a la posició "left"
     posX_act = (posX_act - 30); 
   }
  }
  
 //preparo dades rectangles hores 
 int haltX_act = esquerrap;
 int haltY_act = altp;
 int hbaixX_act = dretp;
 int hbaixY_act = baixp;
 //la distància entre rectangles, cada vegada més petits
 int rect_difX = 15;
 int rect_difY = 12;
 //preparem les coordenades dels 12 rectangles que vull pintar. Parteixo de la posició del rect gran i el vaig reduint
 for (int i =0; i<12; i++) {
    hora_altX [i] = haltX_act; 
    hora_altY [i] = haltY_act; 
    hora_baixX [i] = hbaixX_act;
    hora_baixY [i] = hbaixY_act;
  
    haltX_act = haltX_act + rect_difX;
    haltY_act = haltY_act + rect_difY;
    hbaixX_act = hbaixX_act - rect_difX;
    hbaixY_act = hbaixY_act - rect_difY;
 }    
    
}

void draw() {

pinta_segons();
pinta_quadrats();
pinta_minuts();
pinta_hores();
  
}

////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////FUNCIONS/////////////////////////////////////



void pinta_segons() {
  float segons = second();
 // background(segons*(segons/5), segons*4, segons*4);
 background(segons*4, segons*4, segons*4);

}

void pinta_quadrats() {
    
  rectMode(CORNERS);
  fill(100,210,255);
  stroke(100,210,255);
  rect(esquerra, alt, dret, baix);
 
  fill(255,90,90); 
  stroke(255,90,90);
  rect(esquerrap, altp, dretp, baixp);
 
}

void pinta_minuts() {
  float minut = minute();
  
  for (int i=0; i<minut; i++) {  
    fill(100, 100, 100);
    stroke(100, 100, 100);
    ellipse(posX[i], posY[i], dia, dia);
  }
}

void pinta_hores() {
  int hora12 = hour(); //perquè sigui sobre 12h i no sobre 24.
  
  if (hora12>12) {
    hora12 = hora12-12; 
  }
  
//pintem el contorn dels 12 rectangles; buits
    for (int i=0; i<12; i++) {  
    rectMode(CORNERS);
    stroke(200,200,200);
    rect(hora_altX [i], hora_altY [i], hora_baixX [i], hora_baixY [i]);
  }
  
//pintem l'interior dels 12 rectangles segons la hora. Les hores corresponen als rectangles buits.

    fill(200,200,200);
    stroke(200,200,200);
    rect(hora_altX [hora12], hora_altY [hora12], hora_baixX [hora12], hora_baixY [hora12]);

}
