
 /* 
UQÀM - 2012

 MONSTRE
 par
 Ugo Magrini

EDM4600 - Algorithmie de base et intéractivité

Pour ouvrir ce projet et pouvoir utiliser les fonctions sonore, il est nécessaire d'avoir installé le 
plugin suivant: SoundCipher
disponible à l'adresse suivante: http://explodingart.com/soundcipher/
*/

// Declaration des variables /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  
  float xx, v, r, bouche;
  float XculG ;
  float Ycul ;
  float XculD ;
  float largecul ;
  float hauteurcul ;

  float pupilleXCourant ;
  float pupilleYCourant;
  float pupilleXXCourant;
  float pupilleYYCourant;
  
  float coin;
  float d;
  float difference;
  
  float BleuTexto;
  float BleuAppel;
  float BleuTexto2;
  float BleuAppel2;
  float CT;
  
  String[] banqueMot = {"FEMfontN", "sexy#69", "Cherry", "Ugo.M"};
  int numMot = 0;
  int j;
  int m;
  int a;
  int mi;
  int hr;
  float V;
  float Vi;
  float XmessageAppel;
  float YmessageAppel;
  float YmessageAppel1;
  float YmessageAppel2;
  float YmessageAppel3;
  
  float appellarg;
  float appelhaut;
  float textolarg;
  float textohaut;
  float bouchelarg;
  float bouchehaut;
  float Xtexto;
  float Ytexto;
  int distancetexto = 40;
  float msgrayon = 70;
  float Xappel;
  float Yappel;
  float Xbouche;
  float Ybouche;
  float stateappel ;
  float statering ;
  float statetexto ;
  float statebouche ;
  float timeout ;
  float timemsg ;
  int index;
  
  float XepauleG ;
  float YepauleG ;
  float XcoudeG ; 
  float YcoudeG ; 
  float XpoignetG ;
  float YpoignetG ;
  float XmainG ;
  float YmainG ; 
  float XepauleD ;
  float YepauleD ;
  float XcoudeD ; 
  float YcoudeD ; 
  float XpoignetD ;
  float YpoignetD ;
  float XmainD ;
  float YmainD ; 
  
  float XhancheG ;
  float YhancheG ;
  float XchevilleG ;
  float YchevilleG ;
  float XpiedG ;
  float YpiedG ;
  float XhancheD ;
  float YhancheD ;
  float XchevilleD ;
  float YchevilleD ;
  float XpiedD ;
  float YpiedD ;
  
  //pour la dance je me suis inspiré du patch "Pendule (oscillation)"
  float rads = 0.0;
  float rayonCoudeD ;
  float rayonCoudeG ;
  float rayonPoignetG ;
  float oscillationCoudeD;
  float oscillationCoudeG;
  float oscillationPoignetG;
  float rayonJ = 25 ;
  float rayonE = 1 ;
  float oscillation ;
  

  
  /*
 
  // pour l'importation audio avec SoundCipher, je me suis inspiré de l'exemple disponible sur ce site: http://explodingart.com/soundcipher/tutes/sound_effects/sound_effects_tute.html
  import arb.soundcipher.*;
  SoundCipher sc = new SoundCipher(this);    // "sc" = le nom du player
  AudioClip Music;                // "Music" = "bounce" (dans l'exemple du site)

  boolean tone1 = false;          // "tone1" = "hit"  (dans l'exemple du site)

  


  */


// Début du projet ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void setup()  {
  size(400,400);            //scène
  smooth();
  frameRate(30); 
  
  //Music = sc.loadAudioClip("Android monster.wav");


  xx = width/2;     //valeur 1
  v = width/8;      //valeur 2

 
  }
  

// Propriétés dessin //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void draw() {
 background(255,255,255);  //couleur de la scène


  

// Cell / Corp --------------------------------------------------------------------------------------------------------

  rectMode(CORNER);
  noStroke();               //pas de ligne
  coin = 15;
  XculG =xx-15;
  Ycul =220;
  XculD =xx+15;
  largecul =75;
  hauteurcul =40;
  fill(20,100,255);         //couleur du cell

  
  fill(20,100,255);
  rect(xx-v+V, 2*v+V, 2*v,xx, coin, coin, coin, coin );//forme rectangulaire du cell
 
  
  // antenne ----------------------------------------------------------------------****
  fill(20,100,255);
  rect(xx+20+V,v+30+V,20,30, coin, coin,0 ,0);   //rectangle de l'antenne
 

// Oeil droit ---------------------------------------------------------------------------------------------------------

  float x = xx+22;
  float y = xx-26;
  float w = v-8;
  float h = 30;
  float pupillew = 10;
  float pupilleh = 10;
  stroke(0,0,0);
  strokeWeight(2); 
  fill(255,255,255);
  arc(x+V,y+V,w,h, 0, PI); //demi-cercle qui cert à faire l'oeil
 
  
  // Cerne ------------------------------------------------------------------------****
  noFill();
  arc(xx+22+V,xx-26, 40,40, 0, PI);
  
  
  // Pupille droite ---------------------------------------------------------------****
  
  float radians = atan2(mouseY-y,mouseX-x);
  float distance = dist(mouseX,mouseY,x,y);
  float distancew ;
  float distanceh ;
  distancew = constrain(distance,0,w/2- pupillew/2);
  distanceh = constrain(distance,0,h/2- pupilleh/2);
  float pupillex = cos(radians)* distancew + x;
  float pupilley = sin(radians)* distanceh + y;
  pupilley = constrain(pupilley,y,height);
  // y= valeur des Y dans les adresse des ellipse
  
  
  // Lenteur du déplacement -------------------------------------------------------****
  pupilleXXCourant = ( pupillex - pupilleXXCourant) * 0.05 + pupilleXXCourant;
  pupilleYYCourant = ( pupilley - pupilleYYCourant) * 0.05 + pupilleYYCourant;
  fill(0);
  ellipse(pupilleXXCourant+V,pupilleYYCourant+V,pupillew-3*V,pupilleh-3*V);
  line(pupilleXXCourant-5,pupilleYYCourant, pupilleXXCourant+5,pupilleYYCourant);
  pupilleXXCourant = constrain( pupilleXXCourant, 207,235);
  pupilleYYCourant = constrain( pupilleYYCourant, 175, 250);


  // Arcade sourcillière droit ----------------------------------------------------****
  line(xx+02,y,xx+44, y);      // ligne noire
  stroke(20,100,255);          // bleu
  strokeWeight(9);              // grosse ligne bleu
  line(xx+02,y-6+V,xx+44, y-6+V);


  
// Oeil gauche --------------------------------------------------------------------------------------------------------
  
  float X = xx-22;
  stroke(0,0,0);
  strokeWeight(2); 
  fill(255,255,255);
  arc(X+V,y+V, w,h, 0, PI);
 
 
  // Cerne ------------------------------------------------------------------------****
  noFill();
  arc(xx-22+V,xx-26, 40,40, 0, PI);

  
  // Pupille gauche ---------------------------------------------------------------****
  float Radians = atan2(mouseY-y,mouseX-X);
  float Distance = dist(mouseX,mouseY,X,y);
  float distanceW = constrain(Distance,0,w/2- pupillew/2);
  float distanceH = constrain(Distance,0,h/2- pupilleh/2);
  
  
  // Limite de déplacement --------------------------------------------------------****
  float pupilleX = cos(Radians)* distanceW + X;
  float pupilleY = sin(Radians)* distanceH + y;
  pupilleY = constrain(pupilleY,y,height);
  // y = valeur des Y dans les adresse des ellipse
  
   
  // Lenteur du déplacement -------------------------------------------------------****
  pupilleXCourant = ( pupilleX - pupilleXCourant) * 0.05 + pupilleXCourant;
  pupilleYCourant = ( pupilleY - pupilleYCourant) * 0.05 + pupilleYCourant;
  fill(0);
  ellipse(pupilleXCourant+V,pupilleYCourant+V,pupillew-2*V,pupilleh-2*V);
  line(pupilleXCourant-5,pupilleYCourant, pupilleXCourant+5,pupilleYCourant);
  pupilleXCourant = constrain( pupilleXCourant, 165,200);
  pupilleYCourant = constrain( pupilleYCourant, 175, 250);


  // Arcade sourcillière gauche ---------------------------------------------------****
  line(xx-02,xx-26,xx-44, y);    // ligne noire
  stroke(20,100,255);            // bleu
  strokeWeight(9);               // grosse ligne bleu
  line(xx-02+V,xx-32+V,xx-44+V, y-6+V);
 
   
// Écran --------------------------------------------------------------------------------------------------------------

  d = v+8;
  difference = 1;
  noStroke();                     //couleur de la ligne
  while ( d > 10 ) {              // d est diametre
  fill ( 100,255,d / 55 * 255); // même formule que pour un pourcentage!
  rect(xx-v+8+V, 2*v+8+V,  d+26 , d, 5 ,5, 10, 5);
  d = d - difference;
  }
  
  
  // Contour de l'écran -----------------------------------------------------------****
  noFill();
  stroke(0);
  strokeWeight(3);
  rect(xx-v+6+V, 2*v+8+V, 2*v-14,v+8, coin-6, coin-6, coin-6, coin-6);
 
  
  // Reflets écran ----------------------------------------------------------------****
  noStroke();
  fill(255,255,255, 150);
  beginShape();
  vertex(4*v+5+V,3*v-40+V);
  vertex(4*v+20+V,3*v-40+V);
  vertex(4*v-10+V,3*v+14+V);
  vertex(4*v-25+V,3*v+14+V);
  endShape(CLOSE);
  fill(255,255,255,100);
  beginShape();
  vertex(4*v+25+V,3*v-40+V);
  vertex(4*v+35+V,3*v-40+V);
  vertex(4*v+5+V,3*v+14+V);
  vertex(4*v-5+V,3*v+14+V);
  endShape(CLOSE);


// Bouche -------------------------------------------------------------------------------------------------------------

  r = 160;               //valeur utilisé pour les dents de la bouche  
  fill(200,240,255); //pour ca je me suis inspiré des notes données en cours (http://wiki.t-o-f.info/Processing/Boucle)
  stroke(0,0,0);
  strokeWeight(2); 
  rect(xx-40 + V,xx+9 + V,80,82,CT,CT,CT,CT);
  while ( r < xx+20 ) { 
  line(r+20 + V,xx+10+V,r+20 + V,xx+90+V); 
  r = r + 25; 
  }
  
  
  // Intéractions bouche ----------------------------------------------------------**** 
  fill(0);
  rect(xx-40+V,xx+40,v+30, bouche/9);

 
  // Nez --------------------------------------------------------------------------****
   strokeWeight(3);
   point(xx+6+V,xx+2);
   point( xx-6+V,xx+2);
   

// Bras + Mains -------------------------------------------------------------------------------------------------------
  
  strokeWeight(12);
  stroke(20,100,255);
  XepauleG = xx-v+V;
  YepauleG = 4*v+20+V;
  XcoudeG = xx-70+V;
  YcoudeG = 5*v+V;
  XpoignetG = xx-65+V;
  YpoignetG = 6*v-20+V; 
  XmainG =xx-70+V;
  YmainG = 6*v-10+V;
  XepauleD = xx+v+V;
  YepauleD = 4*v+20+V;
  XcoudeD = xx+70+V;
  YcoudeD = 5*v+V; 
  XpoignetD = xx+65+V;
  YpoignetD = 6*v-20+V;
  XmainD = xx+70+V;
  YmainD = 6*v-10+V;
  
  rads += 0.29;   // incrémentation / vitesse de l'oscillation
  rayonCoudeD = 4; // rayon d'oscillation des coudes
  oscillationCoudeD = cos(rads) * (PI/4) + (-PI/5); // calculer l'oscillation (toujours entre -1 et 1)
  rayonCoudeG = 30;
  oscillationCoudeG = cos(rads) * (-PI/3) + (-PI);
  rayonPoignetG = 60;
  oscillationPoignetG = cos(rads) * (PI/4) + (-PI/5);
 
  
  // Bras gauche ------------------------------------------------------------------****
  if ( stateappel == 1 ) {                                         
  XpoignetG = sin(oscillationPoignetG) * rayonPoignetG + xx-45+V ;
  YpoignetG = sin(oscillationPoignetG) * rayonPoignetG + 6*v-60+V ; 
  XmainG = sin(oscillationPoignetG) * rayonPoignetG + xx-50+V ;
  YmainG = sin(oscillationPoignetG) * rayonPoignetG + 6*v-70+V ; 
  XcoudeG = sin(oscillationCoudeG) * rayonCoudeG + xx-70+V ;
  YcoudeG = sin(oscillationCoudeG) * rayonCoudeG + 5*v+V ; 
  }
  
  line(XepauleG, YepauleG, XcoudeG, YcoudeG);   
  line(XcoudeG, YcoudeG, XpoignetG, YpoignetG);
  line(XpoignetG, YpoignetG, XmainG, YmainG);
  
  
  // Bras droit -------------------------------------------------------------------****
  if ( stateappel == 1 ) {
  XcoudeD = cos(oscillationCoudeD) * rayonCoudeD +xx+70+V ;
  YcoudeD = sin(oscillationCoudeD) * rayonCoudeD + 5*v+V ;
  XpoignetD = xx+50;
  YpoignetD = 6*v-30+V;
  XmainD = xx+55;
  YmainD = 6*v-20+V;
  }
  line(XepauleD, YepauleD, XcoudeD, YcoudeD);    
  line(XcoudeD, YcoudeD, XpoignetD, YpoignetD);
  line(XpoignetD, YpoignetD, XmainD, YmainD);
  

// Jambes + Pieds------------------------------------------------------------------------------------------------------

  XhancheG = xx-20+V;
  YhancheG = 2*v+xx+V;
  XchevilleG = xx-10;
  YchevilleG = 3*v+xx;
  XpiedG = xx-30;
  YpiedG = 3*v+xx;
  XhancheD = xx+20+V;
  YhancheD = 2*v+xx+V;
  XchevilleD = xx+10;
  YchevilleD = 3*v+xx;
  XpiedD = xx+30;
  YpiedD =  3*v+xx;
  rayonJ = 5; // rayon d'oscillation des jambes
  oscillation = cos(rads) * (0.5*-PI) + (-PI/2); 
  
  // Jambe gauche -----------------------------------------------------------------****
 
  if ( stateappel == 1 ) {
  XchevilleG = cos(oscillation) * rayonJ + xx - 10 ;
  YchevilleG = sin(oscillation) * rayonJ + 3*v + xx ;
  }
  //jambe
  line(XhancheG, YhancheG,XchevilleG,YchevilleG);
  //pied
  line (XchevilleG, YchevilleG, XpiedG,YpiedG);


  //Jambe droite ------------------------------------------------------------------****

  if ( stateappel == 1 ) {
  XchevilleD = cos(oscillation) * rayonJ + xx+10 ;
  YchevilleD = sin(oscillation) * rayonJ + 3*v+xx ;
  }
  //jambe
  line(XhancheD,YhancheD,XchevilleD,YchevilleD);
  //pied
  line(XchevilleD, YchevilleD, XpiedD,YpiedD);


// Boutons d'intéractivité --------------------------------------------------------------------------------------------
  
  Vi = random(0, 2);
  BleuTexto = 255;
  BleuTexto2 = 155;
  BleuAppel = 255;
  BleuAppel2 = 155;
  Xtexto = 73;
  Ytexto = 100;
  Xappel = 25;
  Yappel = 37;
  Xbouche = 255;
  Ybouche = 372;
  CT = 8;             //coin de boutton texte
  appellarg = 100;
  appelhaut = 25;
  textolarg = 100;
  textohaut= 25 ;
  bouchelarg =130;
  bouchehaut = 25;
  rectMode(CORNER);
  
  //                                                                  ******************************
  // Appel ---------------------------------------------------------- **********//////////**********
  //                                                                  ******************************
  stroke(150);
  strokeWeight(2);
  
    if ( stateappel == 1 && millis()>timeout+90000 ) {  //longueur de l'échantillon
    stateappel = 0;
    }
    
    if ( stateappel == 1 ) {
    fill(8,82,BleuAppel);
    

    
    } else {
    fill(8,82,BleuAppel2);
// tone1 = false;             // remet le boolean en position initiale
// sc.stop();                 // arrête le player  
  }
  rect(Xappel,Yappel,appellarg,appelhaut,CT,CT,CT,CT);
  fill(255);
  PFont font;
  font = loadFont("HelveticaCY-Bold-20.vlw");
  textFont(font);
  text("APPEL", 47,57);
  
      if ( stateappel == 1 ) {
    XmessageAppel= cos(oscillation) * rayonE +xx-v+26;
    YmessageAppel= sin(oscillation) * rayonJ + 2*v+27;
    YmessageAppel1= sin(oscillation) * rayonJ + 2*v+37;
    YmessageAppel2= sin(oscillation) * rayonJ + 2*v+50;
    YmessageAppel3= sin(oscillation) * rayonJ + 2*v+58;
    font = loadFont("DFKaiShu-SB-Estd-BF-13.vlw");
    textFont(font);
    fill(255,0,0);
    text("Appel de", XmessageAppel-17, YmessageAppel);
    text("UGO M.", XmessageAppel+3, YmessageAppel1);
    fill(0);
    text("w.soundcloud", XmessageAppel-14, YmessageAppel2);
    text(".com/ugomega", XmessageAppel-13, YmessageAppel3);
    }
  
  
  //                                                                  ******************************
  // TEXTO ---------------------------------------------------------- **********//////////**********
  //                                                                  ******************************
  j = day();
  m = month();
  a = year();
  mi = minute(); 
  hr = hour();    
 
  stroke(150);
  strokeWeight(2);
  font = loadFont("HelveticaCY-Bold-20.vlw");
  textFont(font);
  
    if ( statetexto == 1 && millis()>timeout+2400) {
    statetexto = 0;
    }
  
    if ( statetexto == 1 ) {
    fill(8,82,BleuTexto);
    V= 0 + Vi;
    xx = width/2+R;
     
    } else {
    fill(8,82,BleuTexto2);
    V=0;
    }
      ellipse( Xtexto , Ytexto , msgrayon  , msgrayon );

  
  fill(255);
  text("TEXTO", 47,107);
  fill(100);
  String J = String.valueOf(j);
  String M = String.valueOf(m);
  String Y = String.valueOf(a);
  String MI = String.valueOf(mi);
  String HR = String.valueOf(hr);
  
    if ( statetexto == 1 ) {
    font = loadFont("Monospaced-10.vlw");
    textFont(font); 
    text("from", xx-v+11, 2*v+40); 
    font = loadFont("Monospaced-10.vlw");
    textFont(font); 
    text(J, xx-v+40, 2*v+60);
    text(M, xx-v+54, 2*v+60);
    text(Y, xx-v+64, 2*v+60);
    fill(200,0,0);
    text(HR, xx-v+40, 2*v+50);
    text(MI, xx-v+55, 2*v+50);
    fill(0);
    text(banqueMot[numMot], xx-v+40, 2*v+40);
    fill(0);
    font = loadFont("DFKaiShu-SB-Estd-BF-14.vlw");
    textFont(font);
    text("new message", xx-v+11, 2*v+27);
    text(" : ", xx-v+47, 2*v+50);
    }   
     
     
  //                                                                  ******************************
  // Bouche Marionette----------------------------------------------- **********//////////**********
  //                                                                  ******************************
   stroke(150);
   strokeWeight(2);
  
    if ( statebouche == 1 ) {
    fill(8,82,BleuAppel);
    bouche = mouseY;       //valeur y de la souris pour intéraction

    } else {
    bouche = 9+V;
    fill(8,82,BleuAppel2);
    }
  
  rect(Xbouche,Ybouche,bouchelarg,bouchehaut,CT,CT,CT,CT);
  fill(255);
  font = loadFont("HelveticaCY-Plain-15.vlw");
  textFont(font);
  text("Bouche Marionette", 270 ,390); 
 
 }
  

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void mousePressed() {
    
    if ( mouseX>Xappel && mouseX<Xappel+appellarg && mouseY>Yappel && mouseY<Yappel+appelhaut ) {
    if (stateappel == 0) {
      stateappel = 1;
   // sc.playAudioClip(Music);
    //tone1 = true;
     //if (!tone1) sc.playAudioClip(Music); 
      timeout = millis();
    } else {
      stateappel = 0;
    }
    }
  
     float distancetexto = dist( mouseX , mouseY , Xtexto , Ytexto );
     if ( distancetexto < msgrayon/2 ) {
       if (statetexto == 0) {
     statetexto = 1;
     
     timeout = millis();
 } else {
   statetexto = 0;
 }
 }
  
    if ( mouseX>Xbouche && mouseX<Xbouche+bouchelarg && mouseY>Ybouche && mouseY<Ybouche+bouchehaut ) {
      if (statebouche == 0) {
      statebouche = 1;
      
      } else {
      statebouche = 0 ;
      }
    }
  
  {
  numMot=(int)random(0,4);
  }
    

     }


