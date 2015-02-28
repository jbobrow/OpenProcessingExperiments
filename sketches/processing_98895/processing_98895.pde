



/*David Palomar Cros 
 grup 03 GEDI
 seminari 5
 imatges i sons, bucles i arrays
 Mosquits en fons amb una imatge que reboten indefinidament per les parets de la finestra, amb el moviment del mouse els ulls canvien de color, els mosquits fan soroll.
 */
/*inicialitzo els valors importats de la biblioteca
 import ddf.minim.spi.*;
 import ddf.minim.signals.*;
 import ddf.minim.*;
 import ddf.minim.analysis.*;
 import ddf.minim.ugens.*;
 import ddf.minim.effects.*;
 
 *///inicialitzo els valors de la matriu
var audioElement = document.createElement("audio");
var audioElement2 = document.createElement("audio");
var audioElement3 = document.createElement("audio");
int i;
int sz=20;
//en numero de mosquits, determinara quants mosquits hi haurà volant per la pantalla.

int numMosquits=5;

// inicio un float amb les pocicions en X i Y, igual que per les velocitats.
//poso valors de float, perque pugui agafar els nombres reals i hi hagin moltes més combinacions.
float[] posicionsX = new float[numMosquits];
float[] posicionsY = new float[numMosquits];
float[] velocitatsX = new float[numMosquits];
float[] velocitatsY = new float[numMosquits];

/*//inicialitzem el so
 Minim minim;//creem un objecte de so
 AudioPlayer daSound;//Creem un player
 AudioPlayer daBackgroundSound;//creem un player*/
//inicialitzem les fotos
PImage lampara;
PImage Mano;


void setup() {
  size(600, 600);
  stroke(255, 0, 0);
   //carreguem les imatges
  lampara = loadImage("lampara.jpg");
  Mano = loadImage("Mano.jpg");
  
  //al set up fem un bucle, per definir la matriu que posteriorment utilitzarem per fer que els mosquits es moguin aleatoriament.
  //la posicio inicial i=0 vol dir que el primer valor de i será 0, i s'incrementará en +1 depenent si i és més petita que el número de mosquits
  for (i=0; i<numMosquits; i++) {
    /* declarem les posicions i velocitats com a random, per tenir unes posicions i velocitats completament aleatories, les posicions seran dins dels límits de la pantalla i les velocitats 
     dins d'un interval, aixi els diferents mosquits es mouran en diferentes velocitats*/
    posicionsX[i]= random(20, width-25);
    posicionsY[i]= random(20, height-25);
    velocitatsX[i]= random(4, 10);
    velocitatsY[i]= random(4, 10);
  }

  /*minim = new Minim(this);//instanciem l'objecte de so
   daSound = minim.loadFile("toc.mp3");//carreguem l'mp3
   daBackgroundSound = minim.loadFile("mosquito.mp3");//carreguem l'mp3
   daBackgroundSound.cue(1200);//avancem el capçal del so de fons
   daBackgroundSound.play();//el reproduim*/
   //introduim els elements d'audio per javascript
  audioElement.setAttribute("src", "mosquito.mp3");
  audioElement.play();

 
  noCursor();//treiem el cursor
  //iniciem el so de rebot 
   audioElement2.setAttribute("src", "toc.mp3");
  


}



void draw() {

  //coloquem una imatge de fons que serà la llum que fara que els mosquits volin i es tornin bojos

  image(lampara, 0, 0, width, height);
  //les mans seguiran el ratolí buscan els mossquits
  image(Mano, mouseX, mouseY, 200, 200);

  for (i=0; i<numMosquits; i++) {
    //ara realitzem un bucle que fara moure els mosquits en les direccions corresponents
    //per la posició de la de X a la matriu la velocitat es positiva al igual que per la posició Y

    posicionsX[i] += velocitatsX[i];
    posicionsY[i] += velocitatsY[i];

    //posem la condició de canvi del sentit de la velocitat al arribar als límits de la finestre, perque així els mosquits rebotaran per les parets
    //poso com a inici 20, perque no reboti al centre del mosquit sino que reboti a la superfície, igual en totes les parets
    if ((posicionsX[i]<20)||(posicionsX[i]>width-25)) {
       velocitatsX[i] = -velocitatsX[i];
       audioElement2.play(1);
    } 

    if ((posicionsY[i]<20)||(posicionsY[i]>height-25)) {
      
      velocitatsY[i] = -velocitatsY[i];
      audioElement2.play(1);
    }

    //un cp tinc definides totes les posicions i velocitats determinades, només cal dibuixar els mosquits, que són els mateixos que vaig utilitzar al seminari 3
    //només cal que dibuixi un dels mosquits, ja que a dalt hem definit el número de mosquits que volem, i per tant només variant aquell número hi haurà més o menys mosquits.
    //mosquits 
    stroke(0);
    fill(97, 220, 240);
    beginShape();
    //deixo totes les posicions en funció de la matriu X i Y, ja que les posicions dependran d'aquestes variables segons cada un dels mosquits
    vertex(posicionsX[i]-20, posicionsY[i]-10);
    vertex(posicionsX[i]-30, posicionsY[i]-30);
    vertex(posicionsX[i]-20, posicionsY[i]-45);
    vertex(posicionsX[i]-10, posicionsY[i]-35);
    vertex(posicionsX[i]-5, posicionsY[i]-10);
    endShape(); 
    //ala2
    beginShape();
    vertex(posicionsX[i]+10, posicionsY[i]-10);
    vertex(posicionsX[i]+20, posicionsY[i]-30);
    vertex(posicionsX[i]+10, posicionsY[i]-45);
    vertex(posicionsX[i], posicionsY[i]-35);
    vertex(posicionsX[i]-5, posicionsY[i]-10);
    endShape();

    //cos mosquit
    fill(35, 35, 35);
    ellipse(posicionsX[i], posicionsY[i], 40, 40);
    fill(mouseX, mouseY, 200); 

    // els ulls del mosquit

    ellipse(posicionsX[i]+10, posicionsY[i]-10, sz, sz);
    ellipse(posicionsX[i]-5, posicionsY[i]-10, sz, sz);
    fill(0);
    ellipse(posicionsX[i]+12, posicionsY[i]-10, 5, 5);
    ellipse(posicionsX[i]-6, posicionsY[i]-10, 5, 5);
    beginShape();
    vertex(posicionsX[i]+12, posicionsY[i]+12);
    vertex(posicionsX[i]+20, posicionsY[i]+20);
    endShape();
  }
}



