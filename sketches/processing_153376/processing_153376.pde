
/* @pjs preload="i1.jpg,i2.jpg,i3.jpg,i4.jpg,i5.jpg,i6.jpg,i7.jpg,i8.jpg,i9.jpg,i10.jpg,i11.jpg";*/
int sizeX = 700; //mides camp
int sizeY = 700;

int m = sizeX/50; //marge intern
int mX = 2*m; //marge dreta i esquerra
int mY = mX; //marge amunt i avall

int qR = (sizeX-3*m-2*mX)/(2*4); //radi del quadre
int iX = 2*qR+m; //unitat de distància horitzontal a la graella
int jX = 2*qR+m; //unitat de distància vertical a la graella

int i,j; //índexs
int k,t; //rastrejador
int d = 0; //distància per passar a la travelMatrix

int nq = 0; //número de quadres que han sortit al llarg de la partida
int qbuits = 16; //número de quadres buits a cada moment (per les probabilitats d'aparèixer capsa nova)

float vmin = 0.2;
int[] lastZero = {-1,-1}; //de moment marca de parada (aquí hi guardaré l'últim quadre que era zero quan intento posar un quadre nou)
boolean algunMvt; //marca si s'han mogut les capses
int[] pressed = {-5,-5};

int nmax = 10; //quantitat d'estats que poden tenir els quadrats (inclou 0 = quadre buit)
color[] col = {color(200),color(255),color(255,234,0),color(160,255,0),color(0,255,150),color(0,200,255),color(110,120,255),color(120,60,255),color(150,40,255),color(255,0,0),color(0)};
PImage[] img = new PImage[nmax]; //array de fotos de processing, desaprofito el 0 per guanyar comprensió (podria posar una caràtula més endavant)

Quadre[][] Q = new Quadre[4][4];

void setup(){
  size(700,700);
  rectMode(RADIUS);
  
  for(i=0;i<4;i++){ //Inicialitza els quadrats
    for(j=0;j<4;j++){
       Q[i][j]=new Quadre(qR);
       Q[i][j].qX=mX+qR+i*iX; //distància fins el primer centre + unitats de graella
       Q[i][j].qY=mY+qR+j*jX; //möhre of the mísm
       if((i==2 && j==3 && nq<1) || (i==3 && j==3 && nq<2)){
         Q[i][j].n=1;
       }else if(int(random(8))==2 && nq<2){
         Q[i][j].n=1;
         Q[i][j].v=vmin;
         nq++;
       }
    }
  }
  //carrega les fotos
  for(i=1;i<nmax;i++){ //quan n=1, la foto és la [1] // no hi ha foto 0 (el quadre està buit)
    img[i] = loadImage("i" +str(i)+ ".jpg"); //concateno el nom de la foto
    img[i].resize(2*Q[0][0].Rf,0); //escalo la foto a la mida de pantalla
  }
}

void draw(){
  background(230); //El taronja aquell és 255,227,167
  
  for(i=0;i<4;i++){ //passo la pintada dels quadres de sota aquí (queda feta amb els atributs dels quadres)
    for(j=0;j<4;j++){
      //quadre blanc de sota
      fill(255);
      stroke(col[0]);
      strokeWeight(Q[i][j].Rm);
      rect(Q[i][j].qX,Q[i][j].qY,Q[i][j].R-Q[i][j].Rm/2,Q[i][j].R-Q[i][j].Rm/2, Q[i][j].R/4,Q[i][j].R/4,Q[i][j].R/4,Q[i][j].R/4); //el gros, general
    }
  }
  
  for(i=0;i<4;i++){
    for(j=0;j<4;j++){
       Q[i][j].display(); //möhre of the mísm
    }
  }
}

//- - - - - - - - - - - - - - - - - - - - funcions - - - - - - - - - - - - - - - - - - - - - //
void keyPressed(){
  if(keyCode==37){ //keyCode: Esquerra=37, Amunt=38, Dreta=39, Avall=40
    mouCapses(0);
  }else if(keyCode==38){
    mouCapses(1);
  }else if(keyCode==39){
    mouCapses(2);
  }else if(keyCode==40){
    mouCapses(3);
  }
}

void mousePressed(){
  if(pressed[0]<0){
    pressed[0]=mouseX;
    pressed[1]=mouseY;
  }
}
void mouseReleased(){
  if(pressed[0]>=0){
    if(abs(mouseX-pressed[0])>abs(mouseY-pressed[1])){ //moviment horitzontal
      if(mouseX-pressed[0]>0){ //dreta
        mouCapses(2);
      }else{//esquerra
        mouCapses(0);
      }
    }else{//moviment vertical
      if(mouseY-pressed[1]>0){//avall
        mouCapses(3);
      }else{//amunt
        mouCapses(1);
      }
    }
    pressed[0]=-5;
    pressed[1]=-5;
  }
}

void mouCapses(int d){ //d=direcció (0=esquerra, 1=amunt, 2=dreta, 3=avall)
  print("MOU CAPSES ");
  
 //ESQUERRA
  if(d==0){
    println("(Esquerra)");
    for(j=0;j<4;j++){
      print("[j="+j+"]");
      for(i=1;i<4;i++){
        println("(i="+i+")");
        k=1;
        while(k>0 && k<=i && Q[i][j].n!=0){ //miro els quadres a l'esquerra (un, dos, tres... quadres més enllà. Els que hi hagi)
          print(" k="+k+" | "+(i-k)+" "+i+" | "+Q[i-k][j].n+" "+Q[i][j].n+" || ");
          if(Q[i-k][j].n==0){ //SI ÉS ZERO, mira el següent (transpassa)
            println((i-k)+" és zero");
            if(k==i){ //si és l'últim, moc el cub (tots estaven buits i llisca fins la paret)
              algunMvt=true;
              Q[i-k][j].n=Q[i][j].n;
              Q[i][j].n=0;
            }
            k++;
          }else if(Q[i-k][j].n==Q[i][j].n && !Q[i-k][j].heAjuntatJa){ //SI COINCIDEIXEN (i no l'he ajuntat)
            algunMvt=true;
            println(" Coincideix "+(i-k)+" amb "+i);
            Q[i-k][j].n=0; //esborro l'esquerre coincident
            t=0;
            while(t<=i && Q[t][j].n!=0){ //busco el forat de més a l'esquerra
              t++;
            }
            println(" Esborro "+(i-k)+" guardo "+i+" a "+t+" i esborro "+i);
            Q[t][j].n=Q[i][j].n+1; //guardo la suma al forat
            Q[i][j].n=0; //esborro l'original
            Q[t][j].heAjuntatJa=true; //i marco el quadre de destinació perquè no l'ajunti amb algú que vingui de més enllà
          }else{ //SI ÉS DIFERENT queda't al seu costat
            println(" "+(i-k)+" És diferent. Em quedo a "+(i-k+1));
            if(1-k!=0){
              algunMvt=true;
              Q[i-k+1][j].n=Q[i][j].n;
              Q[i][j].n=0;
            }else{
              k=-1; //marca de parada pel while per quan no buido el bloc
            }
          }
        }//</while>
        if(algunMvt){
          Q[i][j].traveling=true;
        }
      }//</for>
    }//</for>
  }//</esquerra>
  
  //AMUNT
  if(d==1){
    println("(Amunt)");
    for(i=0;i<4;i++){
      print("[i="+i+"]");
      for(j=1;j<4;j++){
        println("(j="+j+")");
        k=1;
        while(k>0 && k<=j && Q[i][j].n!=0){ //miro els quadres amunt (un, dos, tres... quadres més enllà. Els que hi hagi)
          print(" k="+k+" | "+(j-k)+" "+j+" | "+Q[i][j-k].n+" "+Q[i][j].n+" || ");
          if(Q[i][j-k].n==0){ //SI ÉS ZERO, mira el següent (transpassa)
            println((j-k)+" és zero");
            if(k==j){ //si és l'últim, moc el cub (tots estaven buits i llisca fins la paret)
              algunMvt=true;
              Q[i][j-k].n=Q[i][j].n;
              Q[i][j].n=0;
            }
            k++;
          }else if(Q[i][j-k].n==Q[i][j].n && !Q[i][j-k].heAjuntatJa){ //SI COINCIDEIXEN
            algunMvt=true;
            println(" Coincideix "+(j-k)+" amb "+j);
            Q[i][j-k].n=0; //esborro el de sobre coincident
            t=0;
            while(t<=j && Q[i][t].n!=0){ //busco el forat de més amunt
              t++;
            }
            println(" Esborro "+(j-k)+" guardo "+j+" a "+t+" i esborro "+j);
            Q[i][t].n=Q[i][j].n+1; //guardo la suma al forat
            Q[i][j].n=0; //i esborro l'original
            Q[i][t].heAjuntatJa=true;
          }else{ //SI ÉS DIFERENT queda't al seu costat
            println(" "+(j-k)+" És diferent. Em quedo a "+(j-k+1));
            if(k-1!=0){
              algunMvt=true;
              Q[i][j-k+1].n=Q[i][j].n;
              Q[i][j].n=0;
            }else{
              k=-1; //marca de parada per quan no buido el bloc
            }
          }
        }//</while>
      }
    }
  }//</amunt>
  
  //DRETA
  if(d==2){
    println("(Dreta)");
    for(j=0;j<4;j++){
      print("[j="+j+"]");
      for(i=2;i>=0;i--){
        println("(i="+i+") - Q(n)="+Q[i][j].n);
        k=1;
        while(k>0 && k<=3-i && Q[i][j].n!=0){ //miro els quadres a la dreta (un, dos, tres... quadres més enllà. Els que hi hagi)
          print(" k="+k+" | "+i+" "+(i+k)+" | "+Q[i][j].n+" "+Q[i+k][j].n+" || ");
          if(Q[i+k][j].n==0){ //SI ÉS ZERO, mira el següent (transpassa)
            println((i+k)+" és zero");
            if(k==3-i){ //si és l'últim, moc el cub (tots estaven buits i llisca fins la paret)
              algunMvt=true;
              Q[i+k][j].n=Q[i][j].n;
              Q[i][j].n=0;
            }
            k++;
          }else if(Q[i+k][j].n==Q[i][j].n && !Q[i+k][j].heAjuntatJa){ //SI COINCIDEIXEN
            algunMvt=true;
            println(" Coincideix "+i+" amb "+(i+k));
            Q[i+k][j].n=0; //esborro el dret coincident
            t=0;
            while(t<=3-i && Q[3-t][j].n!=0){ //busco el forat de més a la dreta
              t++;
            }
            println(" Esborro "+(i+k)+" guardo "+i+" a "+(3-t)+" i esborro "+i);
            Q[3-t][j].n=Q[i][j].n+1; //guardo la suma al forat
            Q[i][j].n=0; //i esborro l'original
            Q[3-t][j].heAjuntatJa=true;
          }else{ //SI ÉS DIFERENT queda't al seu costat
            print(" "+(i+k)+" És diferent. Em quedo a "+(i+k-1));
            if(k-1!=0){
              algunMvt=true;
              Q[i+k-1][j].n=Q[i][j].n;
              Q[i][j].n=0;
            }else{
              k=-1; //marca de parada per quan no buido el bloc
            }
          }
        }//</while>
      }
    }
  }//</dreta>
  
  //AVALL
  if(d==3){
    println("(Avall)");
    for(i=0;i<4;i++){
      print("[i="+i+"]");
      for(j=2;j>=0;j--){
        println("(j="+j+") - Q(n)="+Q[i][j].n);
        k=1;
        while(k>0 && k<=3-j && Q[i][j].n!=0){ //miro els quadres avall (un, dos, tres... quadres més enllà. Els que hi hagi)
          print(" k="+k+" | "+j+" "+(j+k)+" | "+Q[i][j].n+" "+Q[i][j+k].n+" || ");
          if(Q[i][j+k].n==0){ //SI ÉS ZERO, mira el següent (transpassa)
            println((j+k)+" és zero");
            if(k==3-j){ //si és l'últim, moc el cub (tots estaven buits i llisca fins la paret)
              algunMvt=true;
              Q[i][j+k].n=Q[i][j].n;
              Q[i][j].n=0;
            }
            k++;
          }else if(Q[i][j+k].n==Q[i][j].n && !Q[i][j+k].heAjuntatJa){ //SI COINCIDEIXEN
            algunMvt=true;
            println(" Coincideix "+j+" amb "+(j+k));
            Q[i][j+k].n=0; //esborro el dret coincident
            t=0;
            while(t<=3-j && Q[i][3-t].n!=0){ //busco el forat de més avall
              t++;
            }
            println(" Esborro "+(j+k)+" guardo "+j+" a "+(3-t)+" i esborro "+j);
            Q[i][3-t].n=Q[i][j].n+1; //guardo la suma al forat
            Q[i][j].n=0; //i esborro l'original
            Q[i][3-t].heAjuntatJa=true;
          }else{ //SI ÉS DIFERENT queda't al seu costat
            println(" "+(j+k)+" És diferent. Em quedo a "+(j+k-1));
            if(k-1!=0){
              algunMvt=true;
              Q[i][j+k-1].n=Q[i][j].n;
              Q[i][j].n=0;
            }else{
              k=-1; //marca de parada per quan no buido el bloc
            }
          }
        }//</while>
      }
    }
  }//</dreta>
  
  //Comprovo que no m'he passat de n, marco tots com no ajuntats i compto els quadres buits
  qbuits=0;
  for(j=0;j<4;j++){
    for(i=0;i<4;i++){
      Q[i][j].heAjuntatJa=false; //ajuntaments del poble i circumdants
      if(Q[i][j].n==0){ //còmput de buits
        qbuits++;
      }
      if(Q[i][j].n>=nmax){ //màxims de n
        Q[i][j].n=nmax-1;
      }
    }
  }
  
  //afegeixo una capsa aleatòriament (si s'ha mogut alguna cosa. si clico una fletxa i està bloquejat no)
  if(algunMvt){
    k=0; //encara no ha posat la capsa (k=1 -> posada)
    i=0;
    while(k==0 && i<4){ //passa per totes les i fins que estigui posada
      j=0;
      while(k==0 && j<4){ //passa per totes les j fins que estigui posada
          if(Q[i][j].n==0){ //arriba a una casella amb un zero
            if(int(random(qbuits))==1){ //i l'aleatori li deixa posar capsa
              Q[i][j].n=/*int(random(2))*/+1;
              Q[i][j].v=vmin;
              k++;
              nq++;
            }else{ //si no pot posar la capsa guardo la casella (per si no n'hi ha més)
              lastZero[0]=i;
              lastZero[1]=j;
            }//</if>
          }//</if gros>
        j++;
      }//</while>
      i++;
    }//</while gros>
    if(k==0){
      Q[lastZero[0]][lastZero[1]].n=/*int(random(2))*/+1;
      Q[lastZero[0]][lastZero[1]].v=vmin;
      nq++;
    }
    lastZero[0]=-1;//marca de parada. No creis capses quan està tot ple
    lastZero[1]=-1;
  }
  algunMvt=false; //reset per la propera
  //</random box>
  
  //test per GUI
  for(j=0;j<4;j++){
    for(i=0;i<4;i++){
      print(Q[i][j].n);print(" ");
    }
    println();
  }
  println();
}//</moucapses>
public class Quadre {
  int R; //radi
  int Rm; //gruix del marc
  int Rf; //Radi de la foto
  int qX,qY; //posicions
  int n = 0; //valor del quadre (2^n) -> 0=atrezzo
  
  float v=1; //proporció % (tant per u) de la mida que tindrà el rectangle, que té ara mateix
  
  boolean heAjuntatJa=false; //marco els quadres que he ajuntat en un torn, per evitar que es combini un ja combinat en el mateix moviment 
  boolean traveling=false;
  
  Quadre(int iR){ //inicialització
    R=iR;
    Rm=int(R/10);
    Rf=(R-Rm+1);
  }
  
  void display(){
    noStroke();
    rectMode(RADIUS);
    
    //calcula l'engrandiment del quadre
    if(v<1){
      v+=0.05; //suma fins a 1
    }
    if(v>1){
      v=1;
    }
    
    //fotos enmarcades (fa servir les imatges del "main")
    if(n>0){ 
      if(v==1){
        image(img[n],(qX-Rf+1),(qY-Rf+1)); //foto (només si està el quadre sencer i n'ha de tenir)
      }
      noFill(); //marc de fora
      stroke(0);
      strokeWeight(Rm);
      rect(qX,qY,R-Rm/2,R-Rm/2, R/4,R/4,R/4,R/4); //el gros, general
      strokeWeight(Rm-3);
      stroke(col[n]);
      rect(qX,qY,R-Rm/2,R-Rm/2, R/4,R/4,R/4,R/4); //part de dins
      if(v!=1){ //el petit de l'animació
        //fill(200);
        stroke(0);
        rect(qX,qY,(R-Rm/2)*v,(R-Rm/2)*v, v*R/4,v*R/4,v*R/4,v*R/4);
      }
    }
  }// </display>
}//(Quadre)


