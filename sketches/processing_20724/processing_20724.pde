
 /*---------------------------------------------
  *    Evelyne Dufresne 
  *    EDM4600-50  TP1 Monstre Interactif
  *    2010/02/11
 ----------------------------------------------*/
 //Déclaration des variables globales
   //Matrices d'images
   PImage tumbleweedIMG;
   PImage cactusDroitIMG;
   PImage cactusGaucheIMG;
   PImage nuage01IMG;
   PImage nuage02IMG;
   PImage nuage03IMG;
   PImage nuage04IMG;
    
   //Position du "tumbleweed" en x et y 
   float tumbleweedX =random(50);
   float tumbleweedY = random(50);
      
    //Positions nuages
     float posX1now = -100;
     float posX2now = 298;
     float posX3now = 249;
     float posX4now = 57;
     int posY1=100;
     int posY2=36;
     int posY3=214;
     int posY4=28;
   


  void setup() 
  {
    size(400,400) ;
    smooth();
    frameRate(20);
    
    
    //"Loader" les images utilisées
    tumbleweedIMG = loadImage("tumbleweed.png");
    cactusDroitIMG = loadImage("cactus_droit.png");
    cactusGaucheIMG = loadImage("cactus_gauche.png");
    nuage01IMG = loadImage("nuage01.png");
    nuage02IMG = loadImage("nuage02.png");
    nuage03IMG = loadImage("nuage03.png");
    nuage04IMG = loadImage("nuage04.png");
    
  }

/*----------------------------------------------
                DESSINER LE MONSTRE
-----------------------------------------------*/
 void draw() 
 {
//DESSINER ARRIÈRE-PLAN

//COULEUR DE L'ARRIÈRE-PLAN
 background(95,117,151);
 
 //DESSINER NUAGES
 //Afficher Nuage
  drawNuage();
    
 //SOL
 fill(178,166,144);
 rectMode(CORNERS);
 rect(0,285,400,400);
 
 stroke(204,196,182);
 strokeWeight(3);
 line(0,285,400,285);

//TEXTURE DE SABLES(points)
 point(388,334);
 point(378,326);
 point(287,355); 
 point(312,357);
 point(174,368);
 point(28,315);
 point(36,315); 
 point(32,327);
 point(313,309);
 
 stroke(144,134,114);
 point(52,332);
 point(72,373);
 point(199,351);
 point(297,367);
 
 // DESSINER CACTUS
 imageMode(CENTER);
 image(cactusDroitIMG,343,245);
 image(cactusGaucheIMG,50,241);
//-----------------------------------------------------------------
//DESSINER MONSTRE

    //couleur de base du corps
      stroke(209,241,255);
      strokeWeight(5);
      fill(139,205,236);  
    // JAMBES
      //Droite
      beginShape();
        curveVertex(200,-3);
        curveVertex(208,276);
        curveVertex(256,259);
        curveVertex(200,-5);
      endShape(CLOSE);
      //Gauche
      beginShape();
        curveVertex(200,-3);
        curveVertex(142,258);
        curveVertex(189,274);
        curveVertex(200,-3);
      endShape(CLOSE);
      
     //BRAS GAUCHE
       beginShape();
        curveVertex(200,-3);
        curveVertex(100,194);
        curveVertex(116,229);
        curveVertex(200,-3);
       endShape(CLOSE);
      //Griffes G 
      noStroke();
      fill(255);
      triangle(93,233,92,243,96,240);//griffe01
      triangle(98,243,100,252,103,244);//griffe02
      triangle(106,244,109,249,112,242);//griffe03
        
    // BASE CORPS (Cercle)
      stroke(209,241,255);
      strokeWeight(5);
      fill(139,205,236);
      ellipse (200, 175, 200, 200);
      
    // BRAS DROIT
       beginShape();
        curveVertex(700,-200);
        curveVertex(235,212);
        curveVertex(283,203);
        curveVertex(100,50);
       endShape();
      //Griffes D
      noStroke();
      fill(255);
      triangle(214,237,207,241,215,241);//griffe01
      triangle(215,243,212,249,219,246);//griffe02
      triangle(222,246,220,254,227,249);//griffe03
       
    // DESSINER YEUX
    stroke(223,226,227);
    strokeWeight(2);
    fill(255,255,255);
     //Gauche
     ellipse(142, 140, 55, 54);
     //Droite
     ellipse(215, 140, 70, 64);
     //Pupilles
     stroke(210);
     fill(207,212,213);
     ellipse(139, 138, 45, 40);//G
     ellipse(211, 138, 55, 50);//D
     //Reflets Pupilles
     noStroke();
     fill(255);
     triangle(144,141,151,158,162,147);
     triangle(219,143,227,163,237,152);
     ellipse(144,128,10,10);
     ellipse(221,129,10,10);
      
    //DESSINER DENTS
    stroke(207,212,213);
    strokeWeight(1);
    arc(150, 191, 20, 20, 0, PI);
    arc(171, 191, 20, 20, 0.1, PI);
    arc(191, 192, 20, 20, 0.25, PI);
      
    //DESSINER BOUCHE
    noFill();
    stroke(209,241,255);
    strokeWeight(2);
    curve(124, 205, 126, 191, 221, 205, 223, 310);
    curve(124, 205, 126, 191, 132, 183, 140, 200);
   
    //DESSINER MENTON
    stroke(209,241,255);
    noFill();
    curve(155, 225, 159, 208, 187, 208, 180, 205);
    
    // "POKER" LE MONSTRE
    dessinerPoke(mouseX, mouseY); 
    
    // DESSINER TACHES
     stroke(228,255,229);
     strokeWeight(1);
       
     fill(234,221,248);
     ellipse(241,102,5,5);
     ellipse(287,163,5,5);
     ellipse(255,104,2,2);
       
     fill(190,228,191);
     ellipse(255,114,7,7);
     ellipse(276,124,3,3);
     ellipse(287,146,2,2);
     ellipse(277,136,1,1);
   
  // DESSINR MOHAWK
     dessinerMohawk();
      
  //DESSINER BOTTES DE COWBOY  
    //Gauche (G)
     dessinerBotte();
    
    //Droite (D)
     //translation de la botte créée
      pushMatrix();
      translate(65, 7);
      dessinerBotte();    
      popMatrix();
      
   //Dessiner Tumbleweed
  drawTumbleweed();
        

  }
  
/*----------------------------------------------
      OBTENIR LES COORDONÉES DE LA SOURIS
-----------------------------------------------*/
  void mousePressed()
  {
    //Imprimer les coordonnées en x et en y lorsque la souris est pressée
    println("clique x:" + mouseX + " y:" + mouseY);

  }
  
 /*----------------------------------------------
      DESSINER BOTTE
     ----------------------------------------*/
    
    void dessinerBotte()
   {
       
    //DESSINER BASE BOTTE
     stroke(220,255,220);
     strokeWeight(2.5);
     fill(139,194,139);
     beginShape();
      curveVertex(450,200);
      curveVertex(192,282);
      curveVertex(136,267);
      curveVertex(200,300);
        vertex(136,267);
      curveVertex(450,200);
      curveVertex(192,282);
      curveVertex(139,294);
      curveVertex(200,300);
        vertex(139,294);
      curveVertex(160,250);
      curveVertex(139,294);
      curveVertex(128,305);
      curveVertex(160,300);
      vertex(128,305);
      curveVertex(250,250);
      curveVertex(128,305);
      curveVertex(172,313);
      curveVertex(160,250);
        vertex(172,316);
        vertex(172,316);
        vertex(185,314);
      curveVertex(170,400);
      curveVertex(185,314);
      curveVertex(192,282);
      curveVertex(160,365);
    endShape();  
    
  //DESSINER ÉPERONS 
    stroke(128);
    //Sangles
    curve(200,350,139,294,173,310,200,350);
    line(173,310,187,306);
    //étoiles 
   fill(128);
    beginShape();
    vertex(190,299);
    vertex(193,298);
    vertex(193,302);
    vertex(196,302);
    vertex(194,305);
    vertex(197,308);
    vertex(193,310);
    vertex(194,314);
    vertex(190,313);
    vertex(187,314);
    endShape(CLOSE);
    
    fill(200);
    noStroke();
    ellipse(190,307,7,7);
    

    }
/*--------------------------------------------
                DESSINER MOHAWK
----------------------------------------------*/
void dessinerMohawk()
{
  stroke(255, 252, 210);
    fill(215,210,254);

    //FACE DESSUS
    strokeWeight(2.5);
    stroke(226,224,245);
    fill(162,158,197);
  
    beginShape();
      curveVertex(400,550); 
      curveVertex(302,105);
      curveVertex(152,40);
      curveVertex(250,150);
    endShape(CLOSE);
  
    //CÔTÉ DROIT
    strokeWeight(3.5);
    stroke(219,216,242);
    fill(178,173,216);
  
    beginShape();
      curveVertex(300,230);
      curveVertex(191,92);
      curveVertex(303,183);
      curveVertex(200,800);
        vertex(303,183);
      curveVertex(345,100);
      curveVertex(303,183);
      curveVertex(315,140);
      curveVertex(270,145);
        vertex(315,140);
      curveVertex(300,600);
      curveVertex(315,140);
      curveVertex(193,52);
      curveVertex(350,250);
        vertex(193,52);
      curveVertex(400,100);
      curveVertex(193,52);
      curveVertex(191,92);
      curveVertex(300,100);
    endShape();

     //FACE AVANT
     strokeWeight(3.5);
     stroke(215,210,254);
     fill(126,121,165);
   
     beginShape();
      curveVertex(450,200);
      curveVertex(163,90);
      curveVertex(159,51);
      curveVertex(200,300);
        vertex(159,51);
      curveVertex(200,50);
      curveVertex(159,51);
      curveVertex(193,52);
      curveVertex(400,200);
        vertex(193,52);
      curveVertex(200,50);
      curveVertex(193,52);
      curveVertex(188,88);
      curveVertex(300,200);
        vertex(188,92);
      curveVertex(192,120);
      curveVertex(188,95);
      curveVertex(163,87);
      curveVertex(190,150);
    endShape();
    
    //DÉTAILS MOHAWK
      strokeWeight(1.5);
      stroke(219,216,242);
      
      noFill();
      
      curve(250,150,205,84,224,50,250,100);
      curve(320,100,224,47,197,36,300,60);
      strokeWeight(2.5);
      curve(260,80,248,57,233,43,250,70);
      curve(265,100,238,86,255,56,280,75);
      strokeWeight(2.5);
      curve(280,110,267,99,282,82,300,90);
      strokeWeight(1);
      curve(300,120,276,107,284,97,300,110);
      curve(320,120,304,108,296,113,300,120);
      curve(210,60,199,46,183,40,200,70);
      
      triangle(219,85,222,78,224,85);
      triangle(258,62,257,71,262,66);
      triangle(297,142,306,139,300,150);
}
    
/*--------------------------------------------
                DESSINER POKE
 ---------------------------------------------*/
 void dessinerPoke(int x, int y)
  {
    //Détecte si la souris se situe sur le corps du monstre 
    float distance = dist( mouseX , mouseY , width/2 , 175 );       if(distance<95) 
     if(mousePressed && distance < 95)
     {

       
     //DESSINER PAUPIÈRES
         //Droite
         fill(139,205,236);
         noStroke();
         beginShape();
           curveVertex(200,80);
           curveVertex(178,125);
           curveVertex(252,120);
           curveVertex(300,80);
         endShape(CLOSE);
         quad(178,126,252,121,255,105,175,104);//cache le haut de l'oeil
         
         stroke(209,241,255);
         curve(200,80,178,125,249,122,300,80);
         
         //Gauche
         noStroke();
         beginShape();
           curveVertex(200,90);
           curveVertex(172,127);
           curveVertex(122,120);
           curveVertex(190,90);
         endShape(CLOSE);
         quad(122,122,170,127,170,113,133,109);//cache le haut de l'oeil
         
         stroke(209,241,255);
         curve(200,90,170,127,120,120,190,90);
         
    //DESSINER BOUCHE OUVERTE
      noStroke(); 
      quad(123,172,128,223,209,221,240,182); //cache la bouche déjà dessinée
     //Bouche partie inférieure
      fill(48,101,126);
      stroke(209,241,255);
      strokeWeight(2);
      beginShape();
      curveVertex(150,250);
      curveVertex(133,192);
      curveVertex(139,209);
      curveVertex(150,270);
      vertex(139,209);
      curveVertex(200,240);
      curveVertex(139,209);
      curveVertex(221,206);
      curveVertex(300,230);
      vertex(221,206);
      curveVertex(223, 310);
      curveVertex(221,206);
      curveVertex(126,191);
      curveVertex(124, 205);
      endShape(CLOSE);
      //dents
      fill(255);
      stroke(207,212,213);
      strokeWeight(1);
      arc(150, 191, 20, 20, 0, PI);
      arc(171, 191, 20, 20, 0.1, PI);
      arc(191, 192, 20, 20, 0.25, PI);
      //Bouche partie supérieure
     noFill();
      stroke(209,241,255);
      strokeWeight(2);
      curve(223, 310, 221,205, 126,191, 124, 205);
      curve(124, 205, 126, 191, 132, 183, 140, 200);
      //Menton
      stroke(209,241,255);
      noFill();
      curve(280,130,190,218,162,220,210,220);
      //Cernes
      stroke(165,222,249);
      curve(140,160,111,153,128,169,180,160);
      curve(140,160,120,170,135,174,180,160);
      
      curve(150,140,225,177,253,156,190,190);
      curve(150,130,218,179,237,181,240,190);
   
       //DESSINER LE RENFONCEMENT DU "POKE"
       int courbeLvl = 20;
       noFill();
       stroke(117,178,206);
       strokeWeight(1.5);
       curve(x+courbeLvl,y+courbeLvl,x-8,y-3,x,y,x+courbeLvl,y+courbeLvl);
       curve(x+courbeLvl,y+courbeLvl,x+2,y-8,x,y,x+courbeLvl,y+courbeLvl);
       curve(x+courbeLvl,y+courbeLvl,x-3,y+8,x,y,x+courbeLvl,y+courbeLvl);
           
         fill(39,83,103,15);
         noStroke();
         ellipse(x,y,15,15);
         ellipse(x,y,12,12);
         ellipse(x,y,10,10);
         ellipse(x,y,8,8);
         ellipse(x,y,6,6);
   
   //DESSINER BULLE DE TEXTE
     fill(255);
     noStroke();
     ellipse(68,56,120,70); 
    
     beginShape();
     curveVertex(80,70);
     curveVertex(39,86);
     curveVertex(94,117);
     curveVertex(200,120);
      vertex(94,117);
     curveVertex(100,100);
     curveVertex(94,117);
     curveVertex(68,91);
     curveVertex(100,70);
     endShape(CLOSE);
        
   //TEXTE
   // Déclaration de la variable texte
   PFont texte;
   // Assignation de la variable texte à la police créée
   texte = loadFont("DenneMilkTea-26.vlw");
   //Déclaration d'un tableau contenant tous les messages à être afficher
   String[] message = {"AOUCH","AYOYE","GRRRrrr","TU OSES?!","FUUUU","ARRETE!","J'T'HAIS!","@&*#%?!", "WTF" };

    //Chois de la police et de ses caractéristiques
    textFont(texte);
    fill(100);
    noStroke();
    
    //AFFICHAGE DU TEXTE SELON LA POSITION DU CURSEUR
    if(x>100 && x<164 && y>75 && y<147) text(message[0],30,65);
    else if (x>=164 && x<225 && y>75 && y<147) text(message[1],30,65);
    else if (x>=225 && x<300 && y>75 && y<147) text(message[2],30,65);
    
    else if (x>100 && x<164 && y>=147 && y<219) text(message[3],25,65);
    else if (x>=164 && x<225 && y>=147 && y<219) text(message[4],30,65);
    else if (x>=225 && x<300 && y>=147 && y<219) text(message[5],30,65);
    
    else if (x>100 && x<164 && y>=219 && y<275) text(message[6],30,65);
    else if (x>=164 && x<225 && y>=219 && y<275) text(message[7],11,65);
    else if (x>=225 && x<300 && y>=219 && y<275) text(message[8],45,65);
 
     }     
  }
  
  
 /*--------------------------------------------------
              DESSINER TUMBLEWEED
 ----------------------------------------------------*/
 
 void drawTumbleweed()
 {
   
 //POSITION INITIALE   
   int positionImgX=15;
   int positionImgY=300;
   
// Déplacement proportionnel/code inspiré des exemples proposés pas le professeur
   float ratio = 0.15; 
   tumbleweedX = (mouseX - tumbleweedX)*ratio + tumbleweedX; 
   tumbleweedY = (mouseY - tumbleweedY)*ratio +tumbleweedY;
   imageMode(CENTER);
// Si la souris sort de la zone du sol, le "tumbleweed" ne suivra pas la souris en y.
   tumbleweedY = max(tumbleweedY,320);
   if(tumbleweedY<320)
   {
    tumbleweedX = mouseX;
   }
    
 //AFFICHER TUMBLEWEED
   image(tumbleweedIMG,tumbleweedX,tumbleweedY);
     
 }
 
 /*------------------------------------------------
                DESSINER  NUAGES
 --------------------------------------------------*/
void drawNuage()
{
  float vitesseX = 0.5;
        
  imageMode(CORNER);
  
    //AFFICHER DÉPLACEMENT DU NUAGE
    posX1now = posX1now + vitesseX;
    posX2now = posX2now + vitesseX;
    posX3now = posX3now + vitesseX;
    posX4now = posX4now + vitesseX;
    image(nuage01IMG,posX1now,posY1);
    image(nuage02IMG,posX2now,posY2);
    image(nuage03IMG,posX3now,posY3);
    image(nuage04IMG,posX4now,posY4);
    
  //Une fois sortie du cadre, retour de l'image par la gauche
   if(posX1now > width)  
    {
      posX1now = -200;
    }
  else if(posX2now > width)
    {
      posX2now = -100;
    }
  else if(posX3now > width)
    {
      posX3now = -150;
    }    
  else if(posX4now > width)
    {
      posX3now = -100;
    }            
    
}

