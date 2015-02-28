
//Déclaration des variables et des tableaux

int[] angleTentacle = new int[8];
float[] colorTentacle = new float[8];
float[] tabOndulation;
int direction = -1;
int vitesse = 1;
int angleWing = 1;
int directionWing = -1;
float vitesseWing = -1;
float x, y, counter, distanceCorps, rayon, etatCorps, oscY, tombeCounter, bougeAssoupli, timeStampOsc;
float intervalleOsc, bougeTentacle, timeStampTentacle, intervalleTentacle, countTentacle, vitesseTentacle;
int timeStamp, intervalle, fache, fronce ;

void setup() { 
  size(400, 400);
  frameRate(30);
  smooth();
  randomSeed(0); //garde les mêmes valeurs de couleurs qui ont jadis été random pour les tentacules
  //Détermine l'angle des tentacules (on ne le veut qu'une seule fois par tentacule)
  for (int i = 0; i <= 6; i++) {
    angleTentacle[i] = 30 - i*8; //angle entre -30 et 30 qui augmente pour chaque tentacule
    colorTentacle[i] = random(0, 25); //sert à mettre les couleurs des tentacules dans un ordre random une fois (sera utilisé dans draw)
  }

//Rayon de la zone d'interactivité du corps
  rayon = 100;

//Variables pour la vitesse d'oscillation du monstre
  intervalle = 2000;
  intervalleOsc = 50;
  bougeAssoupli=0;
  
  //Variables pour le mouvement des tentacules et leur assouplissement
  bougeTentacle = 1;
  countTentacle = 0.01;
  vitesseTentacle = 0.01;
  intervalleTentacle = 50;
}


void draw() { //Exécuté un nombre de fois x par seconde, défini par frameRate dans le setup
  background(127);
  pushMatrix();
  counter += 0.08;


  x = width*0.5;
  y = height*0.5;


 // Changements d'intensité de l'état fâché (1 && mousePressed)


  if (mousePressed && etatCorps == 1) {
     
     //La vitesse des tentacules augmente jusqu'à 5 lorsqu'il se fâche
      vitesseTentacle+=0.1;
      if (vitesseTentacle>=5) {
        vitesseTentacle=5;
      } 
      
      //Assouplissement changement de vitesse fâché
      bougeAssoupli = (3 - bougeAssoupli)*0.05 + bougeAssoupli;
 
  }
  else { //else si l'état n'est pas 1 ou pas mousePressed     
 //Diminue la vitesse des tentacules lorsqu'il se calme(jusqu'à 0)
      vitesseTentacle-=0.1;
      if (vitesseTentacle<=0)
        vitesseTentacle=0; 
     
     //Assouplissement changement de vitesse retour normal
     bougeAssoupli = (1 - bougeAssoupli)*0.05 + bougeAssoupli;
     
  }

//Oscillation du monstre, augmente s'il est fâché
  oscY = floor(sin(counter)*bougeAssoupli*25-23);

  //Zone d'interactivité du corps et états
  distanceCorps = dist(mouseX, mouseY+oscY, x, y+oscY);

  if (distanceCorps < rayon + 35) {
    etatCorps = 1;
  } 
  else {
    etatCorps = 0;
  }


  //Tentacules
  for (int i = 0; i <= 6; i++) {
    pushMatrix();
    shapeMode(CENTER);
    translate(x-135+i*35, y+22+i*5+oscY); //commence à gauche du montre, puis i*facteur permet de déplacer chaque tentacule à la bonne place
    rotate(radians(angleTentacle[i])); //va chercher les angles du tableau angleTentacule déterminés dans le setup

    //Change les couleurs des tentacules selon état et mousePressed
    if (etatCorps == 0) {
      fill(92-colorTentacle[i]*2, 29, 85-colorTentacle[i]*0.5); //va chercher les nombres random déterminés dans le setup et les multiplie à des valeurs qui permettent d'avoir des teintes de mauve
    } 
    else if (etatCorps == 1 && mousePressed) {
      fill(255-colorTentacle[i]*10, 29, 60-colorTentacle[i]*0.5);
    } 
    else {
      fill(30-colorTentacle[i]*0.5, 29, 150-colorTentacle[i]*5);
    }

    //Fait bouger les tentacules si monstre fâché (augmente les manettes des courbes de bézier d'un facteur -1 à 1)
    if (etatCorps==1 && mousePressed) {
      //Temps pour commencer à faire capoter tentacules
      if (millis() - timeStampTentacle >= intervalleTentacle) {
        timeStampTentacle = timeStampTentacle + intervalleTentacle; 

//Si bougeTentacle entre -1 et 0, =0, si plus grand que 1, = 1. Pour contenir les tentacules et ne pas qu'elles prennent trop d'expansion dans la rage
        bougeTentacle+=countTentacle*vitesseTentacle;
        if (bougeTentacle>=1)
        {
          bougeTentacle=1;
          countTentacle=-0.1;
        }
        if (bougeTentacle<=0)
        {
          bougeTentacle=0;
          countTentacle=0.1;
        }
      }
      //Règle tentacules dans un sens et autres dans l'autre

      if ((i == 3) || (i >= 5)) {
        translate(+70, -12);
        rotate(radians(-15));
        makeTentacle(-1, bougeTentacle);
      }
      else {
        makeTentacle(1, bougeTentacle);
      }
    }  
    else { //Si pas fâché

        if (millis() - timeStampTentacle >= intervalleTentacle) {
       timeStampTentacle = timeStampTentacle + intervalleTentacle; 
       

       
       //Permet de ramener tentacules à 1 pour qu'elles soient dans leur état fixe normal
        bougeTentacle+=0.1;
      if (bougeTentacle>=1)
         bougeTentacle=1;
      }

//Change tentacules de sens
      if ((i == 3) || (i >= 5)) {
        translate(+70, -12);
        rotate(radians(-15));
        makeTentacle(-1, bougeTentacle);
      }
      else {
        makeTentacle(1, bougeTentacle);
      }
    }
    popMatrix();
  }

  // corps dégradé
  for (float i =0; i<=270; i+= 8) { //i augmente de 0.5 pour un dégradé précis et tracera donc 2*270 bulbes
    noStroke();
    
    //Change couleurs selon états (d'âme)
    if (etatCorps == 0) {
      fill(72+i*0.4, 29+i*0.103, 95+i*0.33);//multiplie le i de la couleur d'un facteur équivalent au changement de couleur souhaité pour RGB
    } 
    else if (etatCorps == 1 && mousePressed) {
      fill(255+i*0.4, 10+i*0.103, 10+i*0.33);
    }
    else {
      fill(45+i*0.4, 29+i*0.103, 150+i*0.33);
    }
    arc(x, y+oscY, (rayon*2+70)-i, (rayon*2)-(i*0.74), radians(150), radians(390), 2); //réduit la taille des bulbes p/r à i pour que les derniers x et y ne soient qu'un point
    triangle(x-120+i*.444444444, y+50-i*.185185185+oscY, x, y+oscY, x+120-i*.444444444, y+50-i*.185185185+oscY); //pour le site processing (T_T)
  }

  //bordure corps
  stroke(0);
  strokeWeight(4);
  noFill(); //ne tracera que la bordure
  arc(x, y+oscY, rayon*2+70, rayon*2, radians(150), radians(390), 2); //mêmes dimensions que dégradé (évidemment)
  line(x-116, y+50+oscY, x+116, y+50+oscY); //pour openprocessing.org (T_______T)

  //Gros yeux
  for (int i = 0; i < 2; i++) {
    pushMatrix();    
    makeEye(x-30+60*i, y-10+oscY, 30);
    popMatrix();
  } 

  //Petits yeux
  for (int i = 0; i < 2; i++) {
    makeEye(x-60+120*i, y-40+oscY, 20);
  } 

  //Gros sourcils
  for (int i = 0; i < 2; i++) {
    pushMatrix();
    stroke(2);

    //Change orientation sourcils selon normal (etat = 0), triste (etat =1, mouse over) et fâché (etat =1, mousePressed) + strokeWeight pour fâché
    if (etatCorps ==0) {
      makeSourcil( ((-1)+i*2)*28 + x, y-12+oscY, 50, 50, 240, 300);
    } 
    else if (etatCorps == 1 && mousePressed) {
      strokeWeight(3);
      makeSourcil( ((-1)+i*-2)*5+10 + x, y-50+oscY, 50, 50, 0+100*i, 70+100*i);
    } 
    else {
      makeSourcil( ((-1)+i*2)*55 + x, y-50+oscY, 50, 50, 20+90*i, 65+90*i);
    }
    popMatrix();
  }

  //Petits sourcils
  for (int i = 0; i < 2; i++) {
    pushMatrix();

    //Change les petits sourcils pour désespération si souris reste pressée plus que 2 secs dans fâché - MINUTERIE
    strokeWeight(fache);
    if (etatCorps == 1 && mousePressed) {
      if (millis() - timeStamp >= intervalle) {
        timeStamp = timeStamp + intervalle;
        fache = 4;
        fronce = 190;
      }
    } 
    else {
      timeStamp=millis();
      fache = 1;
      fronce=0;
    }
    makeSourcil( ((-1)+i*2)*60+ x-(fronce/10)+i*(fronce/5), y-45-(fronce/8)+oscY, 30, 30, 200+fronce+i*80, 260+fronce+i*80); 
    popMatrix();
  }

  //Moustaches
  for (int i = 0; i < 2; i++) {
    pushMatrix();
    translate(x+((-1)+i*2)*145, y-72+oscY);
    makeMustache(((-1)+i*2)*-1);
    popMatrix();
  }


  //Dents  
  for (int i = 0; i < 2; i++) {
    pushMatrix();
    translate(x-143+i*88, y-87+oscY);
    makeTooth();
    popMatrix();
  }



  //Rotation des ailes
  angleWing += vitesseWing*directionWing;

  if ( angleWing <= -5 || angleWing >= 10) {
    directionWing = -directionWing; //permet de faire une ascencion et une descente linéaire des angles, et donc que le mouvement soit continu
  } 

  //Ailes
  for (int i = 0; i < 2; i++) {
    pushMatrix();
    translate(x+-105+205*i, y-90+oscY); //translation de la matrice pour axe rotation
    //la translation de l'aile à la bonne place se fait dans la fonction
    rotate(radians((-1+i*2)*angleWing));
    makeWing(((-1)+i*2)*(-1));
    popMatrix();
  }

  //Faire tomber les oeufs
  boolean pasDoeuf = true;
  for (int i = 0; i < 2; i++) {
    if (mouseX > 5+300*i && mouseX < 100+300*i && mouseY > 10 && mouseY < 100) {
      fill(255);
      //tombeCounter est dans la fonction
      tombeCounter+= 10;
      pasDoeuf = false;
      fill(random(100,255));
      tombeOeuf(60+300*i, 50);
    } 
  }
    if (pasDoeuf) {
     tombeCounter =0;
   }

   
  popMatrix();
}


//fonction à appeler pour créer la forme de la moustache
void makeMustache(int a) { //le paramètre a décide du sens de la moustache (réflexion p/r à l'axe des y, donc x inversés)
  strokeWeight(5);
  fill(251, 176, 64);
  scale(0.48);
  beginShape();
  curveVertex(a*120.0, 274.0);
  curveVertex(a*163.0, 190.0);
  curveVertex(a*228.0, 182.0);
  curveVertex(a*239.0, 229.0);
  curveVertex(a*214.0, 233.0);
  curveVertex(a*140.0, 233.0);
  curveVertex(a*110.0, 173.0);
  curveVertex(a*159.0, 192.0);
  curveVertex(a*240.0, 116.0);
  endShape();
}

//fonction à appeler pour créer la forme de la dent
void makeTooth() {
  strokeWeight(3);
  fill(255);
  scale(0.6);
  beginShape();
  vertex(139, 228);
  vertex(162, 309);
  vertex(188, 228);
  curveVertex(188, 228);
  curveVertex(188, 228);
  curveVertex(163.5, 215);
  curveVertex(139, 228);
  curveVertex(139, 228);
  endShape(CLOSE);

  line(139, 228, 163, 309); //openprocessing gossage
}

// Définit couleurs par défaut des yeux si aucun paramètre n'est entré pour la couleur quand la fonction est appelée
//Permet donc tracer plusieurs yeux sans devoir réécrire blanc et noir
void makeEye(float a, float b, int radius) {
  makeEye(a, b, radius, 255, 0);
}

// Fonction à appeler pour dessiner un oeil
void makeEye(float a, float b, int radius, color foreground, color background) { //les variables de la fonction sont définis à même celle-ci

  //oeil noir
  fill(0);
  ellipse(a, b, radius, radius);

  //gros reflet blanc
  fill(0);
  strokeWeight(1);
  fill(255);
  //for (int i =0 ; i <2; i++) {
  /* if (mouseX > 5+300*i && mouseX < 100+300*i && mouseY > 0 && mouseY < 90) {
   ellipse(a+radius*0.1, b-radius*0.2, radius*0.4, radius*0.4);
   } else { */

  ellipse(a-radius*0.03, b-radius*0.2, radius*0.4, radius*0.4);
  // }
  // }

  //petit reflet blanc
  fill(0);
  strokeWeight(1);
  fill(255);
  ellipse(a+radius*0.166, b-radius*0.1, radius*0.2, radius*0.26);
}

void makeSourcil(float a, float b, int radius1, int radius2, int angle1, int angle2) {
  noFill();
  arc(a, b, radius1, radius2, radians(angle1), radians(angle2));
}

// Fonction à appeler pour dessiner une aile
void makeWing(int a) { //le paramètre a décide du sens de l'aile (réflexion p/r à l'axe des y, donc x inversés)
  strokeWeight(3);
  fill(255);
  beginShape();
  translate(a*-80, -80);
  // point(100,100);
  vertex(a*20, 12);
  bezierVertex(a*10, 30, a*15, 45, a*29, 51);
  bezierVertex(a*22, 77, a*64, 81, a*55, 72);
  bezierVertex(a*60, 110, a*95, 75, a*87, 72);
  endShape(CLOSE);
}

// Fonction à appeler pour dessiner une tentacule
void makeTentacle(float a, float b) {
  strokeWeight(3);
  //fill(72, 29,93);
  beginShape();
  vertex(a*49, 7);
  bezierVertex(a*0, 20, a*b*25, 40, a*b*22, 38);
  bezierVertex(a*45, 50, a*b*65, 20, a*b*67, 56);
  bezierVertex(a*30, 45, a*b*0, 65, a*b*16, 72);
  bezierVertex(a*58, 97, a*b*58, 92, a*b*58, 97);
  bezierVertex(a*54, 134, a*b*22, 122, a*b*38, 128);
  bezierVertex(a*52, 150, a*b*43, 149, a*b*52, 150);
  endShape();
}

//Trace oeuf
void makeOeuf() {
  pushMatrix();
  stroke(3);
  ellipse(-10, 10, 15, 20);
  popMatrix();
}

//Fonction pour la chute de l'oeuf
void tombeOeuf (float a, float b) {

  // tombeCounter+= 8;

  //Si l'oeuf dépasse l'écran, le counter repart à 0
  if (tombeCounter > height + 20) {
    tombeCounter = 0;
  }

  pushMatrix();
  translate(a, b+tombeCounter);
  makeOeuf();
  popMatrix();
}
