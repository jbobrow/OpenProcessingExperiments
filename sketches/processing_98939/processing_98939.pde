
/*David Haro Tornè
grup 03 GEDI
seminari 5
bucles i arrays
Espases que fereixen als kennys que estàn per tota la pantalla de forma ordenada, cada vegada que una espas toca la pantalla, sona el soroll làser.
*/
//inicialitzo els valors que utilitzare per fer la matriu i els bucles
 
var audioElement = document.createElement("audio"); //per al javascript

 
 
int numSpases = 5; //en primer lloc definim el número d' espases que volem que hi agui
 
 
 
//creem una matriu de posicionsX con "numSpases" elements:
float[] posicionsX = new float[numSpases];
//el mateix per posicionsY:
float[] posicionsY = new float[numSpases];
//m per velocitatsX:
float[] velocitatsX = new float[numSpases];
//m velocitatsY:
float[] velocitatsY = new float[numSpases];
  
 
  // s'ha de genera uns valors determinats per al só
  Minim minim;//creem un objecte de so
AudioPlayer daSound;//creem un player
 
void setup(){
  noCursor(); // Definim que el cursor no aparegui en la pantalla
size(500,500);
frameRate(30); //perquè el moviment sigui fluïd
//inicialitzem posicions i velocitats:
  for(int m = 0; m<numSpases; m++){
    posicionsX[m] = width/2; //Comencara al mitj de la pantalla
    posicionsY[m] = height/2;//Comencara al mitj de la pantalla
    velocitatsX[m] = random(6,10); // la velocitat en la que es moura l' espassa variarà cada vegada que la finestra s' obri. la velocitat cada vegada pot ser de 6,7,8,9 o 10
    velocitatsY[m] = random(6,10); // la velocitat en la que es moura l' espassa variarà cada vegada que la finestra s' obri. la velocitat cada vegada pot ser de 6,7,8,9 o 10
audioElement1.setAttribute("src", "star.mp3");
    audioElement1.play();

  }
}
 
void draw(){
  background(255,255,255,26);
  PImage afoto;
  //Cargem una foto a afoto
afoto = loadImage("south park.jpg"); // adjuntem l' objecte de só que esta a la mateixa carpeta.
//y dibujamos la foto
image(afoto, 50, 50); // Cargem la fotografia i la posicionem dins la pantalla
 
   //iniciem un bucle perquÃ¨ faci les mateixes accions
  //a tots els valors de les matrius
  for(int m = 0; m<numSpases; m++){
    //actualitzem posicions
    posicionsX[m] += velocitatsX[m];
    posicionsY[m] += velocitatsY[m];
 
    //comprobem lÃ­mits X
    if((posicionsX[m]<10)||(posicionsX[m]>width-10)){ // Cada espas rebotarà dins la finestra.
      velocitatsX[m] = -velocitatsX[m];
      //posem el so de rebot a zero...
   
    }
    //comprobem lÃ­mits Y
    if((posicionsY[m]<5)||(posicionsY[m]>height-100)){ //Cada espasa rebotarà dins la finestra
      velocitatsY[m] = -velocitatsY[m];
    
    }
   
   //i dibuixem la espasa posan cada element referenciat a cada part de l' espasa amb la matriu
     
    fill(220,255,28);
stroke(220,255,28);
rect(posicionsX[m],posicionsY[m],4,70);// aquesta espasa s' anira movent per tota la finestra, i farà de curssor.
ellipse(posicionsX[m]+2,posicionsY[m],4,4);
   
fill(188,188,188);
stroke(188,188,188);
rect(posicionsX[m]-3,posicionsY[m]+70,10,2.5);
rect(posicionsX[m],posicionsY[m]+70,4,25);
rect(posicionsX[m]-3,posicionsY[m]+95,10,2.5);
ellipse(posicionsX[m]+2,posicionsY[m]+96.5,5.5,5.5);
   
fill(255,9,0);
stroke(255,9,0);
ellipse(posicionsX[m]+2,posicionsY[m]+87.5,2,2);
 
 
// realitzem un bucle per fer que el fons es repeteixi segons els dos valors, en les x=i i en les y=j aixì podem referencia totes les figures en tota la finestra a partir
//de les distancies que se l' hi dona a l' inici del bucle.
for (int i = 0; i < 550; i = i+85) {
  for (int j = 0; j < 550; j = j+85) {
     
fill(-mouseX/4+255,-mouseX/4+100,-mouseX/4+3); // el color del cos encara caniva segons la posisio del cursosr
arc(30+i,40+j,30,30,-PI,0); // referencien la formació de la figura amb el bucle
    
  
stroke(-mouseY/4+255,-mouseY/4+100,-mouseY/4+3); // el color del cos encara canivar seogns la posició del curssor.
fill(mouseY/4+255,mouseY/4+100,mouseY/4+3); // el color del cos enscara canvia segons la posició del curssor
ellipse(30+i,17+j,30,30);//referencien la formació de la figura amb el bucle
    
  
fill(255,100,3);
rect(20.5+i,40+j,20,4.5);//referencien la formació de la figura amb el bucle
    
stroke(126,49,1);
fill(126,49,1);
rect(17+i,44.5+j,26.5,1);// referencien la formació de la figura amb el bucle
    
stroke(0);
strokeWeight(2);
fill(255,100,3);
ellipse(30+i,17.5+j,19,16.5);//referencien la formació de la figura amb el bucle
strokeWeight(2);
fill(126,49,1);
ellipse(30+i,16.2+j,16,13.5);//referencien la formació de la figura amb el bucle
    
stroke(250,205,177);
strokeWeight(2);
fill(250,205,177);
ellipse(30+i,16.2+j,10.5,13.5);//referencien la formació de la figura amb el bucle
stroke(255);
strokeWeight(2);
fill(255);
ellipse(27.4+i,16.2+j,5.1,6.5);//referencien la formació de la figura amb el bucle
ellipse(32.5+i,16.2+j,5.1,6.5);//referencien la formació de la figura amb el bucle
    
stroke(0);
strokeWeight(1);
fill(0);
ellipse(27.9+i,16+j,1,1);
ellipse(32+i,16+j,1,1);
    
stroke(126,49,1);
strokeWeight(1);
fill(126,49,1);
ellipse(17+i,40+j,5,5);//referencien la formació de la figura amb el bucle
ellipse(43.5+i,40+j,5,5);// referencien la formació de la figura amb el bucle
ellipse(19+i,39.5+j,3,3);//referencien la formació de la figura amb el bucle
ellipse(41+i,39.5+j,3,3);// referencien la formació de la figura amb el bucle
}
}
}
}
 




