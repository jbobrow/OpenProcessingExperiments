
/*David Palomar Cros 
grup 03 GEDI
seminari 4
bucles i arrays
Mosquits en fons de colors que reboten indefinidament per les parets de la finestra, amb el moviment del mouse els ulls canvien de color
*/
//inicialitzo els valors que utilitzare per fer la matriu i els bucles

int i;
int sz=20;
//en numero de mosquits, determinara quants mosquits hi haurà volant per la pantalla.

int numMosquits=20;
// inicio un float amb les pocicions en X i Y, igual que per les velocitats.
//poso valors de float, perque pugui agafar els nombres reals i hi hagin moltes més combinacions.
float[] posicionsX = new float[numMosquits];
float[] posicionsY = new float[numMosquits];
float[] velocitatsX = new float[numMosquits];
float[] velocitatsY = new float[numMosquits];



void setup() {
size(600, 600);
stroke(255, 0,0);
//al set up fem un bucle, per definir la matriu que posteriorment utilitzarem per fer que els mosquits es moguin aleatoriament.
//la posicio inicial i=0 vol dir que el primer valor de i será 0, i s'incrementará en +1 depenent si i és més petita que el número de mosquits
for (i=0; i<numMosquits; i++){
/* declarem les posicions i velocitats com a random, per tenir unes posicions i velocitats completament aleatories, les posicions seran dins dels límits de la pantalla i les velocitats 
dins d'un interval, aixi els diferents mosquits es mouran en diferentes velocitats*/
posicionsX[i]= random(0,width);
posicionsY[i]= random(0,height);
velocitatsX[i]= random(4,10);
velocitatsY[i]= random(4,10);
}
}



void draw() {

/*ara dibuixarem el fons amb la funció de bucle, ja que així conseguirem que es repeteixi un dibuix en concret i es dibuixi per tota la finestra, incrementant el valor de la posició.
inicialitzem la posició en X i Y quan aquestes dos siguin 0. Despres donem la condició de que si X o Y són més petites que la amplada o la altura, respectivament, la posició s'ha 
d'incrementar 40 pixels en X i Y, ja que així la seguent figura es desplaçará respecte de la primera*/

for (int x=0; x<width; x= x+40) {
for (int y=0; y<height; y= y+40){
  //faig una seqüencia de rectangles que es fiquen els uns dintre els altres
  //deixo els colors amb transparecia perquè es vegi el recorregut dels mosquits
fill(107,91,219,30);
strokeWeight(2);
//deixo la posició com a variable del bucle 
rect(x,y,40,40);
strokeWeight(1);
fill(216,219,91,30);
rect(x+10,y+10,20,20);
fill(255,0,0,30);
rect(x+15,y+15,10,10);

}
}

for(i=0; i<numMosquits; i++){
  //ara realitzem un bucle que fara moure els mosquits en les direccions corresponents
  //per la posició de la de X a la matriu la velocitat es positiva al igual que per la posició Y

    posicionsX[i] += velocitatsX[i];
    posicionsY[i] += velocitatsY[i];
    
    //posem la condició de canvi del sentit de la velocitat al arribar als límits de la finestre, perque així els mosquits rebotaran per les parets
    //poso com a inici 20, perque no reboti al centre del mosquit sino que reboti a la superfície, igual en totes les parets
    if((posicionsX[i]<20)||(posicionsX[i]>width-10)){
      velocitatsX[i] = -velocitatsX[i];
    } 
    
    if((posicionsY[i]<20)||(posicionsY[i]>height-10)){
      velocitatsY[i] = -velocitatsY[i];
    }
//un cp tinc definides totes les posicions i velocitats determinades, només cal dibuixar els mosquits, que són els mateixos que vaig utilitzar al seminari 3
//només cal que dibuixi un dels mosquits, ja que a dalt hem definit el número de mosquits que volem, i per tant només variant aquell número hi haurà més o menys mosquits.
//mosquits 
   stroke(0);
   fill(97,220,240);
   beginShape();
   //deixo totes les posicions en funció de la matriu X i Y, ja que les posicions dependran d'aquestes variables segons cada un dels mosquits
   vertex(posicionsX[i]-20,posicionsY[i]-10);
   vertex(posicionsX[i]-30,posicionsY[i]-30);
   vertex(posicionsX[i]-20,posicionsY[i]-45);
   vertex(posicionsX[i]-10,posicionsY[i]-35);
   vertex(posicionsX[i]-5,posicionsY[i]-10);
   endShape(); 
   //ala2
   beginShape();
   vertex(posicionsX[i]+10,posicionsY[i]-10);
   vertex(posicionsX[i]+20,posicionsY[i]-30);
   vertex(posicionsX[i]+10,posicionsY[i]-45);
   vertex(posicionsX[i],posicionsY[i]-35);
   vertex(posicionsX[i]-5,posicionsY[i]-10);
   endShape();
   
  //cos mosquit
  fill(35,35,35);
  ellipse(posicionsX[i],posicionsY[i],40,40);
  fill(mouseX,mouseY,200); 
  
  // els ulls del mosquit
     
  ellipse(posicionsX[i]+10,posicionsY[i]-10,sz,sz);
  ellipse(posicionsX[i]-5,posicionsY[i]-10,sz,sz);
  fill(0);
  ellipse(posicionsX[i]+12,posicionsY[i]-10,5,5);
  ellipse(posicionsX[i]-6,posicionsY[i]-10,5,5);
  beginShape();
  vertex(posicionsX[i]+12,posicionsY[i]+12);
  vertex(posicionsX[i]+20,posicionsY[i]+20);
  endShape();
  

  
}


}



