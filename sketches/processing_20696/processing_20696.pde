
/*
TP # 1 - EDM4600 - Algorithmie de base et interactivite
 Laurent Sioui
 11 fevrier 2011
 */

// variables yeux 
int ellipseX = 185;
int ellipseY = 121;
int ellipseX2 = 235;
int ellipseY2 = 116;
int rayonE1 = 9;
int rayonE2 = 11;

// variables billes tournantes
float vitesse = 0.18;
float acceleration,angle,angle2,x,y,x2,y2 = 0;
float rayon = 10;
float rayon2 = 15;
 
 void setup() {
  
size(400,400);
ellipseMode(RADIUS);

  
  
}

void draw() {
  
  //fond pour tracés et opacité
  fill(0,10);
  rect(0,0,width,height);
  
  fill(108,45,45);
  
  //visage
  ellipse(200,150,73,107);
  strokeWeight(2);
  
   //nez
  beginShape(); 
  curveVertex(177,132);
  curveVertex(210,128);
  curveVertex(225,145);
  curveVertex(215,180);
  curveVertex(195,155);
  curveVertex(204,149);
  curveVertex(211,154);
  curveVertex(211,160);
  endShape();
 
   //bouche
  fill(59,33,8);
  beginShape();
  curveVertex(225,225);
  curveVertex(200,250);
  curveVertex(160,230);
  curveVertex(140,175);
  curveVertex(165,150);
  curveVertex(185,202);
  curveVertex(230,227);
  curveVertex(200,250);
  curveVertex(120,200);
  endShape();
  
  noFill();
  beginShape();
  curveVertex(154,152);
  curveVertex(154,152);
  curveVertex(160,197);
  curveVertex(189,231);
  curveVertex(228,234);
  curveVertex(228,234);
  endShape();
  
   //cheveux
  noFill();
  stroke(255);
  strokeWeight(7);
  beginShape();
  curveVertex(197,60);
  curveVertex(197,60);
  curveVertex(170,47);
  curveVertex(118,117);
  curveVertex(148,295);
  curveVertex(118,355);
  curveVertex(69,337);
  curveVertex(69,337);
  endShape();
  beginShape();
  curveVertex(203,60);
  curveVertex(203,60);
  curveVertex(239,39);
  curveVertex(288,169);
  curveVertex(252,307);
  curveVertex(259,365);
  curveVertex(310,358);
  curveVertex(310,358);
  endShape();
  
  //sourcils
  stroke(0);
  strokeWeight(2);
  beginShape(); 
  curveVertex(198,102);
  curveVertex(198,102);
  curveVertex(199,119);
  curveVertex(190,112);
  curveVertex(169,110);
  curveVertex(169,110);
  endShape();
  
  beginShape(); 
  curveVertex(213,96);
  curveVertex(213,96);
  curveVertex(215,109);
  curveVertex(235,98);
  curveVertex(254,102);
  curveVertex(254,102);
  endShape();
  
  //pli de bouche
  beginShape(); 
  curveVertex(148,144);
  curveVertex(148,144);
  curveVertex(164,137);
  curveVertex(178,147);
  curveVertex(181,158);
  curveVertex(181,158);
  endShape();
  
  //plis de front
  beginShape(); 
  curveVertex(163,85);
  curveVertex(163,85);
  curveVertex(173,90);
  curveVertex(190,90);
  curveVertex(203,82);
  curveVertex(216,90);
  curveVertex(233,90);
  curveVertex(243,85);
  curveVertex(243,85);
  endShape();
   beginShape(); 
  curveVertex(168,75);
  curveVertex(168,75);
  curveVertex(178,80);
  curveVertex(192,80);
  curveVertex(205,72);
  curveVertex(221,80);
  curveVertex(233,80);
  curveVertex(238,75);
  curveVertex(238,75);
  endShape();
  
   //yeux droit et gauche respectivement
  fill(188);
  ellipse(185,121,9,9);
  ellipse(235,116,12,16);
  
  // detecter le mouseOver sur oeil droit
  float distance = dist( mouseX , mouseY , ellipseX , ellipseY );
  if ( distance < rayonE1 ) {
     
    // mouseOver declenche apparition bille jaune qui tourne
    fill(255,250,50);
    vitesse = vitesse + acceleration;
    angle = angle + vitesse;
    x = cos(angle) * rayon + ellipseX;
    y = sin(angle) * rayon + ellipseY;
    ellipse(x,y,4,4); // bille jaune
   
      // enfoncer le clic permet de déplacer et éloigner la bille jaune
      if ( mousePressed ) {
        
        // la bille jaune s'éloigne
        rayon = min((rayon + 0.9),900); 
        } else {
        // la bille jaune se rapproche  
        rayon = max((rayon - 0.9),90);
    }
   
  } else {
    // la pupille s'affiche si le curseur n'est pas dans l'oeil
      fill(191,31,31);
      strokeWeight(1);
      ellipse(185,121,6,6);
  }
  
  // detecter le mouseOver sur oeil gauche
  float distance2 = dist( mouseX , mouseY , ellipseX2 , ellipseY2 );
  if ( distance2 < rayonE2 ) {
     
    // mouseOver declenche appartition bille bleue qui tourne
    fill(62,107,219);
    vitesse = vitesse + acceleration;
    angle2 = angle2 + vitesse;
    x2 = cos(angle2) * rayon2 + ellipseX2;
    y2 = sin(angle2) * rayon2 + ellipseY2;
    ellipse(x2,y2,8,8); // bille bleue
   
      // enfoncer le clic permet de déplacer et éloigner la bille bleue
      if ( mousePressed ) {
        // la bille bleue s'éloigne
        rayon2 = min((rayon2 + 0.8),800);
        } else {
        // la bille bleue se rapproche
        rayon2 = max((rayon2 - 1),100);
    }
   
  } else {
    //la pupille s'affiche si le curseur n'est pas dans l'oeil
      fill(191,31,31);
      strokeWeight(1);
      ellipse(235,116,2,2);
  }
   
   // en maintenant le clic gauche de la souris, la langue apparait
   if (mousePressed) {
      if ( mouseButton == LEFT ) {
  //Langue
  fill(224,23,70);
  beginShape();
  curveVertex(200,233);
  curveVertex(200,233);
  curveVertex(194,272);
  curveVertex(174,295);
  curveVertex(158,271);
  curveVertex(176,243);
  curveVertex(177,218);
  curveVertex(177,218);
  endShape();
  stroke(0);
  noFill();
  beginShape();
  curveVertex(174,269);
  curveVertex(174,269);
  curveVertex(185,255);
  curveVertex(190,233);
  curveVertex(190,233);
  endShape();
  
      }
    }
   
}

// permet simplement de determiner les coordonnees en cliquant
void mousePressed() {
        println("Clique: x "+mouseX+" y "+mouseY);
  
}


