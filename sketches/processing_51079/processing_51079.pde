
float x = 00;
float y = 10;
float xDot, yDot, xDotR, yDotR, xDotRB, yDotRB, xFormR, yFormR, xFormC, yFormC, arcFormA, arcFormB, arcFormR, yDepC;
//int nbDotAD;
int nbDotER, nbDotECR, nbDotRR, nbDotAR, nbDotAB, nbDep, nbForm;
int countDot, countDep, countForm;
float cR, cG, cB, cT, ecRGB, ecT, cRCorps, cGCorps, cBCorps, ecRGBCorps, cRYeux, cGYeux, cBYeux, ecRGBYeux ;
// vérifier si une valeur de c deviens négative, comment le fill agit, en fonction de ecRGB et de l'écart



void setup () {

  size (400, 400);
  smooth();
}
void draw () {
  float a, b, c, d; //variable à cour terme dans les whiles

  /*
background(0);   PImage ima;
   ima=loadImage("base.png");
   //inspiration de http://www.openprocessing.org/visuals/?visualID=50135
   image(ima, 0, 0);
   background(ima);
   */
  background(0);
  noStroke();
  nbDotER=350;


  nbDotRR=500;
  nbDotER=1000; 
  nbDotECR=200;
  nbDotAR=100;
  nbDotAB=200;

  //Déterminer les couleurs:
  cRCorps=155;
  cGCorps=205;
  cBCorps=50;
  ecRGBCorps=50;

  cRYeux=255;
  cGYeux=255;
  cBYeux=255;
  ecRGBYeux=50;


  // Dessin du Background
  xDotR=15;
  yDotR=15;
  nbDotRR=7000;

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

  cR=155;//background TRANSPARENT
  cG=255;
  cB=255;
  cT=70;
  ecRGB=100;
  ecT=20;
  xDotR=20;
  yDotR=20;
  nbDotRR=50;
  dessinRecTrans(0, 0, 400, 400);





  // le code suivant est pour le dessin du CORPS


  xDotR=5;
  yDotR=5;

  nbDep=3; //nb de ligne +1
  countDep=0; //reset du nb de ligne
  yDepC=325; //hauteur de départ
  countForm=2; //plancher du nombre de ligne, 
  nbForm=7; // nb maximal de forme - countform 7*7*3=150 pixel de large

  while (countDep<=nbDep) {

    while (countForm<=nbForm) {

      cR=cRCorps;//il faut mettre la couleur ici pour resetter les valeur à chaque passage
      cG=cGCorps;
      cB=cBCorps;
      ecRGB=ecRGBCorps;

      dessinEllRan(50+(3+countDep*0.2)*sq(countForm), yDepC+countForm*2, 30, 25);// mettre le (3+countDep) permet de décaler les rangées, sq(countForm) est pour l'effet de cercle 
 // *** pour un déplacement horizontal, tester le 50*(3*a)+(a+countDep*0.2) ou "a" a une valeur entre 3 et 1, ainsi, le tout devrait rester center et permettre une compression horizontale. (50*3=150 et sq(7)*1=50)    
      if (countForm!=nbForm) { // evite de dessiner 1000 pts pour rien appliqué partout pour alleger le script
        dessinEllRan(350-(3+countDep*0.2)*sq(countForm), yDepC+countForm*2, 30, 25); // et yDepC+countForm*2 permet de descendre vers le centre
      }

      cR=cR*0.7; //dessin des OMBRES
      cG=cG*0.7;
      cB=cB*0.7;
      ecRGB=ecRGB*0.7; 
      nbDotAB=100;
      dessinArcBol(50+(3+countDep*0.2)*sq(countForm), yDepC+countForm*2, 30, 25, random(0, 0.5*PI), random(PI, 1.5*PI), random(4, 15));
      nbDotAB=50;
      if (countForm!=nbForm) {
        a=random(4, 15);
        dessinArcBol(350-(3+countDep*0.2)*sq(countForm), yDepC+countForm*2, 30, 25, 0, random(0.5*PI, PI), a); //doit etre scinder en 2 pour pouvoir passer le TWO_PI a 0
        dessinArcBol(350-(3+countDep*0.2)*sq(countForm), yDepC+countForm*2, 30, 25, random(1.5*PI, TWO_PI), TWO_PI, a);
      }
      nbDotECR=150;

      dessinEllConRan(50+(3+countDep*0.2)*sq(countForm), yDepC+countForm*2, 30, 25); 
      if (countForm!=nbForm) {
        dessinEllConRan(350-(3+countDep*0.2)*sq(countForm), yDepC+countForm*2, 30, 25);
      }
      cR=cR*0.6; // dessin des CONTOURS
      cG=cG*0.6;
      cB=cB*0.6;
      ecRGB=ecRGB*0.6;  
      nbDotAR=20;
      dessinArcRan(50+(3+countDep*0.2)*sq(countForm), yDepC+countForm*2, 30, 25, random(0.4, 0.6*PI), random(0.5*PI, 1.3*PI));
      if (countForm!=nbForm) {
        dessinArcRan(350-(3+countDep*0.2)*sq(countForm), yDepC+countForm*2, 30, 25, random(0, 0.2*PI), random(0.2*PI, 0.8*PI));
      }
      countForm=countForm+1;
    }

    yDepC=yDepC-35; //hauteur de chaque ligne
    countDep=countDep+1; //ajoute 1 aux nb de rangée
    countForm=2+countDep;// permet un décompte des exposant en montant.
  }


            //Dessin des cheveux
      nbDotAB=200;
    cR=cRCorps*0.8;
    cG=cGCorps*0.8;
        cB=cBCorps*0.8;
            ecRGB=ecRGBCorps*0.6;
  countForm=0; 
  nbForm=6; // nb maximal de forme+1
      while (countForm<=nbForm) {   
       a=random(0,100)/100;
       b=random(0,100)/100;
  dessinArcBol(a*70+280,195, a*70+100, a*90+100, 1.1*PI, (1.9-a*0.6)*PI, 2); //permet d'Avoir un cour cheveux avec un grand cercle et un long cheveux avec un petit rayon
      dessinArcBol((1-b)*80+60,195, b*80+100, b*90+100, (1.1+b*0.6)*PI, 1.9*PI, 2);
   countForm=countForm+1;
    }


  // le code suivant est le dessin des YEUX
  //
  //

  nbDep=1; //nb de ligne +1
  countDep=0; //reset du nb de ligne
  yDepC=125; //hauteur de départ
  countForm=6; // DOIT AUSSI ETRE CHANGÉ A LA FIN DU WHILE total du nombre de ligne
  nbForm=7; // nb maximal de forme - countform 7*7*3=150 pixel de large

  while (countDep<=nbDep) {

    while (countForm<=nbForm) {
      


      cR=cRYeux;//il faut mettre la couleur ici pour resetter les valeur à chaque passage
      cG=cGYeux;
      cB=cBYeux;
      ecRGB=ecRGBYeux;

      a=(3+countDep*0.1)*sq(countForm); // permet l'ajustement central à chaque ligne
      b=3*sq(countForm);
      if (countForm==nbForm) {
        a=b;
      }

      dessinEllRan(53+a, yDepC+countForm*2, 30, 30);// mettre le (3+countDep) permet de décaler les rangées, sq(countForm) est pour l'effet de cercle 
      if (countForm!=nbForm) { // evite de dessiner 1000 pts pour rien appliqué partout pour alleger le script
        dessinEllRan(347-a, yDepC+countForm*2, 30, 30);
      }

      cR=cR*0.75;
      cG=cG*0.75;
      cB=cB*0.75;
      ecRGB=ecRGB*0.9; 
      c=random(12, 20);
      nbDotAB=80;
      dessinArcBol(53+a, yDepC+countForm*2, 30, 30, 0, TWO_PI, c);
      if (countForm!=nbForm) {
      dessinArcBol(347-a, yDepC+countForm*2, 30, 30, 0, TWO_PI, c);
      }
      cR=cR*0.8;
      cG=cG*0.75;
      cB=cB*0.8;
      ecRGB=ecRGB*0.9; 
      dessinEllConRan(53+a, yDepC+countForm*2, 30, 30); 
      if (countForm!=nbForm) {
      dessinEllConRan(347-a, yDepC+countForm*2, 30, 30); 
      }
      cR=cRCorps;//retour aux couleur du corps pour les PAUPIERES
      cG=cGCorps;
      cB=cBCorps;
      ecRGB=ecRGBCorps;

      c=random(4, 10); 
      nbDotAB=60;
      dessinArcBol(53+a, yDepC+countForm*2, 30, 30, random(1.2*PI, 1.4*PI), random(1.6*PI, 1.8*PI), c);
      
      dessinArcBol(53+a, yDepC+countForm*2, 30, 30, random(0.2*PI, 0.4*PI), random(0.6*PI, 0.8*PI), c);
      if (countForm!=nbForm) {
      dessinArcBol(347-a, yDepC+countForm*2, 30, 30, random(1.2*PI, 1.4*PI), random(1.6*PI, 1.8*PI), c);
      dessinArcBol(347-a, yDepC+countForm*2, 30, 30, random(0.2*PI, 0.4*PI), random(0.6*PI, 0.8*PI), c);
      }
      
         
      
      cR=cR*0.8; //Dessin extérieur des paupieres
      cG=cG*0.75;
      cB=cB*0.8;
      ecRGB=ecRGB*0.9; 
      nbDotAR=25;
      dessinArcRan(53+a, yDepC+countForm*2, 30, 30, random(PI, 1.2*PI), random(1.8*PI, 2*PI));
      
      dessinArcRan(53+a, yDepC+countForm*2, 30, 30, random(0, 0.2*PI), random(0.8*PI, PI));
      if (countForm!=nbForm) {
      dessinArcRan(347-a, yDepC+countForm*2, 30, 30, random(0, 0.2*PI), random(0.8*PI, PI));    
dessinArcRan(347-a, yDepC+countForm*2, 30, 30, random(PI, 1.2*PI), random(1.8*PI, 2*PI));   
      }
      

      countForm=countForm+1;
    }

    cR=cRYeux*0.2; //dessin des PUPILLES
    cG=cGYeux*0.2;
    cB=cBYeux*0.2;
    ecRGB=ecRGBYeux*0.6;

    if (countDep==0) { // permet de dessiner juste une fois les pupilles.
      print ("_a_") ;
      dessinEllRan(140, yDepC, 5, 5); 
      dessinEllRan(200, yDepC, 6, 5); 
      dessinEllRan(260, yDepC, 5, 5);
    } 
    else { 
      print ("_b_") ;  
      dessinEllRan(104, yDepC+10, 3, 6); 
      dessinEllRan(150, yDepC+11, 5, 6); 
      dessinEllRan(200, yDepC+14, 6, 6); 
      dessinEllRan(250, yDepC+12, 5, 6); 
      dessinEllRan(296, yDepC+9, 3, 6);
    }

    yDepC=yDepC+45; //hauteur de chaque ligne
    countDep=countDep+1; //ajoute 1 aux nb de rangée
    print (countDep);
    countForm=6-countDep;// permet un décompte des exposant en montant.
    print(countForm);
    print("___");
  }



   cR=205;
   cG=205;
   cB=205;
   cT=50;
   ecRGB=50;
   ecT=20;
   
   xDotR=70;
   yDotR=70;
   nbDotRR=10;
   dessinRecTrans(0, 0, 400, 400);
   xDotR=30;
   yDotR=30;
   nbDotRR=20;
   dessinRecTrans(0, 0, 400, 400);
   
   

  noLoop ();
} // fin du VOID DRAW



























void dessinEllRan(float xFormC, float yFormC, float xFormR, float yFormR) {

  // ne pas oublier de reseter la variable juste avant le while
  countDot = 0; // le while suivant est pour le dessin des dots
  while (countDot<nbDotER) {
    fill ((int)random ( cR-ecRGB, cR+ecRGB), (int)random ( cG-ecRGB, cG+ecRGB), (int)random ( cB-ecRGB, cB+ecRGB));
    float radian= random (-TWO_PI, TWO_PI); //  permet un radian, une valeur, entre -2pi et 2 pi **code de Thomas Ouellet Fredericks

    // xDot=cos(radian)*xFormR+xFormC; // permet un arc de cercle de cercle, car xForm est le radian est le rayon et multiplié par 1, random pour avoir une forme à la place.
    // yDot=sin(radian)*yFormR+yFormC; // sin pour les y

    // xDot = random (xFormC-xFormR,xFormC+xFormR); // Permet un rectangle de cercle, en modeRect(CENTER)
    // yDot = random(yFormC-yFormR,yFormC+yFormR); // y pour le rectagle

    xDot=cos(radian)*random(0, xFormR)+xFormC; //  permet de multiplier le cos par un random à l'intérieur du radian, puis additionner le Centre du cercle  **code de Thomas Ouellet Fredericks
    yDot=sin(radian)*random(0, yFormR)+yFormC; // pour le y on prend un sinus à la place

    ellipse (x+xDot, y+yDot, xDotR, yDotR);
    countDot=countDot+1; //reset de la FORME
    //inspiré de http://www.openprocessing.org/visuals/?visualID=46107
  }
}




void dessinEllConRan(float xFormC, float yFormC, float xFormR, float yFormR) {

  // ne pas oublier de reseter la variable juste avant le while
  countDot = 0; // le while suivant est pour le dessin des dots
  while (countDot<nbDotECR) {
    fill ((int)random ( cR-ecRGB, cR+ecRGB), (int)random ( cG-ecRGB, cG+ecRGB), (int)random ( cB-ecRGB, cB+ecRGB));
    float radian= random (-TWO_PI, TWO_PI); //permet un radian, une valeur, entre -2pi et 2 pi **code de Thomas Ouellet Fredericks

    xDot=cos(radian)*xFormR+xFormC; // permet un arc de cercle de cercle, car xForm est le radian est le rayon et multiplié par 1, random pour avoir une forme à la place.  **code de Thomas Ouellet Fredericks
    yDot=sin(radian)*yFormR+yFormC; // sin pour les y

    ellipse (x+xDot, y+yDot, xDotR, yDotR);
    countDot=countDot+1; //reset de la FORME
    //inspiré de http://www.openprocessing.org/visuals/?visualID=46107
  }
}

void dessinRecRan(float xFormC, float yFormC, float xFormR, float yFormR) {

  // ne pas oublier de reseter la variable juste avant le while
  countDot = 0; // le while suivant est pour le dessin des dots
  while (countDot<nbDotRR) {
    fill ((int)random ( cR-ecRGB, cR+ecRGB), (int)random ( cG-ecRGB, cG+ecRGB), (int)random ( cB-ecRGB, cB+ecRGB));

    xDot = random (xFormC, xFormC+xFormR); // Permet un rectangle de cercle, en modeRect(CORNER)
    yDot = random(yFormC, yFormC+yFormR); // y pour le rectagle

    ellipse (x+xDot, y+yDot, xDotR, yDotR);
    countDot=countDot+1; //reset de la FORME
    //inspiré de http://www.openprocessing.org/visuals/?visualID=46107
  }
}


void dessinArcRan(float xFormC, float yFormC, float xFormR, float yFormR, float arcFormA, float arcFormB) {


  countDot = 0; // le while suivant est pour le dessin des dots
  while (countDot<nbDotAR) {
    fill ((int)random ( cR-ecRGB, cR+ecRGB), (int)random ( cG-ecRGB, cG+ecRGB), (int)random ( cB-ecRGB, cB+ecRGB), 255);
    float radian= random (arcFormA, arcFormB); //permet un arc entre 0 et TWO_PI ** code inspiré de Thomas Ouellet Fredericks

    xDot=cos(radian)*xFormR+xFormC; // permet un arc de cercle de cercle, car xForm est le radian est le rayon et multiplié par 1, random pour avoir une forme à la place. **code de Thomas Ouellet Fredericks
    yDot=sin(radian)*yFormR+yFormC; // sin pour les y

    ellipse (x+xDot, y+yDot, xDotR, yDotR);
    countDot=countDot+1; //reset de la FORME
    //inspiré de http://www.openprocessing.org/visuals/?visualID=46107
  }
}


void dessinArcBol(float xFormC, float yFormC, float xFormR, float yFormR, float arcFormA, float arcFormB, float arcFormR) {
  float cDotRatio, xDotRef, yDotRef, xyDotR;
  /* avant c'était pour un dégrade de couleur
   yDotRef=sin(PI)*(yFormR-arcFormR+yFormC); 
   xDotRef=sin(PI)*(xFormR-arcFormR+xFormC); 
   xyDotR=sqrt(sq(xDotRef-xFormC)+sq(yDotRef-yFormC));
   */
  countDot = 0; // le while suivant est pour le dessin des dots
  while (countDot<nbDotAB) {
    fill ((int)random ( cR-ecRGB, cR+ecRGB), (int)random ( cG-ecRGB, cG+ecRGB), (int)random ( cB-ecRGB, cB+ecRGB), 255);
    float radian= random (arcFormA, arcFormB); //permet un arc entre 0 et TWO_PI ** code inspiré de Thomas Ouellet Fredericks
    xDot=cos(radian)*random(xFormR-arcFormR, xFormR)+xFormC; //  permet un dégrader en par le rayon arcFormR  **code inpiré de Thomas Ouellet Fredericks
    yDot=sin(radian)*random(yFormR-arcFormR, yFormR)+yFormC; 
    /*
    cDotRatio= (sqrt(sq(xDot-xFormC)+sq(yDot-yFormC)))/xyDotR; // DÉGRADÉ
     fill (cR*cDotRatio, cG*cDotRatio, cB*cDotRatio);
     */
    ellipse (x+xDot, y+yDot, xDotR, yDotR);
    countDot=countDot+1; //reset de la FORME
    //inspiré de http://www.openprocessing.org/visuals/?visualID=46107
  }
}

void dessinRecTrans(float xFormC, float yFormC, float xFormR, float yFormR) {//forme pour le fond afin qu'il ne se déplace pas avec x et y

  // ne pas oublier de reseter la variable juste avant le while
  countDot = 0; // le while suivant est pour le dessin des dots
  while (countDot<nbDotRR) {
    fill ((int)random ( cR-ecRGB, cR+ecRGB), (int)random ( cG-ecRGB, cG+ecRGB), (int)random ( cB-ecRGB, cB+ecRGB), (int)random ( cT-ecT, cT+ecT));

    xDot = random (xFormC, xFormC+xFormR); // Permet un rectangle de cercle, en modeRect(CORNER)
    yDot = random(yFormC, yFormC+yFormR); // y pour le rectagle

    ellipse (xDot, yDot, xDotR, yDotR);
    countDot=countDot+1; //reset de la FORME
    //inspiré de http://www.openprocessing.org/visuals/?visualID=46107
  }
}

    void dessinRecBack(float xFormC, float yFormC, float xFormR, float yFormR) {//forme pour le fond afin qu'il ne se déplace pas avec x et y
     float a, countDotRB;
     int b;
 countDotRB = 1; // le while suivant est pour le dessin des dots

 while (countDotRB<nbDotRR) {
 fill ((int)random ( cR-ecRGB, cR+ecRGB), (int)random ( cG-ecRGB, cG+ecRGB), (int)random ( cB-ecRGB, cB+ecRGB)); //ajouter un drunken???
 a=countDotRB/nbDotRR;
 b=(int)(a*10+1); // conversion en int pour faciliter la gestions de l'élipse
 yDot = (a*(yFormR+xDotRB)+yFormC+random(1,xDotRB/2)); 
 xDot = random(xFormC, xFormC+xFormR); // y pour le rectagle
 xDotRB=b*xDotR;
 yDotRB=b*xDotR;
 ellipse (xDot, yDot, xDotRB, yDotRB);
 countDotRB=countDotRB+1; //reset de la FORME
 //inspiré de http://www.openprocessing.org/visuals/?visualID=46107
 }
 }
 
     void dessinRecBackInv(float xFormC, float yFormC, float xFormR, float yFormR) {//forme pour le fond afin qu'il ne se déplace pas avec x et y
     float a, countDotRB;
     int b;
 countDotRB = nbDotRR; // le while suivant est pour le dessin des dots

 while (countDotRB>0) {
 fill ((int)random ( cR-ecRGB, cR+ecRGB), (int)random ( cG-ecRGB, cG+ecRGB), (int)random ( cB-ecRGB, cB+ecRGB)); //ajouter un drunken???
 a=countDotRB/nbDotRR;
 b=(int)((1-a)*3+1); // conversion en int pour faciliter la gestions de l'élipse
 yDot = (a*(yFormR+xDotRB)+yFormC-random(1,xDotRB/2)); 
 xDot = random(xFormC, xFormC+xFormR); // y pour le rectagle
 xDotRB=b*xDotR;
 yDotRB=b*xDotR;
 ellipse (xDot, yDot, xDotRB, yDotRB);
 countDotRB=countDotRB-1; //reset de la FORME
 //inspiré de http://www.openprocessing.org/visuals/?visualID=46107
 }
 }
 
 
 
 
 void dessinRecRanFond(float xFormC, float yFormC, float xFormR, float yFormR) { //forme pour le fond afin qu'il ne se déplace pas avec x et y

  countDot = 0; // le while suivant est pour le dessin des dots
  while (countDot<nbDotRR) {
    fill ((int)random ( cR-ecRGB, cR+ecRGB), (int)random ( cG-ecRGB, cG+ecRGB), (int)random ( cB-ecRGB, cB+ecRGB));

    xDot = random (xFormC, xFormC+xFormR); // Permet un rectangle de cercle, en modeRect(CORNER)
    yDot = random(yFormC, yFormC+yFormR); // y pour le rectagle

    ellipse (xDot, yDot, xDotR, yDotR);
    countDot=countDot+1; //reset de la FORME
    //inspiré de http://www.openprocessing.org/visuals/?visualID=46107
  }
}

            
