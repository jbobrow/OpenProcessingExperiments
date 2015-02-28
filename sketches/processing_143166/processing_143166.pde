
//colors dibuix
color line_c = color(255);
color bg = color(0,0,100);
color barcol = color(255);

//marcadors
int m1 =0;
int m2 =0;
int ms1 =0; //comptadors de gols seguits
int ms2 =0;

//comptadors
int timer = 0;
int maxTimer = 80;

//mides camp (Recomanats 800x500. Hauria de funcionar amb qualsevol)
int sizeX = 800;
int sizeY = 500;
int marge = 20;
int mm = 5; //marge entre la barra i dalt del camp
int aj_m = 2; //ajust marge pels rebots


//barres
int BX = 3; //mides
int BY = 40;
int bx0 = 2*marge;
float b1x = bx0; //posicions (float perquè hi ha sinus i cosinus)
float b2x = sizeX - bx0;
float b1y = sizeY/2;
float b2y = sizeY/2;
int velB = -5; //negativa = amunt

//--- trajectes barres
float A1; //angle barres
float A2;
float[] wB = {0,0.0065,0.015,0.025}; //el primer jugador quan puja incrementa l'angle
float[] Amax = {0,-(2*PI)/6,0,0}; //angle màxim barres per trajectòria (negatiu=a dalt)
float[] focus = {0,sizeX/2,0,0}; //X centre de cada trajectòria
int i1 = 1; //índex trajectòria barres
int i2 = 1;
float[] TR= {0,sizeX/3,0,0}; //radi de la trajectòria
float S; //sinus i cossinus d'inclinació de les barres
float C;

int max = marge+mm+BY; //topall per les barres


//pilota (floats, que hi haurà sinus i cossinus)
float px = sizeX/2;
float py = sizeY/2;
float vel = 5;
float velx = vel;
float vely = -vel;
int PR = 8; // "Pilota Radi" (diàmetre, de fet)
//---- eixos alternatius (pilota) - Array (x,y)
float[] pos_a = {0,0}; //Posició eixos alternatius (vist des de la barra) 
float[] vel_a = {0,0}; //Velocitat eixos alternatius (vist des de la barra)

//bool teclat
boolean puja1 = false;
boolean puja2 = false;
boolean baixa1 = false;
boolean baixa2 = false;

boolean key_w = false;
boolean key_s = false;
boolean key_o = false;
boolean key_l = false;

//altres interruptors
boolean lineal = true;
boolean veDeFora = true; //marca si la pilota ha estat recentment en contacte amb la barra (per evitar xocs múltiples en mode curvilini)
boolean bolaEnJoc = false;
boolean resetBola = false;
boolean preparats = false;

void setup(){
 textAlign(CENTER,CENTER);
 rectMode(RADIUS);
 size(800,500); //processing.js no accepta mides al camp
 strokeWeight(3);
 setupTrajectes();
}

void draw(){
 //pseudosetup
 background(bg);
 textSize(10);
 fill(255);
 text("- LotusPong, by Rusca -",sizeX/2+5,marge/2-1);
 text("http://www.openprocessing.org/user/38506  || March 2014 @Rusca8",sizeX/2,sizeY-marge/2-1);
 noFill();
 textSize(50);
 stroke(line_c);
 rect(sizeX/2,sizeY/2,sizeX/2-marge,sizeY/2-marge);
 
 //resets & settings
 if(resetBola){ //posa la bola al mig i s'apaga
   px=sizeX/2;
   py=sizeY/2;
   resetBola=false;
 }
 if(lineal && (m1>2 || m2>2)){ //pas de lineal a curvilini
   lineal=false;
   ms1=0;
   ms2=0;
 }
 
 //marcadors
 if(preparats){
   text(m1,sizeX/3,sizeY/2);
   text(m2,sizeX*2/3,sizeY/2);
 }
 
 //marcadors de gols seguits
 if(ms1>0){
   fill(255,100);
 }else{
   noFill();
 }
 ellipse(marge/2,marge+marge/2,marge/2,marge/2);
 if(ms1>1){
   fill(255,100);
 }else{
   noFill();
 }
 ellipse(marge/2,2*marge+marge/2,marge/2,marge/2);
 if(ms1>2){
   fill(255,100);
 }else{
   noFill();
 }  
 ellipse(marge/2,3*marge+marge/2,marge/2,marge/2);
 
 if(ms2>0){
   fill(255,100);
 }else{
   noFill();
 }
 ellipse(sizeX-marge/2,sizeY-(marge+marge/2),marge/2,marge/2);
 if(ms2>1){
   fill(255,100);
 }else{
   noFill();
 }
 ellipse(sizeX-marge/2,sizeY-(2*marge+marge/2),marge/2,marge/2);
 if(ms2>2){
   fill(255,100);
 }else{
   noFill();
 }  
 ellipse(sizeX-marge/2,sizeY-(3*marge+marge/2),marge/2,marge/2);
 
 
 //càlculs
 mouBarres();
 limitBarres();
 
 if(preparats){
   if(bolaEnJoc){
     mouPilota();
   }else{ //afegeixo animació per sacar la bola quan la bola no està en joc
     saca();
   }
 }else{  //si no estan preparats (al principi) esperar que s'apretin tots els controls
   strokeWeight(2);
   textSize(18);
   if(!key_w){
     fill(255,50);
     ellipse(sizeX/3,sizeY/2-marge,3*PR,3*PR);
     fill(255);
     text("W",sizeX/3,sizeY/2-marge+0.7);
   }
   if(!key_s){
     fill(255,50);
     ellipse(sizeX/3,sizeY/2+marge,3*PR,3*PR);
     fill(255);
     text("S",sizeX/3,sizeY/2+marge-0.1);
   }
   if(!key_o){
     fill(255,50);
     ellipse(sizeX*2/3,sizeY/2-marge,3*PR,3*PR);
     fill(255);
     text("O",sizeX*2/3,sizeY/2-marge-0.1);
   }
   if(!key_l){
     fill(255,50);
     ellipse(sizeX*2/3,sizeY/2+marge,3*PR,3*PR);
     fill(255);
     text("L",sizeX*2/3,sizeY/2+marge-1);
   }
   fill(255,200);
   text("Find keys to start",sizeX/2,sizeY/2);
   if(key_o && key_l && key_w && key_s){
     preparats=true;
   }
 }
 
 //dibuix trajecte
 pintaTrajectes();
 
 //dibuix barres
 fill(barcol);
 noStroke();
 dibuixaBarres();
 
 //dibuix pilota
 if(preparats){
   ellipse(px,py,PR,PR);
 }
}
//- - - - - - - - - - - - - - - - Funcions - - - - - - - - - - - - - - - - - //
void keyPressed(){
 if(key=='o'){
   if(!key_o){
     key_o=true;
   }
  puja2=true;
 }else if(key=='l'){
   if(!key_l){
     key_l=true;
   }
  baixa2=true;
 }else if(key=='w'){
   if(!key_w){
     key_w=true;
   }
  puja1=true;
 }else if(key=='s'){
   if(!key_s){
     key_s=true;
   }
  baixa1=true;
 }
}

void keyReleased(){
 if(key=='o'){
  puja2=false;
 }else if(key=='l'){
  baixa2=false;
 }else if(key=='w'){
  puja1=false;
 }else if(key=='s'){
  baixa1=false;
 } 
}

void mouBarres(){ // ....................................................................... Barres
  if(lineal){ //primera trajectòria (recta)
    if(puja1){
      b1y+=velB;
    }
    if(baixa1){
      b1y-=velB;
    }
    if(puja2){
      b2y+=velB;
    }
    if(baixa2){
      b2y-=velB;
    }
  }else{ //Trajectòries curvilínies
    if(puja1){
      A1+=wB[i1]; //signes diferents (pujant, una barra suma angle i l'altra en treu)
    }
    if(baixa1){
      A1-=wB[i1];
    }
    if(puja2){
      A2-=wB[i2];
    }
    if(baixa2){
      A2+=wB[i2];
    }
  }
}

void limitBarres(){
  if(lineal){
   if(b1y<max){ //si puja massa, torna-la al límit superior
    b1y=max; 
   }else if(b1y>sizeY-max){ //i així amb tot
    b1y=sizeY-max; 
   }
   if(b2y<max){
    b2y=max; 
   }else if(b2y>sizeY-max){
    b2y=sizeY-max; 
   }
  }else{
    if(b1y-BY*cos(A1)<2*marge && !baixa1){ //el mateix però en curvilini. Aproximo l'angle A1 al límit com si fos Amax, per simplicitat
      A1=asin((sizeY/2-2*marge-BY*cos(Amax[i1]))/TR[i1]);
    }else if(b1y+BY*cos(A1)>sizeY-2*marge && !puja1){
      A1=-asin((sizeY/2-2*marge-BY*cos(Amax[i1]))/TR[i1]);
    }
    if(b2y-BY*cos(A2)<2*marge && !baixa2){
      A2=-asin((sizeY/2-2*marge-BY*cos(Amax[i2]))/TR[i2]);
    }else if(b2y+BY*cos(A2)>sizeY-2*marge && !puja2){
      A2=asin((sizeY/2-2*marge-BY*cos(Amax[i2]))/TR[i2]);
    }
    b1y=sizeY/2-TR[i1]*sin(A1);
    b1x=sizeX-focus[i1]-TR[i1]*cos(A1);
    b2y=sizeY/2+TR[i2]*sin(A2);
    b2x=focus[i2]+TR[i2]*cos(A2);
  }
}

void dibuixaBarres(){
  if(lineal){
    rect(b1x,b1y,BX,BY);
    rect(b2x,b2y,BX,BY);
  }else{ //quadrilàters a partir de les mides dels rectangles i el seu angle. (càlcul de les coordenades després del gir implícit)
    C=cos(A1);
    S=sin(A1);
    quad(b1x+BX*C-BY*S,b1y+BX*S+BY*C, b1x+BX*C+BY*S,b1y+BX*S-BY*C, b1x-BX*C+BY*S,b1y-BX*S-BY*C, b1x-BX*C-BY*S,b1y-BX*S+BY*C);
    C=cos(A2);
    S=sin(A2);
    quad(b2x+BX*C-BY*S,b2y+BX*S+BY*C, b2x+BX*C+BY*S,b2y+BX*S-BY*C, b2x-BX*C+BY*S,b2y-BX*S-BY*C, b2x-BX*C-BY*S,b2y-BX*S+BY*C);
  }
}

void mouPilota(){ // ...................................................................... Pilota
  if(py<marge+PR){ //bota marge alt
    vely=vel;
  }else if(py>sizeY-marge-PR){ //marge baix
    vely=-vel;
  }
  if(lineal){ //rebots mode lineal
    if(px<2*marge+BX+aj_m && px>2*marge-BX-aj_m){ //arriba a la barra1
      if(py<b1y+BY && py>b1y-BY){ //i rebota
        velx=vel; //assigno directament en lloc de canviar el signe per evitar rebots múltiples (si ve per darrere travessa i prou)
      }
    }else if(px>sizeX-2*marge-BX-aj_m && px<sizeX-2*marge+BX+aj_m){ //arriba a la barra2
      if(py<b2y+BY && py>b2y-BY){ //i rebota
        velx=-vel;
      }
    }
  }else{ //rebots trajectòries curvilínies
    if(px<sizeX/2){ //evito calcular una banda quan la pilota és a l'altra
      //ESQUERRA
      //conversió al sistema d'eixos de la barra
      pos_a[0]=(px-b1x)*cos(A1)+(py-b1y)*sin(A1); // x' de la pilota (distància en perpendicular fins a la barra)
      pos_a[1]=-(px-b1x)*sin(A1)+(py-b1y)*cos(A1); // y' de la pilota (alçada respecte el centre vertical de la barra)
      //comparació i col·lisió
      if(abs(pos_a[0])<BX+aj_m && abs(pos_a[1])<BY && veDeFora){ //als nous eixos és com una col·lisió en vertical (X i Y "dins" la barra)
        //només calculo les velocitats en els nous eixos si hi ha col·lisió
        vel_a[0]= -(velx*cos(A1)+vely*sin(A1)); //canvio de signe la velocitat Vx' directament en el càlcul (eix nou + rebot)
        vel_a[1]= -velx*sin(A1)+vely*cos(A1); //velocitats perpendicular i paral·lela a la barra, respectivament
        //després del canvi de signe torno als eixos del programa
        velx=vel_a[0]*cos(A1)-vel_a[1]*sin(A1);
        vely=vel_a[0]*sin(A1)+vel_a[1]*cos(A1);
        veDeFora=false; //desactivo el rebot fins que hagi sortit de dins la barra
      }else{
        veDeFora=true; //i activo el rebot un cop surt de la barra
      }
    }else{
      //ESQUERRA
      //Igual que a la dreta
      //Conversió
      pos_a[0]=(px-b2x)*cos(A2)+(py-b2y)*sin(A2); 
      pos_a[1]=-(px-b2x)*sin(A2)+(py-b2y)*cos(A2);
      //Comparació i col·lisió
      if(abs(pos_a[0])<BX+aj_m && abs(pos_a[1])<BY && veDeFora){ 
        // velocitat nous eixos
        vel_a[0]= -(velx*cos(A2)+vely*sin(A2));
        vel_a[1]= -velx*sin(A2)+vely*cos(A2);
        // velocitat original després del rebot
        velx=vel_a[0]*cos(A2)-vel_a[1]*sin(A2);
        vely=vel_a[0]*sin(A2)+vel_a[1]*cos(A2);
        veDeFora=false; //rebot desactivat
      }else{
        veDeFora=true; //rebot activat
      }
    }
    if(abs(velx)<1){ //correccions de la velocitat X per evitar 
      velx=2*velx/abs(velx); //mantinc el signe
    } 
  }
  
  //GOLS (la pilota arriba a les parets)
 
  if(px<marge+PR){ //gol esquerre
   velx=vel;
   m2++;
   bolaEnJoc=false;
   resetBola=true;
   //canvis de trajectòria per gols
   if(!lineal){
     ms2++;
     if(ms2==2 && i2<3){ //si fas dos gols seguits (en curvilini), puges de trajectòria. (a l'última ja no puges)
       i2++;
       A2=0;
     }else if(ms2==3){ //si en fas tres seguits (un després de pujar) fas baixar l'altre. (a l'última ja no baixa)
       if(i1>1){
         i1--;
         A1=0;
       }
       ms2=0; //torno a zero el marcador de gols seguits
     }
   }
  }else if(px>sizeX-marge-PR){ //gol dret
   velx=-vel;
   m1++;
   bolaEnJoc=false;
   resetBola=true;
   //canvis de trajectòria per gols
   if(!lineal){
     ms1++;
     if(ms1==2 && i1<3){ //si fas dos gols seguits (en curvilini), puges de trajectòria
       i1++;
       A1=0;
     }else if(ms1==3){ //si en fas tres seguits (un després de pujar) fas baixar l'altre.
       if(i2>1){
         i2--;
         A2=0;
       }
       ms1=0; //torno a zero el marcador de gols seguits
     }
   }
  }
  
  px+=velx;
  py+=vely;
}

void pintaTrajectes(){ // ..............................................................Trajectes
 int i;
 fill(255,10);
 for(i=1;i<4;i++){
   stroke(255,50);
   arc(focus[i],sizeY/2,TR[i]*2,TR[i]*2,-Amax[i],Amax[i]); //Alerta! dibuixant arcs l'ordre d'angles és important! (No dibuixa enrere)
   arc(sizeX-focus[i],sizeY/2,TR[i]*2,TR[i]*2,PI-Amax[i],PI+Amax[i]);
   stroke(255,25); //per alguna raó les linies són el doble d'opaques que els arcs ... O.o
   line(bx0,2*marge,bx0,sizeY-2*marge);
   line(sizeX-bx0,2*marge,sizeX-bx0,sizeY-2*marge);
 }
}

void setupTrajectes(){
  int i;
  float sin;
  focus[1] = marge;
  focus[2] = float(sizeX)*1/2;
  focus[3] = float(sizeX)*2/3;
  for(i=1;i<4;i++){
   TR[i]=b2x-focus[i]; //radi des del focus fins la barra
   sin=(sizeY/2-2*marge)/TR[i];
   if(sin>1){
     sin=1;
   }
   Amax[i]=asin(sin); //angle màxim de la trajectòria (fet a partir del radi i la mida del camp)
  }
}

void saca(){
  noFill();
  stroke(255,100);
  if(timer<maxTimer){
    arc(px,py,3*PR,3*PR,-(2*PI)/4,timer*(2*PI)/maxTimer-(2*PI)/4);
  }else{
    timer=0;
    bolaEnJoc=true;
  }
  timer++;
}

/* - - - coses per fer:
velocitat de les barres proporcional a la mida del camp (proporcional a la Y que han de recórrer)
velocitat de la bola augmentada segons el sinus de la velocitat (si bota molt per les Y que no trigui tant en arribar)
reset de la bola quan marca un gol
canvi de trajectòria automàtic amb el marcador
simultaneitat lineal-curvilini
portada? (i firma)
un colorn de fons per a cada trajectòria
*/

/* - - - idees extra per quan tingui temps:
menú amb tria de la mida del camp
marges proporcionals a la mida del camp (gruixos de les barres i grandària de la pilota potser també)
power-ups (allargament de les barres, escurçar la barra a l'altre, augments/disminucions de velocitat) que agafes si prems una tecla a temps
múltiples pilotes
*/


