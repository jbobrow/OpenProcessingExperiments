
//IN QUESTO PROGETTO TUTTO E' MODELLATO COME SE GUARDASSIMO DALL'ALTO (IL MOVIMENTO Ã�Â¨ VERSO Y NEGATIVA)
//POI VIENE TUTTO RUOTATO ATTORNO ASSE X


    color red= color(255,0,0);
    color greentransp=color(0,255,0,40);
    color bluetransp= color(0,125,200,100);
    color white= color(255,255,255);
    
    color coloremattonella=greentransp;
    
    color[] coloriPersonaggio={color(255,0,0,180),color(0,255,0,180),color(0,0,255,180),color(225,0,225,180)};
    int coloreAttuale=0;
    

   
long contatore=0;
int[] passaggi=new int[200000]; 
int[] coloriPassaggi=new int[200000];
int iUltimoPassaggio=0;
int speedGen=10;
int timeFromLastSpawnPassaggio=speedGen;


float rotatY=0.0f;

int nodiFunzione=200;
float[] percorso = new float[nodiFunzione];
float estremoADominioFunzione=0.0f;
float estremoBDominioFunzione=100;
float stepNodo=(estremoBDominioFunzione-estremoADominioFunzione)/nodiFunzione;
int indiceMattonellaAttuale=22;
float xCam=0.0f,zCam=0.0f;



class ElementoPavimento{
   float x,y,z;
   float totWidth, totLength;
   int tipoPassaggio=-1;
   int colorePassaggio;
   
   public ElementoPavimento (float x,float y,float z,float totw,float totl){ this.x =x; this.y=y; this.z=z; this.totWidth=totw; this.totLength=totl; } 
   public ElementoPavimento (float x,float y,float z,float totw,float totl,int tipoPassaggio,int iColorePassaggio){ this.x =x; this.y=y; this.z=z; this.totWidth=totw; this.totLength=totl; this.tipoPassaggio=tipoPassaggio; colorePassaggio=iColorePassaggio;} 
   
  
}


ElementoPavimento[] elementiPavimento; //non uso Java Collection altrimenti non va in javascript
float ylimit_forward=-10000.0f,ylimit_back=1000.0f;
int numElementiPavimento=25;
int altezzaScreen=500; //per qualche motivo width e height non funzionano in js
int larghezzaScreen=500;
float step=(-1*ylimit_forward + ylimit_back) / numElementiPavimento; //step pavimento 
float acc=1.0f;
int indiceUltimoNodoFunzioneUsato=0;








class Player{
 
 int posizionePlayer; //5 posizioni fissate
 float presentX=0.0f,presentZ=0.0f; //dove si trova attualmente perchÃ¨ si sta spostando verso la direzione dove deve andare (definita da una delle 5 posizioni fissate)
//0 Ã¨ centro, 1 sx, 2 up, 3 dx 4 down

 public Player(int pos){
    posizionePlayer=pos;
 } 
  
}

Player play1=new Player(0); //parte al centro


void initPassaggi(){
 
  for(int i=0;i<passaggi.length;i++)
    passaggi[i]=(int)random(0,5);
 
  for(int i=0;i<passaggi.length;i++)
    coloriPassaggi[i]=(int)random(0,3);
 
  
}


void initPavimento(){
 //NB in processing l'origine sist riferimento sta in alto a sinistra, e y Ã�Â¨ verso il basso ! (non come opengl)
 elementiPavimento = new ElementoPavimento[numElementiPavimento];

 for(int i=0;i<numElementiPavimento;i++)
   elementiPavimento[i]=new ElementoPavimento(-100,ylimit_forward + i*step,0,100+larghezzaScreen/2,step); //per l'altezza uso height meno 0 perchÃ�Â¨ il sistema di riferimento in processing sta in alto a sinistra non in basso a sinistra e la y aumenta verso il basso
 
 
}

void aggiornaPavimento(){
 for(int i=0;i<numElementiPavimento;i++)
   elementiPavimento[i].y+=acc*30.0; 
   acc+=0.001;
 
 //controllo se l'ultimo ha superato limite posteriore (z positivo) e in tal caso swappo ciascun elemento di un indice verso il basso, e ne creo uno nuovo in "testa" (indice 0) avanti e tutto
 if(elementiPavimento[numElementiPavimento-1].y > ylimit_back){
    swappaElementiPavimento(); 
 }
  
}

void swappaElementiPavimento(){
 
 for(int i=numElementiPavimento-1;i>=1;i--){
    elementiPavimento[i]=elementiPavimento[i-1];
 } 
 
 
 if(--timeFromLastSpawnPassaggio == 0){
   
     contatore++;
     if(contatore%10 == 0)
         speedGen--;
         
     timeFromLastSpawnPassaggio= (speedGen > 3)  ? speedGen :  3;
     
     elementiPavimento[0]=new ElementoPavimento(-100,ylimit_forward,percorso[indiceUltimoNodoFunzioneUsato%nodiFunzione]-100,100+larghezzaScreen/2,step, passaggi[iUltimoPassaggio++],(int)random(0,4));
     
 }
 else
   elementiPavimento[0]=new ElementoPavimento(-100,ylimit_forward,percorso[indiceUltimoNodoFunzioneUsato%nodiFunzione]-100,100+larghezzaScreen/2,step);
 
 indiceUltimoNodoFunzioneUsato++;
 
}


void setup(){
  ellipseMode(CENTER);
  
  for(int i=0;i<percorso.length;i++){
    percorso[i]= 100*sin(i * stepNodo)-30;  
    
  }
  

  initPavimento();
  initPassaggi();
  size(500,500,P3D);  
  background(0);
  
}



void draw(){
  
  //le routine per il disegno, non vengono piazzate sui singoli oggetti, ma il codice viene tutto qua dentro in modo tale da controllare meglio le trasformazioni
  background(0);
  
  
//prima di trasformare mondo va disegnata gui, anche se faccio una traslazione per avvicinare tasti al mondo
  pushMatrix();
  translate(0,0,40);

  popMatrix();
  
  pushMatrix();
    
    
    
    
    
    
    ////trasformazione mondo 
    
    rotateX(PI * 0.5);
    
    
    
    


    
    translate(-xCam,0,-400-zCam);
    
    xCam=xCam+0.1*(+play1.presentX-xCam-0.5*larghezzaScreen);
    zCam=zCam+0.1*(+play1.presentZ-zCam-0.3*altezzaScreen);
        
    
    
    //disegno elementi orizzontali del pavimento----------------------------------------------------------------------------------------------------
    rectMode(CORNER);
    strokeWeight(3.0);
    
    
    
    for(int i=0;i<numElementiPavimento;i++){
      
        if(i>indiceMattonellaAttuale+1)
          break;  
      
        noFill();
        coloremattonella = (i==indiceMattonellaAttuale) ? bluetransp : greentransp;
        pushMatrix();       
            
            translate(elementiPavimento[i].x,elementiPavimento[i].y,elementiPavimento[i].z);
            
            stroke(white);
            //fill(coloremattonella);
            rect(0,0,elementiPavimento[i].totWidth,elementiPavimento[i].totLength);
            //fill(red); //sparti mattonelle
            rect(elementiPavimento[i].totWidth,0,10,10);
            //fill(coloremattonella);
            //e una a destra
            rect(elementiPavimento[i].totWidth+10,0,elementiPavimento[i].totWidth,elementiPavimento[i].totLength);
            
           
            
            
            
          
        popMatrix();
        pushMatrix();       
          
            translate(elementiPavimento[i].x,elementiPavimento[i].y,elementiPavimento[i].z+650);
            
            noFill();
            //in realtÃ�  sono 2, una mattonella orizzontale a sinistra
            stroke(white);
            //fill(coloremattonella);
            rect(0,0,elementiPavimento[i].totWidth,elementiPavimento[i].totLength);
            //fill(red); //sparti mattonelle
            rect(elementiPavimento[i].totWidth,0,10,10);
            //fill(coloremattonella);
            //e una a destra
            rect(elementiPavimento[i].totWidth+10,0,elementiPavimento[i].totWidth,elementiPavimento[i].totLength);
            
        
            
            
        popMatrix();
        
        
        if(elementiPavimento[i].tipoPassaggio!=-1){
                pushMatrix();
                  fill(coloriPersonaggio[elementiPavimento[i].colorePassaggio]);
                  translate(0,elementiPavimento[i].y,0);
                  rotateX(PI*0.5);
                  float xpos=1000,zpos=1000;
                   xpos=larghezzaScreen*0.5-15;
                        zpos=altezzaScreen*0.05-15;       
                  switch(elementiPavimento[i].tipoPassaggio){
                      case 0:
                        xpos=larghezzaScreen*0.5f-20;
                        zpos=altezzaScreen*0.35f-20;
                     break;  
                     
                     case 1:
                        xpos=larghezzaScreen*-0.20-10f;
                        zpos=altezzaScreen*0.15+60f;
                     break;  
                     
                     case 2:
                       xpos=larghezzaScreen*0.5-30f+5;
                        zpos=altezzaScreen*0.70-5f;
                     break;  
                     
                     case 3:
                         xpos=larghezzaScreen*1.2f-20;
                         zpos=altezzaScreen*0.35-5;
                     break;  
                     
                     case 4:
                        
                     break;  

                  }
                rect(xpos,zpos,50,50);  
                popMatrix();
            }
        
        
                 
    }
    
    
    
   // fine disegno elementi orizzontali del pavimento----------------------------------------------------------------------------------------------------

    
    
   //disegno il player in base alla sua posizione tra la 0 e la 4
   int pp = play1.posizionePlayer;
   float xpos=0.0f,zpos=0.0f;
  
   switch(pp){
     case 0:
        xpos=larghezzaScreen*0.5f;
        zpos=altezzaScreen*0.35f;
     break;  
     
     case 1:
        xpos=larghezzaScreen*-0.20f;
        zpos=altezzaScreen*0.35f;
     break;  
     
     case 2:
        xpos=larghezzaScreen*0.5f;
        zpos=altezzaScreen*0.70f;
     break;  
     
     case 3:
        xpos=larghezzaScreen*1.2f;
        zpos=altezzaScreen*0.35f;
     break;  
     
     case 4:
        xpos=larghezzaScreen*0.5f;
        zpos=altezzaScreen*0.05f;
     break;  
     
   }
   
   //il player (la sua present position) tende a quella finale dovuta ad una delle 4 fissate
   play1.presentX+=0.1*(xpos-play1.presentX); 
   play1.presentZ+=0.1*(zpos-play1.presentZ);
   
   
   noFill();
  
   pushMatrix();
     translate(play1.presentX,-100,play1.presentZ);
     translate(5,0,5);
     
     lights();  
     stroke(250,255,250,150);
     translate(5,0,5);
     sphere(28);
     noLights();
     pushMatrix();
       
       rotateX(-PI*0.5);
       rotateY(rotatY);
       rotatY+=0.2;
       fill(coloriPersonaggio[coloreAttuale]);
       ellipse(0,0,130,130);
       
     popMatrix();  
     
   popMatrix();
   
  popMatrix();
  
  
  
  
  
  aggiornaPavimento();
  
  
}




void keyPressed(){
   int oldPos=play1.posizionePlayer;
   
   if(key=='a')
      coloreAttuale=0;
   else if(key=='s')
     coloreAttuale=1;
   else if(key=='d')
     coloreAttuale=2;
   else if(key=='f')
     coloreAttuale=3;
     
     
   switch(keyCode){
      case UP:
        if(oldPos==4)
          play1.posizionePlayer=0;
        else if(oldPos==0 || oldPos==1 || oldPos==3)
          play1.posizionePlayer=2;
        break;
        
      case LEFT:
        if(oldPos==3)
          play1.posizionePlayer=0;
        else if(oldPos==2 || oldPos==0 || oldPos==4)
          play1.posizionePlayer=1;
        break;
        
      case RIGHT:
        if(oldPos==1)
          play1.posizionePlayer=0;
        else if(oldPos==2 || oldPos==0 || oldPos==4)
          play1.posizionePlayer=3;
        break;
        
      case DOWN:
        if(oldPos==2)
          play1.posizionePlayer=0;
        else if(oldPos==0 || oldPos==1 || oldPos==3)
          play1.posizionePlayer=4;
        break;
      
     
   } 
   
}
   
   
   
void mousePressed(){
      if(mouseX<0.4*larghezzaScreen)
          if(play1.posizionePlayer==3)
              play1.posizionePlayer=0;
          else    
            play1.posizionePlayer=1;
      else if(mouseX>0.6*larghezzaScreen)
          if(play1.posizionePlayer==1)
            play1.posizionePlayer=0;
          else
            play1.posizionePlayer=3;
      else if(mouseY>0.6*altezzaScreen)
          if(play1.posizionePlayer==2)
            play1.posizionePlayer=0;
            else
              play1.posizionePlayer=4;
      else if(mouseY<0.4*altezzaScreen)
          if(play1.posizionePlayer==4)
              play1.posizionePlayer=0;
          else
              play1.posizionePlayer=2;
      else play1.posizionePlayer=0;
        
          
      
}

