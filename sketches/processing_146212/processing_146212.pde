
//hi ha varies cares de granotes i aquestes es mouen de forma random per la pantalla i variant la seva velocitat rebotant contra els costats

int i;
int posx;
int posy;
int numgrant= 40; //nombre de grantoes que es veuran a la pantalla
float [] posX= new float[numgrant]; //matriu posició X
float [] posY= new float[numgrant]; //matriu posició Y
color colorback; //definim color pq sigui colorback 

void setup(){
size(700,700); background(colorback);
posx=width/2;
posy=height/2;// donem valor a la a i la b
noCursor(); // fem que el cursor no sigui visible
for(int i = 0; i<numgrant; i++){
    posX[i] = posX[i]+(int) random (-30,30);// definim la posició inicial com al centre de la pantalla
    posY[i] = posY[i]+(int) random(-30,30);
    }  
}

void mousePressed(){
colorback=color(3*mouseY,mouseX/2,150);
//donem valor al fons segons la posició en la qual apretem el mouse segons els eixos X i Y de manera que cada cop que s'apreti el mouse 
//en una zona diferent de la pantalla el color del fons canvïi
for(int i = 0; i<numgrant; i++){
posX[i]= mouseX;
posY[i]= mouseY; // fem que cada cop que apretis el mouse en una zona de la pantalla surtin d'allà
  } 
}

void draw(){
background(colorback); 
// creem loop per a fer que les cares de ganota no parin mai de rebotar i vagin variant la seva situació
for(int i = 0; i<numgrant; i++){
    posX[i] += random(-30,30) ;// no utilitzem velocitat perquè utilitzem el random walker de manera que la grantoa variï la seva posició de manera al·leatoria i així es desplaci.
    posY[i] += random(-30,30);
//ara donem valor al punt on han de rebotar les cares i per això utilitzem la funció if() i fem que quan arribi al final de la pantall canviï 
if(posX[i]<width/11) {
      posX[i]=width/11;
    } 
if(posX[i]> width-width/11){
 posX[i]=width-width/11;
 }
if(posY[i]<height/17.5){
  posY[i]=height/17.5;
}
if(posY[i]>height-height/24){
      posY[i]=height-height/24;
    } 
  }
  
for(int i = 0; i<numgrant; i++){
stroke(0); strokeWeight(1); fill(80,230,50); ellipse(posX[i],posY[i],width/11,height/17.5); //el·lipse verda que forma la cara
stroke(0); fill(posX[i],2*posY[i],255); ellipse(posX[i]-width/50,posY[i]-height/40, width/25, height/25);ellipse(posX[i]+width/50,posY[i]-height/40, width/25, height/25); 
// circumferència que és el blanc dels ulls, el seu color canvia segons la posició de la cara
stroke(0); fill(0); ellipse(posX[i]-width/130,posY[i]-height/45, width/80, height/80); ellipse(posX[i]+width/130, posY[i]-height/45, width/80, height/80); // circumferència petita negra, nineta
stroke(0); strokeWeight(2); line(posX[i],posY[i]+height/50,posX[i]-width/50,posY[i]+height/100); line(posX[i],posY[i]+height/50,posX[i]+width/50,posY[i]+height/100); //dues línies que formen la boca
fill(255,196,225); strokeWeight(1); stroke(255,196,225); ellipse(posX[i]-width/37.5,posY[i]+height/150, width/80, height/80); 
ellipse(posX[i]+width/37.5,posY[i]+height/150, width/80, height/80); //rodones roses que són els mofletes
  }
}


