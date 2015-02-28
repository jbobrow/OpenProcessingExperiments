
/*///////////////////////////////////
Florence Labelle
TP1 Monstre interactif
EDM4600-50 Algorithmie de base et interactivité
11 février 2011
//////////////////////////////////*/

//Déclaration de mes variables (utilisées + tard)
float x= 150; // posX oeil gauche
float x2= 205; // posX oeil droit
float y = 150; // posY yeux
float y2 = 0; // posY stalagtites
float w = 25; // width intérieur oeil
float h = 25; // height intérieur oeil
float ws = 10; // width pupille
float hs = 10; // height pupille
float radiansdr; //pour oeil droit
float distancecrl; // distance centre-rayon à partir du milieu de ma tête
float savedTime;
int ellipseX = 200; // posX de la tête
int ellipseY = 200; // posY de la tête
int rayon = 100; // rayon de la tête


//Setup
void setup(){
  size(400, 400); // taille de mon interface
  smooth();
  stroke(0.5);  
  frameRate(20); // nb de frames/seconde
  savedTime = millis();

}


//Draw
void draw(){
  background(255);
  
  //boules
    if ( mousePressed ) {
    float elapsed = millis() - savedTime;
    
    fill(150, 255 , 200 );  // remplissage en vert moisi
    ellipse( 20, map(elapsed,0,5000,65,height/2), 20 , 20 );
    ellipse( 60, map(elapsed,0,5000,50,height), 20 , 20 );
    ellipse( 100, map(elapsed,0,5000,50,height), 20 , 20 );
    ellipse( 140, map(elapsed,0,5000,65,height/2), 20 , 20 );
    ellipse( 180, map(elapsed,0,5000,50,height), 20 , 20 );
    ellipse( 220, map(elapsed,0,5000,65,height/2), 20 , 20 );
    ellipse( 260, map(elapsed,0,5000,50,height), 20 , 20 );
    ellipse( 300, map(elapsed,0,5000,50,height), 20 , 20 );
    ellipse( 340, map(elapsed,0,5000,65,height), 20 , 20 );
    ellipse( 380, map(elapsed,0,5000,50,height/1.5), 20 , 20 );
     
    // Relancer animation après 5 sec.
     if ( elapsed > 5000 ) {
         savedTime = millis();
    }
    }
   
  //stalagtites
    fill(150, 150 , 255 );  // remplissage en bleu-mauve
    triangle(10, y2, 20, y2+60, 30, y2); // position (x1,y1,x2,y2,x3,y3) de chaune de mes stalagtites
    triangle(50, y2, 60, y2+40, 70, y2);
    triangle(90, y2, 100, y2+40, 110, y2);
    triangle(130, y2, 140, y2+65, 150, y2);
    triangle(170, y2, 180, y2+40, 190, y2);
    triangle(210, y2, 220, y2+50, 230, y2);
    triangle(250, y2, 260, y2+40, 270, y2);
    triangle(290, y2, 300, y2+40, 310, y2);
    triangle(330, y2, 340, y2+72, 350, y2);
    triangle(370, y2, 380, y2+40, 390, y2);
    
    
  //tête
    float distancecrl = dist( mouseX , mouseY , ellipseX , ellipseY );  
    if ( distancecrl < rayon ) {  // mouseOver
      fill(255, 200, 0, 255); // si mouseOver, alors la tête devient jaune
  } else {
      fill(random(255), 0, 0, 255); // si mouse n'est pas Over, la tête se colore en rouge, opacité aléatoire
  }
    ellipseMode(RADIUS); // mes cercles sont dessinés selon leur rayon
    ellipse( ellipseX , ellipseY , rayon , rayon ); // données de la tête
    
 
 
    if(mousePressed){
    float distance = dist(mouseX,mouseY,ellipseX,ellipseY);
    if ( distancecrl > rayon){  // si on clique sur la tête, le background = 255
        fill(random(255), 255, 0, 255);

    }else{
      background(255); 
    }
  }
 


    ellipseMode(CENTER); // mes cercles sont dessinés à partir de leur centre
  
  //dents
    fill(255);  // remplissage en blanc
    arc(180, 224, 10, 10, 0, PI/2);
    arc(186, 222, 10, 10, 0, PI/2);
    arc(192, 221, 13, 15, 0, PI/2);
    arc(198, 218, 10, 10, 0, PI/2);
    arc(204, 216, 10, 10, 0, PI/2);
  
  //cernes
    strokeWeight(2);  // épaisseur du trait = 2
    noFill();  // pas de remplissage
    beginShape();
    curveVertex(120, 175);
    curveVertex(120, 185);
    curveVertex(150, 197);
    curveVertex(178, 187);
    curveVertex(178, 177);
    endShape();
 
  //contour bouche
    fill(0);  // remplissage en noir
    beginShape(); // ligne du haut
    curveVertex(170, 240);
    curveVertex(175, 225);
    curveVertex(189, 217);
    curveVertex(210, 214);
    curveVertex(215, 225);
    endShape();
  
    beginShape();  // ligne du bas
    curveVertex(183, 246);
    curveVertex(188, 251);
    curveVertex(202, 243);
    curveVertex(223, 240);
    curveVertex(228, 251);
    endShape();
  
    beginShape(); // ligne de gauche
    curveVertex(170, 240);
    curveVertex(175, 225);
    curveVertex(185, 236);
    curveVertex(189, 252);
    curveVertex(186, 260);
    endShape();
  
    beginShape(); // ligne de droite
    curveVertex(205, 229);
    curveVertex(210, 214);
    curveVertex(220, 225);
    curveVertex(224, 241);
    curveVertex(221, 249);
    endShape();
  
  // sourcils
    beginShape();  //sourcil1
    fill(0);  // remplir en noir
    curveVertex(120, 109);
    curveVertex(120, 125);
    curveVertex(88, 130);
    curveVertex(110, 146);
    curveVertex(110, 146);
    endShape();


    beginShape();  //sourcil2
    curveVertex(120, 125);
    curveVertex(120, 125);
    curveVertex(105, 100);
    curveVertex(136, 113);
    curveVertex(136, 113);
    endShape();

    beginShape();  //sourcil3
    curveVertex(136, 113);
    curveVertex(136, 113);
    curveVertex(145, 86);
    curveVertex(156, 113);
    curveVertex(156, 113);
    endShape();



  // oeil gauche
    // du + grand cercle au + petit
    noStroke();
    fill(127);  // remplissage en gris
    ellipse(150,150,80,80);
  
    stroke(0);
    fill(255,255,255,175);  // couleur de remplissage
    ellipse(150,150,64,64);
 
    colorMode(RGB); // (rouge,vert,bleu,opacité)
    noStroke();  // pas de trait de contour
  
    fill(200,200,200,125);
    ellipse(150,150,50,50);
  
    fill(25,250,25,40);
    ellipse(150,150,40,40);
  
    fill(250,250,0,65);
    ellipse(150,150,33,33);
  
    fill(250,250,0,80);
    ellipse(x,y,w,h);
  
    fill(250,250,0,150);
    ellipse(150,150,15,15);
  
    stroke(0);
    fill(90,0,0,200);
    
    //constrain de la pupille gauche
    float radians = atan2(mouseY-y, mouseX-x);
    float distance = sqrt(pow(mouseY-y, 2) + pow (mouseX-x, 2));
    ellipse(cos(radians)*min(distance,w/2-ws/2)+x,sin(radians)*min(distance,h/2-hs/2)+y,ws,hs);
  // fin oeil gauche
 

  // oeil droit
    stroke(0);  // couleur du trait de contour = noir
    fill(0);  // remplissage en noir
    ellipse(205,152,48,48);
  
    fill(255,255,255,150);
    ellipse(205,150,43,43);
 
    colorMode(RGB);  // (rouge,vert,bleu,opacité)
    noStroke();  // pas de trait de contour
    fill(25,250,25,40);
    ellipse(205,150,35,35);
  
    fill(250,250,0,65);
    ellipse(205,150,33,33);
  
    fill(250,250,0,80);
    ellipse(205,150,25,25);
  
    fill(250,250,0,150);
    ellipse(x2,y,w,h);
  
    stroke(0);
    fill(90,0,0,200);
 
    //constrain de la pupille gauche
    float radiansdr = atan2(mouseY-y, mouseX-x2);
    float distancedr = sqrt(pow(mouseY-y, 2) + pow (mouseX-x2, 2));
    ellipse(cos(radiansdr)*min(distancedr,w/2-ws/2)+x2,sin(radiansdr)*min(distancedr,h/2-hs/2)+y,ws,hs);
  // fin oeil droit
  
   
   
 
  }
  // position relative à la souris dans l'interface
  void mousePressed(){
    println("Clique:x "+mouseX+" y "+mouseY);
  }
 


