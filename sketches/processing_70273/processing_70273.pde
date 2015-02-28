

int nbDotRB, nbDotER, nbDotECR, nbDotAR, nbDotAB;

int monstreEtat=0; //j'aurais bien aimÃ© faire une prog orientÃ© objet, mais j'avais beaucoup avancÃ© mon code avant de le savoir.

float xDot, yDot, xDotRB, yDotRB; // variable de position XY des point
float x = 00; //variable affectant tout le monstre
float y = 00; //variable affectant tout le monstre
float xDotR, yDotR; // variable du DIAMTETRE des points

float cR, cG, cB, cT, ecRGB, ecT, cRCorps, cGCorps, cBCorps, ecRGBCorps, cRYeux, cGYeux, cBYeux, ecRGBYeux, cRCheveux, cGCheveux, cBCheveux, ecRGBCheveux ;// toutes les variable de couleur


PGraphics pg; //variable contenant les PGraphics
PGraphics backG;

int nbDotRTL =40; //section pour le Foreground
float[] xDotRTL=new float [nbDotRTL];
float[] yDotRTL=new float [nbDotRTL];

// Variable de l'Ã©tat du monstre
float bougeBouge=1; // section pour l'Ã©tat 3 et 4 du monstre "Bouge BOUGE!" // en l'honneur de la grÃ¨ve.
float vBouge=0;
float cumulBouge=1;
int tempsAttente=0; //pour la minuterie de l'Ã©tat 4
int rewindBouge=1; // pour le reculons du monstre
int monstreAlerte=0; // Monstre alerte Ã  ce qui l'entoure
int rewindHide=1; // pour le retour du Hide entre l'Ã©tat 1 et 2
int tempsAttenteHide=0; 


PGraphics[] pgYeux = new PGraphics[48];
//0-7 yeux ouvert
//8-15 yeux fermÃ©e et cligne
//16-23 yeux demi fermÃ©
//24-31 yeux + rouge cligne
//32-39 paupiÃ¨re camÃ©lÃ©on *5 
//40-47 yeux demi fermÃ© camÃ©lÃ©on
int idYeux=-1;
int idYeuxRouge=-1;
int idYeuxCligne=-1;
int rYeux=30;
int[] etatYeux=new int [8]; // permet d'attribuer une valeur Ã  chaque yeux 
int oeilSousLaSouris = -1; // variable de sur quel oeil est la sourie

int nbCliqueYeuxLeft=0; //variable pour le nombre de fois qu'il y a eu leftclick sur les yeux
int nbCliqueYeux=0; //variable pour le nombre de fois qu'il y a eu rightclick sur les yeux
int nbYeuxRouge=0; // variable du nb de yeux poivrÃ©s en mÃªme temps 
int[] tempsYeuxRouge=new int [8]; // temps respectif pour les yeux rouges
int[] tempsYeuxCligne=new int [8]; //temps pour les yeux qui clignent
int[] tempsYeuxHide=new int [8]; //temps pour les yeux qui clignent
int interval=3000;


// variable pour particule:
int nbDotPE=150; // quantitÃ© de particules irritantes dans l'eau
float[] xDotPE=new float [nbDotPE]; //pour la continuitÃ© des couleurs dans les particules
float[] yDotPE=new float [nbDotPE];
float[] cRPE=new float [nbDotPE];
float[] cBPE=new float [nbDotPE];
float[] cGPE=new float [nbDotPE];
float[] cTPE=new float [nbDotPE];
float[] xyDeepPE=new float [nbDotPE];
float k=0.15;   //premier paramÃ¨tre de l'Ã©lasticitÃ© (entre 0 et 1)
float d=0.9;    //deuxiÃ¨me paramÃ¨tre de l'Ã©lasticitÃ© (entre 0 et 1)
float xVStable=d;//Permet de stabilisÃ© la vitesse lorsque mousePressed=0
float yVStable=d/4;

// variable pour detecPartEauSourie
float xVitesse = 0; //la vitesse accumulÃ©e
float yVitesse = 0; 
int souriePressed=0; 
float mouseXOld=0;
float mouseYOld=0;
int lastTime=0;  //Lire les notes donne toujours un second regard sur un travail... (Pas besoins de chercher partout, j'en n'ai pas mis ailleurs que dans les dÃ©clarations de variables)

// Variable pour l'explosion
float velGen=1;
int nbCentre=8+32; // nombre de centre d'explosion, afin de permetre le bon nombre de particule par cerle p/r au total de particules
Particle [] pickles = new Particle [nbCentre*100]; // pickles c'est nom des particules // code de http://www.openprocessing.org/sketch/49434
int compteCentre=0 ; //dÃ©compte du nombre de centre, pour le placage des centre.
float g; //gravitÃ©
boolean dessinArcExploA = false; //permet de diriger la crÃ©ation des particules de cheveux pour l'explosion
boolean dessinArcExploB = false;
float cRExploSetup,cGExploSetup,cBExploSetup,cTExploSetup;



/*
Essentiel::
 
 TD faire les 7 Ã©tats possibles.
 
TD se servir de http://www.openprocessing.org/sketch/23866 pour le background.

TD rÃ©soudre le probÃ¨me de la box des X et des Y, probablement l'ajouter Ã  qulques part, et c'Est fini!!!! dans le fond, juste relancer un dessin avec les modif de x et y et le tour est jouÃ©!
TD on pourrais ajouter le code pour faire bouger avec la sourie si c'est pas compliquÃ©, ou fuckoff, juste le carrÃ© rouge Ã  la fin, en grossissant avec le millis() et ce serai super!
 TD 6 ajout du fucking carrÃ© de reset aprÃ¨s d'exploion
 
 Bon::
 
 
 Extra:: 
 
 TD5 tableau la croissance des couleurs sur le background avec lx



 Q si j'utilise le x pour dÃ©placer mon monstre, es-ce que le prof a toujours besoin de pouvoir le dÃ©placer?
 
 Q pour faire plusieurs niveau Ã  un jeu??
 
 
 
 
 */

void setup () {

  size (400, 400, P2D);
  smooth();
  noStroke(); 
  pg = createGraphics(400, 400);
  backG = createGraphics(400, 400);

  xDotR=5;
  yDotR=5;
  nbDotER=1000; 
  nbDotECR=200;
  nbDotAR=100;
  nbDotAB=200; 
  
    cRCorps=155;
  cGCorps=205;
  cBCorps=100;
  ecRGBCorps=50;



  cRCheveux=cRCorps*0.8;
  cGCheveux=cGCorps*0.8;
  cBCheveux=cBCorps*0.8;
  ecRGBCheveux=ecRGBCorps*0.6;

  cRYeux=255;
  cGYeux=255;
  cBYeux=255;
  ecRGBYeux=50;





  pgYeuxSetup();
  setupBackgroundPG();
  pg.beginDraw(); // mettre dans un redraw Ã©ventuellement.
  pg.background(0, 0, 0, 0); //la transparence peut Ãªtre gÃ©nÃ©rÃ©, mais pas enregistrÃ©
  pg.noStroke(); //dois Ãªtre mis dans beginDraw

  dessinCorps();

  dessinCheveux();

  pg.endDraw();

  setupPartEau(-100, -100, 500, 500);
  
  dessinYeuxExplo();
  dessinCorpsExplo();
//  dessinCheveuxExplo();
  
  
}



void draw () {
  background(0); 


  // champs de dÃ©tection:
  // le   detecMouseOverYeux(); a Ã©tÃ© placÃ© dans les Ã©tat pour Ã©viter son usage durant le camÃ©lÃ©on
  detecMonstreEtat();

  if (monstreEtat==0) {
    detecMouseOverYeux();
    
    if ( mousePressed) {


      pg.beginDraw(); // mettre dans un redraw Ã©ventuellement.
      pg.background(0, 0, 0, 0); //la transparence peut Ãªtre gÃ©nÃ©rÃ©, mais pas enregistrÃ©
      pg.noStroke(); //dois Ãªtre mis dans beginDraw
      dessinCorps();
      dessinCheveux();
      pg.endDraw();

      for (int j=0;j<etatYeux.length;j++) { // si la sourie est au dessu d'un oeil(2), l'oeil est demi-fermÃ©
        if (etatYeux[j]==2)
        {
          etatYeux[j]=1;
        }
      }
    }
    detecYeuxCligne();
    image(backG, 0, 0);
    image(pg, 0, 0); 
    dessinYeux();
      dessinForeground();
  }//fin de l'Ã©tat 0


  if (monstreEtat==1) {

    if (rewindHide==1) {

      float ratio = 0.2; // section d'Assouplissement des couleur
      cRCorps=(75-cRCorps)*ratio+cRCorps;// pour Ã©conomiser des variables, se rÃ©fÃ©rer au couleur des bkgroud dans setupBackgroundPG()
      cGCorps=(80-cGCorps)*ratio+cGCorps;
      cBCorps=(255-cBCorps)*ratio+cBCorps;   
      cRCheveux=(100-cRCheveux)*ratio+cRCheveux;// pour Ã©conomiser des variables, se rÃ©fÃ©rer au couleur des bkgroud dans setupBackgroundPG()
      cGCheveux=(105-cGCheveux)*ratio+cGCheveux;
      cBCheveux=(255-cBCheveux)*ratio+cBCheveux;

      if (cRCorps>=76) { // le changement est dessinnÃ© seulement lorsqu'il y a changement de couleur
        pg.beginDraw(); 
        pg.background(0, 0, 0, 0); //la transparence peut Ãªtre gÃ©nÃ©rÃ©, mais pas enregistrÃ©
        pg.noStroke(); 
        dessinCorps();
        dessinCheveux();
        pg.endDraw();
        pgYeuxHide(); // trace de programation du dÃ©but, les yeux son dessinÃ© dans un autre PG, malheureusement.
      } 
      else {
        monstreEtat=2;
      } // une fois le changement fait, oin envoie le tout Ã  l'Ã©tat 2, d'Attente.
    } 

    else {// si rewind hide est Ã  -1
    
      ecRGBCorps=50;
      ecRGBCheveux=ecRGBCorps*0.6;

      float ratio = 0.1; // section d'Assouplissement des couleur
      cRCorps=(155-cRCorps)*ratio+cRCorps;// pour Ã©conomiser des variables, se rÃ©fÃ©rer au couleur des bkgroud dans setupBackgroundPG()
      cGCorps=(205-cGCorps)*ratio+cGCorps;
      cBCorps=(50-cBCorps)*ratio+cBCorps;   
      cRCheveux=(cRCorps*0.8-cRCheveux)*ratio+cRCheveux;// pour Ã©conomiser des variables, se rÃ©fÃ©rer au couleur des bkgroud dans setupBackgroundPG()
      cGCheveux=(cGCorps*0.8-cGCheveux)*ratio+cGCheveux;
      cBCheveux=(cBCorps*0.8-cBCheveux)*ratio+cBCheveux;

      if (cRCorps<=154.5) {
        pg.beginDraw(); 
        pg.background(0, 0, 0, 0); //la transparence peut Ãªtre gÃ©nÃ©rÃ©, mais pas enregistrÃ©
        pg.noStroke(); 
        dessinCorps();
        dessinCheveux();
        pg.endDraw(); 
        pgYeuxHide();

        //section de reset Ã  la fin du unHide.
      } 
      else {        
        println("fin couleur");
        nbCliqueYeuxLeft=0; //permet de retourner Ã  l'Ã©tat 0
        rewindHide=1;
      }
    }
    for (int i=0; i<8;i++) { //permet d'Avoir tout les yeux fermÃ© lors du changement de couleur
      etatYeux[i]=0;
    }
    image(backG, 0, 0);
    image(pg, 0, 0);
    dessinYeuxHide();
      dessinForeground();
  }//fin de l'Ã©tatMonstre 1

  if (monstreEtat==2) { // attente en CamÃ©lÃ©on

    if (tempsAttenteHide==0) { //minuterie de camÃ©lÃ©on
   interval = 3000; 
      tempsAttenteHide = millis()+10000; // 10 00 ms = 10 sec
      println("debut_couleur");
    }
    if ( millis() >= tempsAttenteHide ) {//reset du temps d'attente
      tempsAttenteHide=0; 
      rewindHide=-1; // permet de retourner Ã  l'Ã©tat 1
      monstreEtat=1;
    }
    detecYeuxHide();
    
    // le tout doit Ãªtre dessinÃ©  chaque fois< mais sans chager le ID
    image(backG, 0, 0);
    image(pg, 0, 0); 
    dessinYeuxHide();
      dessinForeground();
  }//FIN de l'Ã©tatMonstre 2

  if (monstreEtat==3) { //monstre en dÃ©placement
    detecMouseOverYeux();
    nbCliqueYeuxLeft=0; //je pourrais aussi ne pas le mettre pour prendre en considÃ©ration les cliques en dÃ©placement, mais ca gÃ©nÃ©rerait plus de code, un peu too much... 

    if (cumulBouge>=1) { // permet un chiffre qui monte et descend 
      vBouge=-0.03; //vBouge est la vitesse d'extension du monstre
    }
    if (cumulBouge<=0) {
      vBouge=0.03; // plus le chiffre est grand (entre 0.03 et 0.1) plus le mouvement est saccadÃ©
    }

    cumulBouge=cumulBouge+vBouge; //le cacul doit Ãªtre extÃ©rieur Ã  la montÃ© et descente.

    float b=(0.6*sin(cumulBouge*TWO_PI-PI/2)+0.5); //multiplicateur* dÃ©placement saccadÃ© et avec une accÃ©lÃ©ration et dÃ©ccÃ©lÃ©ration. // utilisation du sin, transcrire http://grapheur.cours-de-math.eu/
    float c=(0.6*sin(cumulBouge*PI-PI/2)+0.5); // pour le bougeBouge, on doit diviser par 2 (PI) afin d'avoir une accÃ©lÃ©ration timÃ© avec le dÃ©placement horizontal. // 0.6 permet un dÃ©placement avec une amorce, tandis que 0.5 est rigide.
    y=c*3; //  le monstre devient plus haut lorsqu'il avance
    x=x+1.8*b*rewindBouge;// position prÃ©cÃ©dente + multiplicateur*dÃ©placement*direction donc une variation de -0.18 Ã  1.98 Ã©cart de 2.16 (avec 0.5*sin de 0 Ã  2)
    bougeBouge=map(c, 0, 1, 0.87, 1); //conversion pour le corps. On peut accÃ©lÃ©rÃ© ou dÃ©cÃ©rÃ©lÃ© avec le 0.85 //.88 c'est trop parfait


    pg.beginDraw(); // mettre dans un redraw Ã©ventuellement.
    pg.background(0, 0, 0, 0); //la transparence peut Ãªtre gÃ©nÃ©rÃ©, mais pas enregistrÃ©
    pg.noStroke(); //dois Ãªtre mis dans beginDraw
    dessinCorps();
    dessinCheveux();
    pg.endDraw();
    if ( mousePressed) {
      for (int j=0;j<etatYeux.length;j++) {// si la sourie est au dessu d'un oeil(2), l'oeil est fermÃ©
        if (etatYeux[j]==2)
        {
          etatYeux[j]=1;
        }
      }
    }
    image(backG, 0, 0);
    image(pg, 0, 0); 
    dessinYeuxRandom();
      dessinForeground();
  }//FIN de l'Ã©tat 3

  if (monstreEtat==4) { //monstre en dehors de l'Ã©cran
    detecMouseOverYeux();

    if (tempsAttente==0) { //temps d'Attente pour le monstre
      tempsAttente = millis()+5000; // 10 00 ms = 10 sec
      println("debut_attente");
    }
    if ( millis() >= tempsAttente ) { 
      monstreEtat=3; // retour Ã  l'Ã©tat 3
      tempsAttente=0;//reset le temps d'attente pour un prochain Ã©tat 4
      nbCliqueYeux=0; // reset du monbre de yeux rouge pour pouvoir retourner Ã  l'Ã©tat 0
      if (rewindBouge==1) {
        rewindBouge=-1;
        x=385-random(0, 1.2); //permet de redÃ©marer le monstre, pris Ã  400 dans l'Ã©tat 4 // le random donne un dÃ©calage pour que l'arrÃªt au centre soit alÃ©atoire.
      } 
      else { //permet de faire revenir le monstre du nÃ©gatif
        rewindBouge=1;
        x=-385-random(0, 1.2); //permet de redÃ©marer le monstre, pris Ã  -400 dans l'Ã©tat 4
      }
      println("retour");
    }
    image(backG, 0, 0);
      dessinForeground();
  } // FIN de l'Ã©tat 4, une fois que l'attente est fini.


  if (monstreEtat==6) {

          image(backG, 0, 0);

    for (int i=0; i<(pickles.length); i++) {
      pickles[i].explose();
    }
  }// FIN de l'Ã©tat 6
} // fin du VOID DRAW

void mousePressed() {

  if ( mouseButton == LEFT ) { //appliquÃ© uniquement 1 fois
    if (oeilSousLaSouris!=-1) {// si la sourie est sur un oeil
      if (etatYeux[oeilSousLaSouris]==3) { //et que l'oeil est rouge
        etatYeux[oeilSousLaSouris]=1; // l'oeil rouge est enlevÃ©
        nbYeuxRouge--; // le compte est diminuÃ©
      }
      nbCliqueYeuxLeft++; //le nombre de yeux pockÃ© est augmentÃ©.
    } 
    souriePressed = 1; //variable pour foreground.
    xVStable=0; //variable pour foreground
    yVStable=0; //variable pour foreground
  }

  if ( mouseButton == RIGHT ) { // pour mettre les yeux rouge avec Rclick
    for (int i=0;i<etatYeux.length;i++) {
      if (etatYeux[i]==2) { // si la sourie est au dessus d'un oeil, l'oeil deviens rouge sur click droit.
        idYeuxRouge=i;
        nbYeuxRouge++;
        nbCliqueYeux++;
        tempsYeuxRouge[i]=millis();
      }
    }
  }
}


void mouseReleased() {
  souriePressed = 0;//variable pour foreground
  xVStable=d;//variable pour foreground
  yVStable=d/1.5;//variable pour foreground
  idYeuxRouge=-1;
}

void setupBackgroundPG() {
  backG.beginDraw();
  backG.background(0, 0, 0, 0); //la transparence peut Ãªtre gÃ©nÃ©rÃ©, mais pas enregistrÃ©
  backG.noStroke(); 
  backG.smooth(); 
  // Dessin du Background
  xDotR=15;
  yDotR=15;
  nbDotRB=7000;

  cR=100;
  cG=105;
  cB=255;
  ecRGB=50;
  dessinRecBackInv(0, -20, 400, 240);

  cR=50;
  cG=55;
  cB=205;
  ecRGB=50;
  xDotR=10;
  yDotR=10;
  dessinRecBack(0, 220, 400, 170);

  backG.endDraw();
}

void dessinRecBack(float gaucheBox, float hautBox, float droiteBox, float basBox) {//forme pour le fond afin qu'il ne se dÃ©place pas avec x et y
  float a, countDotRB;
  int b;
  countDotRB = 1; 
  while (countDotRB<nbDotRB) {
    backG.fill ((int)random ( cR-ecRGB, cR+ecRGB), (int)random ( cG-ecRGB, cG+ecRGB), (int)random ( cB-ecRGB, cB+ecRGB)); //ajouter un drunken???
    a=countDotRB/nbDotRB;
    b=(int)(a*10+1); // conversion en int pour faciliter la gestions de l'Ã©lipse
    yDot = (a*(basBox+xDotRB)+hautBox+random(1, xDotRB/2)); 
    xDot = random(gaucheBox, gaucheBox+droiteBox); // y pour le rectagle
    xDotRB=b*xDotR;
    yDotRB=b*xDotR;
    backG.ellipse (xDot, yDot, xDotRB, yDotRB);
    countDotRB=countDotRB+1; //reset de la FORME
  }
}

void dessinRecBackInv(float gaucheBox, float hautBox, float droiteBox, float basBox) {//forme pour le fond afin qu'il ne se dÃ©place pas avec x et y
  float a, countDotRB;
  int b;
  countDotRB = nbDotRB; 
  while (countDotRB>0) {
    backG.fill ((int)random ( cR-ecRGB, cR+ecRGB), (int)random ( cG-ecRGB, cG+ecRGB), (int)random ( cB-ecRGB, cB+ecRGB)); //ajouter un drunken???
    a=countDotRB/nbDotRB;
    b=(int)((1-a)*3+1); // conversion en int pour faciliter la gestions de l'Ã©lipse
    yDot = (a*(basBox+xDotRB)+hautBox-random(1, xDotRB/2)); 
    xDot = random(gaucheBox, gaucheBox+droiteBox); // y pour le rectagle
     xDotRB=b*xDotR;
    yDotRB=b*xDotR;
    backG.ellipse (xDot, yDot, xDotRB, yDotRB);
    countDotRB=countDotRB-1;//comme on commence par dessiner les point les plus petit et plus Ã©loigner, il faut diminuer de 1 Ã  chaque fois.
  }
}

void dessinForeground() {

  if (souriePressed==1) {

    xVitesse=(mouseX - mouseXOld);
    yVitesse=(mouseY - mouseYOld); 
    mouseXOld=mouseX; //en second pour avoir une vitesse p/r Ã  la sourie et rachaichir
    mouseYOld=mouseY;  

    dessinPartEau(-100, -100, 500, 500);
    xVitesse = d * (xVitesse + k * (mouseX - mouseXOld)); //PErmet d'Ãªtre pret lorsque mouseRelease 
    yVitesse = d * (yVitesse + k * (mouseY - mouseYOld));
  }

  else { 
    mouseXOld=mouseX; //prÃ©sent afin d'initialiÃ© le mouseOld, 
    mouseYOld=mouseY;
    xVitesse = d * (xVitesse + k);
    yVitesse = d * (yVitesse + k);
    dessinPartEau(-100, -100, 500, 500);
  }

}

void dessinPartEau(float gaucheBox, float hautBox, float droiteBox, float basBox) {
  
  for (int i=0;i<nbDotPE;i++) {

   fill (cGPE[i], cGPE[i], cBPE[i], cTPE[i]); 


    xDotPE[i] = xDotPE[i] + (xVitesse-xVStable)*xyDeepPE[i]*1.3;
    yDotPE[i] = yDotPE[i] + (yVitesse-yVStable)*xyDeepPE[i]*1.3;
    xDotR=20*(xyDeepPE[i]);
    yDotR=20*(xyDeepPE[i]);

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

void setupPartEau(float gaucheBox, float hautBox, float droiteBox, float basBox) {//forme pour le fond afin qu'il ne se dÃ©place pas avec x et y
 
  cR=50; //couleurs pour les particules
  cG=105;
  cB=255;
  cT=85;
  ecRGB=40;
  ecT=30;

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



// DESSIN DANS PGraphic pg

void dessinEllRan(float xFormC, float yFormC, float xFormR, float yFormR) {

  for (int i=0;i<nbDotER;i++) {

    pg.fill ((int)random ( cR-ecRGB, cR+ecRGB), (int)random ( cG-ecRGB, cG+ecRGB), (int)random ( cB-ecRGB, cB+ecRGB));
    float radian= random (-TWO_PI, TWO_PI); //  permet un radian, une valeur, entre -2pi et 2 pi **code de Thomas Ouellet Fredericks

    xDot=cos(radian)*random(0, xFormR)+xFormC; //  permet de multiplier le cos par un random Ã  l'intÃ©rieur du radian, puis additionner le Centre du cercle  **code de Thomas Ouellet Fredericks
    yDot=sin(radian)*random(0, yFormR)+yFormC; // pour le y on prend un sinus Ã  la place

    pg.ellipse (x+xDot, y+yDot, xDotR, yDotR);
    //inspirÃ© de http://www.openprocessing.org/visuals/?visualID=46107
  }
}




void dessinEllConRan(float xFormC, float yFormC, float xFormR, float yFormR) {

  for (int i=0;i<nbDotECR;i++) {
    pg.fill ((int)random ( cR-ecRGB, cR+ecRGB), (int)random ( cG-ecRGB, cG+ecRGB), (int)random ( cB-ecRGB, cB+ecRGB));
    float radian= random (-TWO_PI, TWO_PI); //permet un radian, une valeur, entre -2pi et 2 pi **code de Thomas Ouellet Fredericks

    xDot=cos(radian)*xFormR+xFormC; // permet un arc de cercle de cercle, car xForm est le radian est le rayon et multipliÃ© par 1, random pour avoir une forme Ã  la place.  **code de Thomas Ouellet Fredericks
    yDot=sin(radian)*yFormR+yFormC; // sin pour les y

    pg.ellipse (x+xDot, y+yDot, xDotR, yDotR);
    //inspirÃ© de http://www.openprocessing.org/visuals/?visualID=46107
  }
}



void dessinArcRan(float xFormC, float yFormC, float xFormR, float yFormR, float arcFormA, float arcFormB) {

  for (int i=0;i<nbDotAR;i++) {
    pg.fill ((int)random ( cR-ecRGB, cR+ecRGB), (int)random ( cG-ecRGB, cG+ecRGB), (int)random ( cB-ecRGB, cB+ecRGB), 255);
    float radian= random (arcFormA, arcFormB); //permet un arc entre 0 et TWO_PI ** code inspirÃ© de Thomas Ouellet Fredericks

    xDot=cos(radian)*xFormR+xFormC; // permet un arc de cercle de cercle, car xForm est le radian est le rayon et multipliÃ© par 1, random pour avoir une forme Ã  la place. **code de Thomas Ouellet Fredericks
    yDot=sin(radian)*yFormR+yFormC; // sin pour les y

    pg.ellipse (x+xDot, y+yDot, xDotR, yDotR);
    //inspirÃ© de http://www.openprocessing.org/visuals/?visualID=46107
  }
}


void dessinArcBol(float xFormC, float yFormC, float xFormR, float yFormR, float arcFormA, float arcFormB, float arcFormR) {

  for (int i=0;i<nbDotAB;i++) {

    pg.fill ((int)random ( cR-ecRGB, cR+ecRGB), (int)random ( cG-ecRGB, cG+ecRGB), (int)random ( cB-ecRGB, cB+ecRGB), 255);
    float radian= random (arcFormA, arcFormB); //permet un arc entre 0 et TWO_PI ** code inspirÃ© de Thomas Ouellet Fredericks

    xDot=cos(radian)*random(xFormR-arcFormR, xFormR)+xFormC; //  permet un dÃ©grader en par le rayon arcFormR  **code inpirÃ© de Thomas Ouellet Fredericks
    yDot=sin(radian)*random(yFormR-arcFormR, yFormR)+yFormC; 

    pg.ellipse (x+xDot, y+yDot, xDotR, yDotR);
    //inspirÃ© de http://www.openprocessing.org/visuals/?visualID=46107
  }
}

void dessinCheveux() {
  // fonction dÃ©pendante: dessinArcBol dans PGraphic_pg
  nbDotAB=200;
  cR=cRCheveux;
  cG=cGCheveux;
  cB=cBCheveux;
  ecRGB=ecRGBCheveux;

  for (int i=0;i<=6;i++) { //6 cheveux*2

    float a=random(0, 100)/100;
    float b=random(0, 100)/100;

    dessinArcBol(a*70+280, 195, a*70+100, a*90+100, 1.1*PI, (1.9-a*0.6)*PI, 2); //permet d'Avoir un cour cheveux avec un grand cercle et un long cheveux avec un petit rayon
    dessinArcBol((1-b)*80+60, 195, b*80+100, b*90+100, (1.1+b*0.6)*PI, 1.9*PI, 2);
  }
}


void dessinCorps() {
  // fonction dÃ©pendante: dessinEllRan, dessinArcBol,dessinEllConRan, desinArcRan dans PGraphic_pg

  xDotR=5;
  yDotR=5;

  int countDep=0; //reset du nb de ligne
    int nbDep=3; //nb de ligne +1.
    int yDepC=220; //hauteur de dÃ©part
  
  int countForm=5-countDep; //plancher du nombre de ligne, 
  int nbForm=7; // nb maximal de forme - countform 7*7*3=150 pixel de large

  while (countDep<=nbDep) {

    while (countForm<=nbForm) {

      cR=cRCorps;//il faut mettre la couleur ici pour resetter les valeur Ã  chaque passage
      cG=cGCorps;
      cB=cBCorps;
      ecRGB=ecRGBCorps;



      float a=(bougeBouge*3+countDep*0.1)*sq(countForm)+random(-5,5); // mettre le (3+countDep*0.1) permet de dÃ©caler les rangÃ©es pour ne pas qu'elle soit allignÃ© verticalement,
      float bLeft = 53*(4-bougeBouge*3);
      float bRight = 400-53*(4-bougeBouge*3);
      float iLyne=yDepC+countForm*2+random(-2,2); // sauf ici (j'ai Ã©tÃ© Ã  la Manif du vendredi 13,  j'ai regardÃ© la manif Ã  vÃ©lo, je me suis fait arrÃªter, j'ai passÃ© 5h en prison, j'ai ressorti avec un ticket de 140$, pis j'ai pris 1h pour retrouver mon vÃ©lo. C'est ce qui m'a donnÃ© envie de tourner mon code)
      //permet une lÃ©gere descente vers le centre du dessin.

      dessinEllRan(bLeft+a, iLyne, 30, 25);
      

      // *** pour un dÃ©placement horizontal, tester le 50*(3*a)+(a+countDep*0.2) ou "a" a une valeur entre 3 et 1, ainsi, le tout devrait rester center et permettre une compression horizontale. (50*3=150 et sq(7)*1=50)    
      
      if (countForm!=nbForm) { // si on atteint la forme du centre des 2 cÃ´tÃ©s, evite de dessiner 2x la meme boule au centre
        dessinEllRan(bRight-a, iLyne, 30, 25); 

      }

      cR=cR*0.7; //dessin des OMBRES
      cG=cG*0.7;
      cB=cB*0.7;
      ecRGB=ecRGB*0.7; 
     
      nbDotAB=100;
      dessinArcBol(bLeft+a, iLyne, 30, 25, random(0, 0.5*PI), random(PI, 1.5*PI), random(4, 15));
     
      nbDotAB=50; //diviser en 2 pour combler le - et + 2PI
      if (countForm!=nbForm) {
        float epaisseur=random(4, 15);
        dessinArcBol(bRight-a, iLyne, 30, 25, 0, random(0.5*PI, PI), epaisseur); //doit etre scinder en 2 pour pouvoir passer le TWO_PI a 0
        dessinArcBol(bRight-a, iLyne, 30, 25, random(1.5*PI, TWO_PI), TWO_PI, epaisseur);
      }
      
      nbDotECR=150;
      dessinEllConRan(bLeft+a, iLyne, 30, 25);
      
      if (countForm!=nbForm) {
        dessinEllConRan(bRight-a, iLyne, 30, 25);
      }
      
      cR=cR*0.6; // dessin des CONTOURS
      cG=cG*0.6;
      cB=cB*0.6;
      ecRGB=ecRGB*0.6;  
      
      nbDotAR=20;
      dessinArcRan(bLeft+a, iLyne, 30, 25, random(0.4, 0.6*PI), random(0.5*PI, 1.3*PI));
      
      if (countForm!=nbForm) {
        dessinArcRan(bRight-a, iLyne, 30, 25, random(0, 0.2*PI), random(0.2*PI, 0.8*PI));
      }
      
      countForm=countForm+1;
    }
        yDepC=yDepC+35; //hauteur de chaque ligne
        countDep=countDep+1; //ajoute 1 aux nb de rangÃ©e
       countForm=5-countDep;// permet un dÃ©compte des exposant en descendant.
     
    
  }
}

void detecTempsYeuxRouge() {
  interval = (int)random(2000,3000);
  for (int i=0;i<etatYeux.length;i++) {
    if ( tempsYeuxRouge[i] <= millis() - interval && etatYeux[i]==3) { //permet de rÃ©ouvrir l'oeil apres l'interval et si'il est rouge
      etatYeux[i]=0; // ca serais cool que l'oeil soit entre-ouvert
      nbYeuxRouge--;
    }
  }
}



void detecMouseOverYeux() {


  // meme paramÃªtre que pour le dessin des yeux

    int nbDep=1; //nb de ligne +1
  int countDep=0; //reset du nb de ligne
  int yDepC=125; //hauteur de dÃ©part
  int countForm=6; // DOIT AUSSI ETRE CHANGÃ� A LA FIN DU WHILE total du nombre de ligne
  int nbForm=7; // nb maximal de forme - countform 7*7*3=150 pixel de large

  float distance=0;
  oeilSousLaSouris=-1;
  int oeilCourant = 0;


  while (countDep<=nbDep) { //pour la rangÃ©

    while (countForm<=nbForm) { // pour la sÃ©rie de yeux

      float a=(3+countDep*0.1)*sq(countForm); // permet l'ajustement central Ã  chaque ligne
      float b=3*sq(countForm);

      if (countForm==nbForm) { 
        a=b;
      }
      float yLine=yDepC+countForm*2;

      distance = dist( mouseX, mouseY, 53+a+x, yLine+y);
      if ( distance < rYeux ) { //il faut le mettre apres chaque dessin et ajouter 1 Ã  idYeux
        oeilSousLaSouris = oeilCourant; // il fallait que la variable d'oeil courant soit la mÃªme pour tout les yeux, et non un array
      }
      oeilCourant = oeilCourant + 1;

      if (countForm!=nbForm) { // evite de dessiner 1000 pts pour rien appliquÃ© partout pour alleger le script
        distance = dist( mouseX, mouseY, 347-a+x, yLine+y); //le deux sont dessinÃ© en mÃªme temps

        if ( distance < rYeux ) { 
          oeilSousLaSouris = oeilCourant;       //dernier qui modifie qui gagne
        }
        oeilCourant = oeilCourant + 1;
      }

      countForm=countForm+1;
    }
    yDepC=yDepC+45; 
    countDep=countDep+1; 
    countForm=6-countDep;
  }


  // println(oeilSousLaSouris);
  detecTempsYeuxRouge();
  if (idYeuxRouge!=-1) {
    etatYeux[idYeuxRouge]=3;
  }
  for (int i=0; i<8;i++) {
    if (etatYeux[i]!=3) {
      etatYeux[i]=0;
    }
  }  

  detecYeuxCligne(); 

  if (oeilSousLaSouris!=-1&&etatYeux[oeilSousLaSouris]!=3) {
    etatYeux[oeilSousLaSouris]=2;
  }
}

void detecMousePupille(int cId, float xPup, float yPup) { //tirÃ© de: http://www.openprocessing.org/visuals/?visualID=52046

  int dPup=5;
  nbDotER=40;
  xDotR=10;
  yDotR=10;

  float radians = atan2(mouseY-yPup, mouseX-xPup);
  float distance = dist(mouseX, mouseY, xPup, yPup);

  distance = constrain(distance, 0, (rYeux - dPup/2-xDotR));

  float pupilleX = cos(radians)* distance + xPup;
  float pupilleY = sin(radians)* distance + yPup;

  fill(0);


  if (idYeux==0) {
    float xPupCons= constrain(pupilleX, xPup-rYeux, xPup+rYeux/3);
    dessinEllPupille(xPupCons, pupilleY, dPup, dPup);
  }
  if (idYeux==1) {
    float xPupCons= constrain(pupilleX, xPup-rYeux/3, xPup+rYeux);
    dessinEllPupille(xPupCons, pupilleY, dPup, dPup);
  }
  if (idYeux==2 || idYeux==7) {
    dessinEllPupille(pupilleX, pupilleY, dPup, dPup);
  }
  if (idYeux==3 || idYeux==5) {
    float xPupCons= constrain(pupilleX, xPup-rYeux, xPup+rYeux/3.5); // le contrain est pour pas que la pupille soit cachÃ© par l'oeil devant. 
    dessinEllPupille(xPupCons, pupilleY, dPup, dPup);
  }
  if (idYeux==4 || idYeux==6) {
    float xPupCons= constrain(pupilleX, xPup-rYeux/3.5, xPup+rYeux);
    dessinEllPupille(xPupCons, pupilleY, dPup, dPup);
  }
}

void detecYeuxHide() {

  for (int i=0; i<8;i++) {
    if (etatYeux[i]!=2) {
      long clong; //utilisation de long variable, car Ã  l'origine le calcul se faisait avec des exposants
     
      clong = (int)random(millis(), tempsAttenteHide); 
      if (clong>=(tempsAttenteHide-10)) {
        etatYeux[i]=2;
        tempsYeuxHide[i]=millis();
      }
    }
  }
  int a =(int)random(400, 0.2*(millis()-tempsAttenteHide+10000)+900); //tempsattent est Ã  10sec. Permet au yeux d'ouvrir plus longtemps Ã  la fin. 
  for (int i=0;i<8;i++) { //une fois qu'un oeil est ouvert, il reste ouvert un bout de temps..
    if ( tempsYeuxHide[i] <= millis()-a && etatYeux[i]==2) { // le recyclage, c'est important!!
    
      etatYeux[i]=-2; // tant que ce n'est pas 2, ca marche.
    }
  }
}

void detecYeuxCligne() {

  for (int i=0; i<8;i++) {
    if (etatYeux[i]==0) {
      float a = random (0, 1);
      
      if (monstreEtat==3){
        a = random (0, 1.01); //lorsque le monstre se dÃ©place, il cligne plus souvent des yeux.
      }
      
      if (a>=.9993) { //chance qu'un oeil cligne
        idYeuxCligne=i; //attribution de son ID
        tempsYeuxCligne[i]=millis();
      }
      interval = (int)random(100, 200); // tenps alÃ©atoire

      if ( tempsYeuxCligne[i] <= millis() - interval && idYeuxCligne==i) { 
        idYeuxCligne=-1;
      }
    }
  }
    if (idYeuxCligne!=-1) { //permet au retour d'atribuer l'oeil qui cligne. ne peut Ãªtre intÃ©grer dans la loop..
    etatYeux[idYeuxCligne]=1;
  } 

}



void detecMonstreEtat() {
  // mettre touft les dÃ©tec de comportement ici  
  // vÃ©rifier les champs de dÃ©tection, ils s'entre-croise.
  if (x>=-0.7 && x<=0.7 && monstreEtat!=2) { //oui, c'est volontaire que parfois le x passe par dessus pour qu'il ne s'arrÃªte pas toujours au centre. C'est reliÃ© au fait que le sin de x*1.8 a une amplitude de 2.16
    monstreEtat=0;
    monstreAlerte=0;
  }

  if (nbCliqueYeuxLeft>8 && monstreEtat!=2) { //Ã©vite de rester pris dans l'Ã©tat 2.
    monstreEtat=1;
  }

  if (nbCliqueYeux>5) { //pour que monstreAlerte marche, il ne faut pas avoir d'autres. conditions

    if (monstreAlerte==1) { //si le monstre est en dÃ©placement, il retourne de bord si on l'attaque!
      if (rewindBouge==1) {
        rewindBouge=-1;
      } 
      else { 
        rewindBouge=1;
      }
      monstreAlerte=0;
    }

    monstreEtat=3;
  }

  if (x>=400 || x<=-400) {
    monstreAlerte=1;
    monstreEtat=4;
  }
  
  if (nbYeuxRouge>=6){
  monstreEtat=6;
  }
  
  
}

class Particle {
  //Chaque variable ici est indÃ©pendante pour chaque particule appelÃ©. Plus besoin de faire plusieurs Array!

  float xPart; //=mouseX; //on ne peut pas mettre mouseX car c'Est tirÃ© avant que la sourie soit dans le cadre
  float yPart; //=mouseY;
  float xPartOld; // pour la comparaison d'angle avec atan2
  float yPartOld;
  float zPart;
  float velX; // speed or velocity
  float velY; 
  float velZ;
  float zCible;
  float xFormR=20; //rayon


  // ajout perso
  float cRExplo=random ( cRExploSetup-ecRGBCorps, cRExploSetup+ecRGBCorps);//ici, le cR sera exclusif Ã  la particule.
  float cGExplo=random ( cGExploSetup-ecRGBCorps, cGExploSetup+ecRGBCorps);
  float cBExplo=random ( cBExploSetup-ecRGBCorps, cBExploSetup+ecRGBCorps);
  float cTExplo=random (50,150);




  Particle (float a, float b) { //crÃ©ation de la particule

    float xFormCPart = a; //a sert de transfert pour le cntre du cercle Ã  xFormC
    float yFormCPart = b;


    float radian= random (-TWO_PI, TWO_PI); //  permet un radian, une valeur, entre -2pi et 2 pi **code de Thomas Ouellet Fredericks
    xPart=cos(radian)*random(0, xFormR)+xFormCPart; //permet un cercle
    yPart=sin(radian)*random(0, xFormR)+yFormCPart; 
    zCible = 1.6* (dist(xFormR, xFormR, 0, 0)-dist (xPart-xFormCPart, yPart-yFormCPart, 0, 0));// permet une Ã©chelle entre le rayon maximun et le rayon du point. //le calcul se rafait pour bien ajuster les vÃ©locitÃ©s //le 1.6 est en rapport avec le 15

/* pas beau si le monstre est sur le cÃ´tÃ©. Disons que c'est 1h de perdu   
if (dessinArcExploA) { // seulement s'il faut dessiner les cheveux

      float aArc=random(0, 1);
      radian= random (1.1*PI, (1.9-aArc*0.6)*PI); //permet un arc entre 0 et TWO_PI ** code inspirÃ© de Thomas Ouellet Fredericks
      xPart=cos(radian)*(aArc*70+100)+aArc*70+xFormCPart; //  permet un dÃ©grader en par le rayon arcFormR  **code inpirÃ© de Thomas Ouellet Fredericks
      yPart=sin(radian)*(aArc*90+100)+yFormCPart;
      zCible = 40; // zCible Ã©tant entre 14 et 40, c'est fait la moyenne
    }

    if (dessinArcExploB) {
      float bArc=random(0, 1);
      radian= random ((1.1+bArc*0.6)*PI, 1.9*PI); //permet un arc entre 0 et TWO_PI ** code inspirÃ© de Thomas Ouellet Fredericks
      xPart=cos(radian)*(bArc*80+100)+(1-bArc)*80+xFormCPart; //  permet un dÃ©grader en par le rayon arcFormR  **code inpirÃ© de Thomas Ouellet Fredericks
      yPart=sin(radian)*(bArc*90+100)+yFormCPart;
      zCible = 40;
    }
    */


    velX=(xPart-xFormCPart)*velGen; //permet de faire exploser Ã  partir du centre du cercle divisÃ© en 2 pour une vitesse plus lente
    velY=(yPart-yFormCPart)*velGen;


    velZ = velGen/15; //(entre 0 et 1) La division par 15 permet un bon ratio p/r Ã  l'explosio  latÃ©rale
    zPart=1;
  }


  void still() { //temporaire, permet juste de placer l'explosion de dÃ©part.
      fill (cRExplo, cGExplo, cBExplo, cTExplo);
    ellipse (xPart, yPart, zPart, zPart);
  }

  void update () {//donc en crÃ©ant un void ici, on peut l'appeller par nom[instance].update
  }

  void explose() {

    g=.0015;   //GRAVITY http://www.openprocessing.org/sketch/52806
    xPartOld=xPart;
    yPartOld=yPart;
    xPart+=velX; //dans l'update, la vÃ©locitÃ© s'ajoute au X et Y
    velY= velY+g*zCible/(1.6* dist(xFormR, xFormR, 0, 0)); // RAPPORT ZCIBLE SUR ZMAX
    yPart+=velY; //x+=velX c'est la meme chose que x=x+velX
    zPart = (int)(zCible - zPart) * velZ/2 + zPart;


    if (xPart-x>width+100+zPart) {
      float a = xPart - (width+100 + zPart)  - random(50, 90) ; //ramÃ¨ne la particules autour de - 200 et transit
      xPart = yPart;
      yPart = a;

      float b = velX; //transit
      velX=velY*0.1+random(-1, 1)*0.1; //ajustement de la vÃ©locitÃ© et inversion avec le X, en plus de l'ajout d'une direction au X par le positif et nÃ©gatif     
      velY = random(0, 0.5)*zCible/(1.6*dist(xFormR, xFormR, 0, 0)); //- velX * ratio grosseur de la particule/grosseur maximale + random -1,1 (pour Ã©viter l'immobile) * ratio (pour se simplifier l'ajustement)
    }
    if (yPart-y > height+100 + zPart ) {

      yPart = yPart - (height+100 + zPart)  - 100 ;  
      velY=random(0, 0.5)*zCible/(1.6*dist(xFormR, xFormR, 0, 0));
    }
    if (xPart-x < (-100 - zPart)) {
      float a=xPart; //transit
      xPart = (height+100)-yPart; // pour changer l'Axe de la particule Ã  la verticale     
      yPart = a + zPart+random(10, 50); // pour remettre la particule en haut p/r Ã  sa position en X random pour Ã©viter les rangÃ©s

      float b = velX; //transit
      velX=-velY*0.1+random(-1, 1)*0.1; //ajustement de la vÃ©locitÃ© et inversion.      
      velY = random(0, 0.5)*zCible/(1.6*dist(xFormR, xFormR, 0, 0)); // - velX * ratio grosseur de la particule/grosseur maximale + random -1,1 (pour Ã©viter l'immobile) * ratio (pour se simplifier l'ajustement)
      //   xPart = xPart + (width+100 - zPart)  +100 ; //formule originale pour les particules.
    }
    if (yPart-y < (-100-zPart)) {
      yPart = yPart + zPart+ random(10, 50) ;// inverse la direction des particules
      velY = random(0, 0.5)*zCible/(1.6*dist(xFormR, xFormR, 0, 0));
    }

    fill (cRExplo, cGExplo, cBExplo, cTExplo);
    ellipse (xPart+x, yPart+y, zPart, zPart);
  }
}
void dessinYeuxExplo() {

  cRExploSetup=cRYeux;
  cGExploSetup=cGYeux;
  cBExploSetup=cBYeux;

  int countDep=0; //reset du nb de ligne
  int nbDep=1; //nb de ligne +1
  float yDepC=125; //hauteur de dÃ©part

  int countForm=6; // DOIT AUSSI ETRE CHANGÃ� A LA FIN DU WHILE total du nombre de ligne
  int nbForm=7; // nb maximal de forme - countform 7*7*3=150 pixel de large

  while (countDep<=nbDep) { //pour la rangÃ©

    while (countForm<=nbForm) { // pour la sÃ©rie de yeux

      float a=(3+countDep*0.1)*sq(countForm); // permet l'ajustement central Ã  chaque ligne
      float b=3*sq(countForm);
      if (countForm==nbForm) {
        a=b;
      } //Ã©vite de dessiner 2 yeux central
      float yLine=yDepC+countForm*2;

      //Ajout ici du code de dÃ©part pour l'explosion
      for (int i=pickles.length/nbCentre*compteCentre; i<=(pickles.length/nbCentre*(compteCentre+1)-1); i++) { 
        pickles [i] = new Particle (53+a, yLine); // c'Est la loop de crÃ©ation des particules, ici, chacun est crÃ©Ã©
      }

      compteCentre++; 

      if (countForm!=nbForm) {    //pour l'autre cÃ´tÃ© des yeux     

        //Ajout ici du code de dÃ©part pour l'explsoion, sysmÃ©tre
        for (int i=pickles.length/nbCentre*compteCentre; i<=(pickles.length/nbCentre*(compteCentre+1)-1); i++) { // code de http://www.openprocessing.org/sketch/49434
          pickles [i] = new Particle (347-a, yLine); // c'Est la loop de crÃ©ation des particules, ici, chacun est crÃ©Ã©
        }

        compteCentre++;
      }

      countForm=countForm+1;
    }

    yDepC=yDepC+45; //hauteur de chaque ligne
    countDep=countDep+1; //ajoute 1 aux nb de rangÃ©e

    countForm=6-countDep;// permet un dÃ©compte des exposant en montant.
  }
}


void dessinCorpsExplo() {
  cRExploSetup=cRCorps;
  cGExploSetup=cGCorps;
  cBExploSetup=cBCorps;


  int countDep=0; //reset du nb de ligne
  int nbDep=3; //nb de ligne +1.
  int yDepC=220; //hauteur de dÃ©part

  int countForm=5-countDep; //plancher du nombre de ligne, 
  int nbForm=7; // nb maximal de forme - countform 7*7*3=150 pixel de large

  while (countDep<=nbDep) {

    while (countForm<=nbForm) {

      float a=(bougeBouge*3+countDep*0.1)*sq(countForm)+random(-5, 5); // mettre le (3+countDep*0.1) permet de dÃ©caler les rangÃ©es pour ne pas qu'elle soit allignÃ© verticalement,
      float bLeft = 53*(4-bougeBouge*3);
      float bRight = 400-53*(4-bougeBouge*3);
      float iLyne=yDepC+countForm*2+random(-2, 2);      //permet une lÃ©gere descente vers le centre du dessin.


      //  dessinEllRan(bLeft+a, iLyne, 30, 25);

      for (int i=pickles.length/nbCentre*compteCentre; i<=(pickles.length/nbCentre*(compteCentre+1)-1); i++) { 
        pickles [i] = new Particle (bLeft+a, iLyne); // on ajoute le x et y ici, car contrairment Ã  dessinCorps() le x et y ne se retrouve pas dans l'ellispe
      }

      compteCentre++; 

      if (countForm!=nbForm) { // si on atteint la forme du centre des 2 cÃ´tÃ©s, evite de dessiner 2x la meme boule au centre
        // dessinEllRan(bRight-a, iLyne, 30, 25); 

        for (int i=pickles.length/nbCentre*compteCentre; i<=(pickles.length/nbCentre*(compteCentre+1)-1); i++) { 
          pickles [i] = new Particle (bRight-a, iLyne); // c'Est la loop de crÃ©ation des particules, ici, chacun est crÃ©Ã©
        }

        compteCentre++;
      }



      countForm=countForm+1;
    }
    yDepC=yDepC+35; //hauteur de chaque ligne
    countDep=countDep+1; //ajoute 1 aux nb de rangÃ©e
    countForm=5-countDep;// permet un dÃ©compte des exposant en descendant.
  }
}

/*
void dessinCheveuxExplo() { // on en met juste 2, pour Ãªtre proportionnel dans les particules
 cRExploSetup=cRCorps*.8;
  cGExploSetup=cGCorps*.8;
  cBExploSetup=cBCorps*.8;

  dessinArcExploA=true;
  for (int i=pickles.length/nbCentre*compteCentre; i<=(pickles.length/nbCentre*(compteCentre+1)-1); i++) { 
    pickles [i] = new Particle (280, 195); // c'Est la loop de crÃ©ation des particules, ici, chacun est crÃ©Ã©
  }
  compteCentre++; 
  dessinArcExploA=false;
  dessinArcExploB=true;
  for (int i=pickles.length/nbCentre*compteCentre; i<=(pickles.length/nbCentre*(compteCentre+1)-1); i++) { 
    pickles [i] = new Particle (60, 195); // c'Est la loop de crÃ©ation des particules, ici, chacun est crÃ©Ã©
  }
  compteCentre++; 
  dessinArcExploB=false;
}
*/
void dessinYeux() {
  idYeux=0; //reset de l'idYeux avant le dessin
  int countDep=0; //reset du nb de ligne
  int nbDep=1; //nb de ligne +1
  float yDepC=125; //hauteur de dÃ©part

  int countForm=6; // DOIT AUSSI ETRE CHANGÃ� A LA FIN DU WHILE total du nombre de ligne
  int nbForm=7; // nb maximal de forme - countform 7*7*3=150 pixel de large
  imageMode(CENTER);

  while (countDep<=nbDep) { //pour la rangÃ©

    while (countForm<=nbForm) { // pour la sÃ©rie de yeux

      float a=(3+countDep*0.1)*sq(countForm); // permet l'ajustement central Ã  chaque ligne
      float b=3*sq(countForm);
      if (countForm==nbForm) {
        a=b;
      } //Ã©vite de dessiner 2 yeux central
      float yLine=yDepC+countForm*2;

      int c=idYeux+8*etatYeux[idYeux];//permet d'Avoir un Ã©tat de yeux diffÃ©rent par ID //transfer de 1 Ã  8 en section de 8

      if (etatYeux[idYeux]==0) { // si la sourie n'est pas sur l'oeil, il faut dessiner l'oeil puis la pupille
        image(pgYeux[idYeux], 53+a+x, yLine+y);
        detecMousePupille(c, 53+a+x, yLine+y);
      } 
      else if (etatYeux[idYeux]==2) { // si la sourie est sur l'oeil, il faut dessiner l'oeil, puis la pupille, puis la paupiÃ¨re
        image(pgYeux[idYeux], 53+a+x, yLine+y);
        detecMousePupille(c, 53+a+x, yLine+y);
        image(pgYeux[c], 53+a+x, yLine+y);
      }
      else { // si la sourie est sur l'oeil et clique, il faut dessiner la paupiÃ¨re
        c=(int)random(0, 7.99)+8*etatYeux[idYeux];
        image(pgYeux[c], 53+a+x, yLine+y);// mettre le (3+countDep) permet de dÃ©caler les rangÃ©es, sq(countForm) est pour l'effet de cercle
      }

      idYeux=idYeux+1; 

      if (countForm!=nbForm) {         
        c=idYeux+8*etatYeux[idYeux]; 
        if (etatYeux[idYeux]==0) {
          image(pgYeux[idYeux], 347-a+x, yLine+y);
          detecMousePupille(c, 347-a+x, yLine+y);
        } 
        else if (etatYeux[idYeux]==2)
        {    
          image(pgYeux[idYeux], 347-a+x, yLine+y);
          detecMousePupille(c, 347-a+x, yLine+y);
          image(pgYeux[c], 347-a+x, yLine+y);
        }
        else {
          c=(int)random(0, 7.99)+8*etatYeux[idYeux];
          image(pgYeux[c], 347-a+x, yLine+y);// mettre le (3+countDep) permet de dÃ©caler les rangÃ©es, sq(countForm) est pour l'effet de cercle
        }

        idYeux=idYeux+1;
      }
      countForm=countForm+1;
    }

    yDepC=yDepC+45; //hauteur de chaque ligne
    countDep=countDep+1; //ajoute 1 aux nb de rangÃ©e

    countForm=6-countDep;// permet un dÃ©compte des exposant en montant.
  }
  imageMode(CORNERS);
}

void dessinYeuxRandom() {
  idYeux=0; //reset de l'idYeux avant le dessin

  int countDep=0; //reset du nb de ligne
  int nbDep=1; //nb de ligne +1
  float yDepC=125; //hauteur de dÃ©part

  int countForm=6; // DOIT AUSSI ETRE CHANGÃ� A LA FIN DU WHILE total du nombre de ligne
  int nbForm=7; // nb maximal de forme - countform 7*7*3=150 pixel de large
  imageMode(CENTER);

  while (countDep<=nbDep) { //pour la rangÃ©

    while (countForm<=nbForm) { // pour la sÃ©rie de yeux

      float a=(3+countDep*0.1)*sq(countForm); // permet l'ajustement central Ã  chaque ligne
      float b=3*sq(countForm);
      if (countForm==nbForm) {
        a=b;
      } //Ã©vite de dessiner 2 yeux central
      float yLine=yDepC+countForm*2;

      int c=(int)random(0, 7.99)+8*etatYeux[idYeux]; // c est maintenant random

      if (etatYeux[idYeux]==0) { // si la sourie n'est pas sur l'oeil, il faut dessiner l'oeil puis la pupille
        image(pgYeux[(int)random(0, 7.99)], 53+a+x, yLine+y);
        detecMousePupille(c, 53+a+x, yLine+y);
      } 
      else if (etatYeux[idYeux]==2) { // si la sourie est sur l'oeil, il faut dessiner l'oeil, puis la pupille, puis la paupiÃ¨re
        image(pgYeux[(int)random(0, 7.99)], 53+a+x, yLine+y);
        detecMousePupille(c, 53+a+x, yLine+y);
        image(pgYeux[c], 53+a+x, yLine+y);
      }
      else { // si la sourie est sur l'oeil et clique, il faut dessiner la paupiÃ¨re
        c=(int)random(0, 7.99)+8*etatYeux[idYeux];
        image(pgYeux[c], 53+a+x, yLine+y);// mettre le (3+countDep) permet de dÃ©caler les rangÃ©es, sq(countForm) est pour l'effet de cercle
      }

      idYeux=idYeux+1; 

      if (countForm!=nbForm) {         
        c=(int)random(0, 7.99)+8*etatYeux[idYeux]; 
        if (etatYeux[idYeux]==0) {
          image(pgYeux[(int)random(0, 7.99)], 347-a+x, yLine+y);
          detecMousePupille(c, 347-a+x, yLine+y);
        } 
        else if (etatYeux[idYeux]==2)
        {    
          image(pgYeux[(int)random(0, 7.99)], 347-a+x, yLine+y);
          detecMousePupille(c, 347-a+x, yLine+y);
          image(pgYeux[c], 347-a+x, yLine+y);
        }
        else {
          c=(int)random(0, 7.99)+8*etatYeux[idYeux];
          image(pgYeux[c], 347-a+x, yLine+y);// mettre le (3+countDep) permet de dÃ©caler les rangÃ©es, sq(countForm) est pour l'effet de cercle
        }

        idYeux=idYeux+1;
      }
      countForm=countForm+1;
    }

    yDepC=yDepC+45; //hauteur de chaque ligne
    countDep=countDep+1; //ajoute 1 aux nb de rangÃ©e

    countForm=6-countDep;// permet un dÃ©compte des exposant en montant.
  }
  imageMode(CORNERS);
}


void pgYeuxSetup() {

  //si bug, vÃ©rifier initialisation de variable

  for (int i=0;i<pgYeux.length; i++) { // aide de http://processing.org/discourse/yabb2/YaBB.pl?num=1207400658
    pgYeux[i] = createGraphics(rYeux*4, rYeux*4, P2D);
  }

  for (int i=0; i<8;i++) {//desin Yeux ouvert
    idYeux=i;

    pgYeux[idYeux].beginDraw();
    pgYeux[idYeux].background(0, 0, 0, 0); 
    pgYeux[idYeux].noStroke(); 
    dessinYeuxOuvert();

    pgYeux[idYeux].endDraw();
  }

  for (int i=8; i<16;i++) {//desin Yeux ferme
    idYeux=i;

    pgYeux[idYeux].beginDraw();
    pgYeux[idYeux].background(0, 0, 0, 0); 
    pgYeux[idYeux].noStroke(); 

    cR=cRCorps; // mettre hors-fonction, afin de contrÃ´ler les yeux fachÃ©
    cG=cGCorps;
    cB=cBCorps;
    ecRGB=ecRGBCorps;
    dessinYeuxFerme();

    pgYeux[idYeux].endDraw();
  }


  for (int i=16; i<24;i++) {//desin Yeux demi-ferme
    idYeux=i;

    pgYeux[idYeux].beginDraw();
    pgYeux[idYeux].background(0, 0, 0, 0); 
    pgYeux[idYeux].noStroke(); 

    dessinYeuxDemiFerme();

    pgYeux[idYeux].endDraw();
  }

  for (int i=24; i<32;i++) {//desin Yeux ferme et rouge
    idYeux=i;

    pgYeux[idYeux].beginDraw();
    pgYeux[idYeux].background(0, 0, 0, 0); 
    pgYeux[idYeux].noStroke(); 

    cR=cRCorps+10; // mettre hors-fonction, afin de contrÃ´ler les yeux fachÃ©
    cG=cGCorps*0.8;
    cB=cBCorps*0.8;
    ecRGB=ecRGBCorps;
    dessinYeuxFerme();

    pgYeux[idYeux].endDraw();
  }

  for (int i=40; i<48;i++) {//desin Yeux demi-ferme
    idYeux=i;

    pgYeux[idYeux].beginDraw();
    pgYeux[idYeux].background(0, 0, 0, 0); 
    pgYeux[idYeux].noStroke(); 

    cRCorps=110;
    cGCorps=110;
    cBCorps=255;

    dessinYeuxDemiFerme();

    cRCorps=155;
    cGCorps=205;
    cBCorps=50;


    pgYeux[idYeux].endDraw();
  }
}

void dessinYeuxOuvert() {

  cR=cRYeux;//il faut mettre la couleur ici pour resetter les valeur Ã  chaque passage
  cG=cGYeux;
  cB=cBYeux;
  ecRGB=ecRGBYeux;

  dessinEllRanYeux(2*rYeux, 2*rYeux, rYeux, rYeux); 

  cR=cR*0.75; //dÃ©gradÃ© des yeux
  cG=cG*0.75;
  cB=cB*0.75;
  ecRGB=ecRGB*0.9; 
  float c=random(12, 20);
  nbDotAB=80;

  dessinArcBolYeux(2*rYeux, 2*rYeux, rYeux, rYeux, 0, TWO_PI, c) ; 

  cR=cR*0.8; //contour de l'oeil
  cG=cG*0.75;
  cB=cB*0.8;
  ecRGB=ecRGB*0.9; 

  dessinEllConRanYeux(2*rYeux, 2*rYeux, rYeux, rYeux); 

  cR=cRCorps; //retour aux couleur du corps pour les PAUPIERES
  cG=cGCorps;
  cB=cBCorps;
  ecRGB=ecRGBCorps;

  c=random(4, 10); 
  nbDotAB=60;
  dessinArcBolYeux(2*rYeux, 2*rYeux, rYeux, rYeux, random(1.2*PI, 1.4*PI), random(1.6*PI, 1.8*PI), c); //dessus paupieres
  dessinArcBolYeux(2*rYeux, 2*rYeux, rYeux, rYeux, random(0.2*PI, 0.4*PI), random(0.6*PI, 0.8*PI), c); //desous paupieres

  cR=cR*0.8; //Dessin extÃ©rieur des paupieres
  cG=cG*0.75;
  cB=cB*0.8;
  ecRGB=ecRGB*0.9; 
  nbDotAR=25;
  dessinArcRanYeux(2*rYeux, 2*rYeux, rYeux, rYeux, random(PI, 1.2*PI), random(1.8*PI, 2*PI));
  dessinArcRanYeux(2*rYeux, 2*rYeux, rYeux, rYeux, random(0, 0.2*PI), random(0.8*PI, PI));
}

void dessinYeuxFerme() {



  dessinEllRanYeux(2*rYeux, 2*rYeux, rYeux, rYeux); 

  cR=cR*0.75; //dÃ©gradÃ© des paupieres
  cG=cG*0.75;
  cB=cB*0.75;
  ecRGB=ecRGB*0.9; 
  float c=random(12, 20);
  nbDotAB=100;

  dessinArcBolYeux(2*rYeux, 2*rYeux, rYeux, rYeux, 0, TWO_PI, c) ; 

  cR=cR*0.9; //contour de l'oeil
  cG=cG*0.9;
  cB=cB*0.9;
  ecRGB=ecRGB*0.9; 

  nbDotECR=150;
  dessinEllConRanYeux(2*rYeux, 2*rYeux, rYeux, rYeux); //paupiere fermÃ©

  nbDotAB=100;
  dessinArcBolYeux(2*rYeux, 2*rYeux, rYeux, random(rYeux/2, rYeux/10), 0, TWO_PI, c) ; 

  cR=cR*0.9; //Dessin extÃ©rieur des paupieres
  cG=cG*0.9;
  cB=cB*0.9;
  ecRGB=ecRGB*0.9; 
  nbDotAR=25;

  dessinArcRanYeux(2*rYeux, 2*rYeux, rYeux, random(rYeux/5, rYeux/30), random(PI, 1.2*PI), random(1.8*PI, 2*PI));  
  dessinArcRanYeux(2*rYeux, 2*rYeux, rYeux, random(rYeux/5, rYeux/30), random(0, 0.2*PI), random(0.8*PI, PI));
}


void dessinYeuxDemiFerme() {

  cR=cRCorps; //retour aux couleur du corps pour les PAUPIERES
  cG=cGCorps;
  cB=cBCorps;
  ecRGB=ecRGBCorps;

  float c=random(4, 10); 
  nbDotAB=800;
  dessinArcBolYeux(2*rYeux, 2*rYeux, rYeux, rYeux, random(1.2*PI, 1.4*PI), random(1.6*PI, 1.8*PI), c); //dessus paupieres
  dessinArcBolYeux(2*rYeux, 2*rYeux, rYeux, rYeux, random(0.2*PI, 0.4*PI), random(0.6*PI, 0.8*PI), c); //desous paupieres

  cR=cR*0.8; //Dessin extÃ©rieur des paupieres
  cG=cG*0.75;
  cB=cB*0.8;
  ecRGB=ecRGB*0.9; 
  nbDotAR=50;
  dessinArcRanYeux(2*rYeux, 2*rYeux, rYeux, rYeux, random(PI, 1.2*PI), random(1.8*PI, 2*PI));
  dessinArcRanYeux(2*rYeux, 2*rYeux, rYeux, rYeux, random(0, 0.2*PI), random(0.8*PI, PI));




  dessinEllConRanYeux(2*rYeux, 2*rYeux, rYeux, rYeux); //paupiere fermÃ©

  nbDotAB=200;
  dessinArcBolYeux(2*rYeux, 2*rYeux, rYeux, random(rYeux/1.5, rYeux/2.5), 0, TWO_PI, c) ; 

  cR=cR*0.9; //Dessin extÃ©rieur des paupieres
  cG=cG*0.9;
  cB=cB*0.9;
  ecRGB=ecRGB*0.9; 
  nbDotAR=10;

  dessinArcRanYeux(2*rYeux, 2*rYeux, rYeux, random(rYeux/1.5, rYeux/2.5), random(PI, 1.2*PI), random(1.8*PI, 2*PI));  
  dessinArcRanYeux(2*rYeux, 2*rYeux, rYeux, random(rYeux/1.5, rYeux/2.5), random(0, 0.2*PI), random(0.8*PI, PI));
}


void dessinEllRanYeux(float xFormC, float yFormC, float xFormR, float yFormR) {

  for (int i=0;i<nbDotER;i++) {

    pgYeux[idYeux].fill ((int)random ( cR-ecRGB, cR+ecRGB), (int)random ( cG-ecRGB, cG+ecRGB), (int)random ( cB-ecRGB, cB+ecRGB));
    float radian= random (-TWO_PI, TWO_PI); //  permet un radian, une valeur, entre -2pi et 2 pi **code de Thomas Ouellet Fredericks

    xDot=cos(radian)*random(0, xFormR)+xFormC; //  permet de multiplier le cos par un random Ã  l'intÃ©rieur du radian, puis additionner le Centre du cercle  **code de Thomas Ouellet Fredericks
    yDot=sin(radian)*random(0, yFormR)+yFormC; // pour le y on prend un sinus Ã  la place

    pgYeux[idYeux].ellipse (xDot, yDot, xDotR, yDotR);
    //inspirÃ© de http://www.openprocessing.org/visuals/?visualID=46107
  }
}




void dessinEllConRanYeux(float xFormC, float yFormC, float xFormR, float yFormR) {

  for (int i=0;i<nbDotECR;i++) {

    pgYeux[idYeux].fill ((int)random ( cR-ecRGB, cR+ecRGB), (int)random ( cG-ecRGB, cG+ecRGB), (int)random ( cB-ecRGB, cB+ecRGB));
    float radian= random (-TWO_PI, TWO_PI); //permet un radian, une valeur, entre -2pi et 2 pi **code de Thomas Ouellet Fredericks

    xDot=cos(radian)*xFormR+xFormC; 
    yDot=sin(radian)*yFormR+yFormC; 

    pgYeux[idYeux].ellipse (xDot, yDot, xDotR, yDotR);
    //inspirÃ© de http://www.openprocessing.org/visuals/?visualID=46107
  }
}



void dessinArcRanYeux(float xFormC, float yFormC, float xFormR, float yFormR, float arcFormA, float arcFormB) {

  for (int i=0;i<nbDotAR;i++) {

    pgYeux[idYeux].fill ((int)random ( cR-ecRGB, cR+ecRGB), (int)random ( cG-ecRGB, cG+ecRGB), (int)random ( cB-ecRGB, cB+ecRGB), 255);
    float radian= random (arcFormA, arcFormB); 

    xDot=cos(radian)*xFormR+xFormC; 
    yDot=sin(radian)*yFormR+yFormC; 
    pgYeux[idYeux].ellipse (xDot, yDot, xDotR, yDotR);
    //inspirÃ© de http://www.openprocessing.org/visuals/?visualID=46107
  }
}


void dessinArcBolYeux(float xFormC, float yFormC, float xFormR, float yFormR, float arcFormA, float arcFormB, float arcFormR) {

  for (int i=0;i<nbDotAB;i++) {

    pgYeux[idYeux].fill ((int)random ( cR-ecRGB, cR+ecRGB), (int)random ( cG-ecRGB, cG+ecRGB), (int)random ( cB-ecRGB, cB+ecRGB), 255);
    float radian= random (arcFormA, arcFormB);

    xDot=cos(radian)*random(xFormR-arcFormR, xFormR)+xFormC; 
    yDot=sin(radian)*random(yFormR-arcFormR, yFormR)+yFormC; 

    pgYeux[idYeux].ellipse (xDot, yDot, xDotR, yDotR);
    //inspirÃ© de http://www.openprocessing.org/visuals/?visualID=46107
  }
}

void dessinEllPupille(float xFormC, float yFormC, float xFormR, float yFormR) {

  cR=cRYeux*0.2; //dessin des PUPILLES
  cG=cGYeux*0.2;
  cB=cBYeux*0.2;
  ecRGB=ecRGBYeux*0.6;

  for (int i=0;i<nbDotER;i++) {

    fill ((int)random ( cR-ecRGB, cR+ecRGB), (int)random ( cG-ecRGB, cG+ecRGB), (int)random ( cB-ecRGB, cB+ecRGB));

    float radian= random (-TWO_PI, TWO_PI); 

    xDot=cos(radian)*random(0, xFormR)+xFormC; 
    yDot=sin(radian)*random(0, yFormR)+yFormC; 
    ellipse (xDot, yDot, xDotR, yDotR);

    //inspirÃ© de http://www.openprocessing.org/visuals/?visualID=46107
  }
  nbDotER=1000;
}


void dessinYeuxHide() { // la partie du ode avec les paupiÃ¨ere close ou ouverte a Ã©tÃ© gardÃ©.
  idYeux=0; //reset de l'idYeux avant le dessin

  int countDep=0; //reset du nb de ligne
  int nbDep=1; //nb de ligne +1
  float yDepC=125; //hauteur de dÃ©part

  int countForm=6; // DOIT AUSSI ETRE CHANGÃ� A LA FIN DU WHILE total du nombre de ligne
  int nbForm=7; // nb maximal de forme - countform 7*7*3=150 pixel de large
  imageMode(CENTER);

  while (countDep<=nbDep) { //pour la rangÃ©

    while (countForm<=nbForm) { // pour la sÃ©rie de yeux

      float a=(3+countDep*0.1)*sq(countForm); // permet l'ajustement central Ã  chaque ligne
      float b=3*sq(countForm);
      if (countForm==nbForm) {
        a=b;
      } //Ã©vite de dessiner 2 yeux central
      float yLine=yDepC+countForm*2;


      //BLOC DU DESSIN
      int c=idYeux+8*etatYeux[idYeux];
      if (etatYeux[idYeux]==2) { // si la sourie est sur l'oeil, il faut dessiner l'oeil, puis la pupille, puis la paupiÃ¨re
        image(pgYeux[idYeux], 53+a+x, yLine+y); //fond
        detecMousePupille(c, 53+a+x, yLine+y);//pupille
        int d = idYeux+40;
        image(pgYeux[d], 53+a+x, yLine+y);//paupiere
      }
      else { // dessiner la paupiÃ¨re en tout autre temps
        c=idYeux+32;
        image(pgYeux[c], 53+a+x, yLine+y);//permet de dessiner un oeil, alÃ©atoire, fermÃ©.
      }

      idYeux=idYeux+1; 

      if (countForm!=nbForm) { 
        c=idYeux+8*etatYeux[idYeux];
        if (etatYeux[idYeux]==2)
        {    
          image(pgYeux[idYeux], 347-a+x, yLine+y);
          detecMousePupille(c, 347-a+x, yLine+y);
          int d = idYeux+40;
          image(pgYeux[d], 347-a+x, yLine+y);
        }
        else {
          c=idYeux+32; // en addtionnant automatique 8, on tombe dans l'oeil dermÃ©, faudra desinner dans le 32 Ã  39
          image(pgYeux[c], 347-a+x, yLine+y);// mettre le (3+countDep) permet de dÃ©caler les rangÃ©es, sq(countForm) est pour l'effet de cercle
        }

        idYeux=idYeux+1;
      }
      countForm=countForm+1;
    }

    yDepC=yDepC+45; //hauteur de chaque ligne
    countDep=countDep+1; //ajoute 1 aux nb de rangÃ©e

    countForm=6-countDep;// permet un dÃ©compte des exposant en montant.
  }
  imageMode(CORNERS);
}


void pgYeuxHide() {

  for (int i=32; i<40;i++) {//desin Yeux ferme
    idYeux=i;

    pgYeux[idYeux].beginDraw();
    pgYeux[idYeux].background(0, 0, 0, 0); 
    pgYeux[idYeux].noStroke(); 

    cR=cRCheveux*1.2; // mettre hors-fonction, afin de contrÃ´ler les yeux fachÃ©
    cG=cGCheveux*1.2;
    cB=cBCheveux*1.3;
    ecRGB=ecRGBCheveux*1.3;
    dessinYeuxFerme();

    pgYeux[idYeux].endDraw();
  }
}



