
///***Definition des constantes
  ///DeathHeart par Barbara Kesraoui///

final int FPS = 30; //le temps
final int ARROWSHOTMS = 200; //

///*** Déclaration global de deathheart
int x,y;
boolean arrowshot = false;
int arrowinitframe = 0;
int arrownbframes = 0;
float arrowpix = 0.0;

float deplacement = 0.0;

///***Constructeur de programme
void setup() {
  size(400,400);
  frameRate(30);
  
  arrownbframes = ARROWSHOTMS / (1000 / FPS) + 1;
  arrowpix = 300 / arrownbframes;
  println(arrowpix);
  
  //arrowpix = dist(0, 400, 400, 0) / arrownbframes;

  //println(arrowpix);
  
}


void draw() {
  background(0);
  
  float centerX = width/2;
  float centerY = height/2 - 50;
  
  
  x= mouseX;
  y=mouseY;
  
///*** Dessine le coeur
    smooth();
    noStroke();
    
    
    float z = 25;
    
    fill(255,0,0);
    beginShape();
    //vertex(centerX, centerY);
    //bezierVertex(centerX, centerY-(z*4), centerX+(z*8), centerY-(z*2), centerX, centerY+(z*5));
    vertex(centerX, centerY);
    bezierVertex(centerX, centerY-(z*4), centerX-(z*8), centerY-(z*2), centerX, centerY+(z*5));
    endShape();
    

///*** Paramètres pour l'animation de la flèche
    
    if(mousePressed && !arrowshot){
      arrowshot = true;
      arrowinitframe = frameCount;
    }
  
    if(arrowshot){
      int nbframe = frameCount - arrowinitframe;
      deplacement = nbframe * arrowpix;
      if(nbframe==arrownbframes) { arrowshot = false; println("end");}
    }
  
    translate(0+deplacement,400-deplacement); //translation vectorielle
    rotate(-45.0 / 360 * PI * 2); // rotation de ma flèche
    fill(255);
    triangle(0,0 ,-30,20,-30,-20 );
    rect(-190,-10,90,20);    
    resetMatrix();  // ré-initialise nos paramètres
    
///*** re-déssine le coeur apprès le passage de la flèche
    fill(255,0,0);
    beginShape();
    vertex(centerX, centerY);
    bezierVertex(centerX, centerY-(z*4), centerX+(z*8), centerY-(z*2), centerX, centerY+(z*5));
    endShape();    
    
///*** Dessine l'oeil
    fill(124,115,115);
    strokeWeight(60);
    ellipse(centerX+50, centerY-3,70,70);
    fill(207,219,49);
    ellipse(centerX+50, centerY-3,60,60);
    fill(0);
    ellipse(centerX+50, centerY-3,50,50);
    ellipse(centerX-50, centerY+3,50,50);
    ellipse(centerX-50, centerY+3,70,70);
    
///*** Dessine la pupille
    fill(250);
    strokeWeight (50);
    ellipse(centerX+50,centerY-3,40,30);
    ellipse(centerX-50,centerY+3,40,30);
    
///*** Dessine l'iris
    fill(0);
    strokeWeight(4);
    ellipse(centerX+50,centerY-3,40,15);
    ellipse(centerX-50,centerY+3,40,15);
    
    
///*** Dessine la bouche avant la mort de DeathValentin
    fill(0);
    strokeWeight(100);
//    triangle(centerX-30,centerY+70,centerX+30,centerY+70,centerX-40,centerY+50);
    triangle(centerX,centerY+80,centerX-70,centerY+120,centerX+70,centerY+120);
 //   triangle(centerX , centerY + 30, centerX+10, centerY + 50, centerX -10, centerY + 50);
    
   
///dents
    fill(255);  // remplissage en blanc
    arc(centerX-2,centerY+80, 20, 20, 0, PI/2);
    arc(centerX-3,centerY+82, 20, 20, 0, PI/2);
    arc(centerX-30,centerY+86, 20, 20, 0, PI/2);
    arc(centerX-10,centerY+80, 20, 20, 0, PI/2);
    arc(centerX-20,centerY+83, 20, 20, 0, PI/2);
    arc(centerX-30,centerY+86, 20, 20, 0, PI/2);
    arc(centerX-36,centerY+88, 20, 20, 0, PI/2);
    arc(centerX,centerY+80, 20, 20, 0, PI/2);
    arc(centerX+2,centerY+80, 20, 20, 0, PI/2);
    arc(centerX+3,centerY+82, 20, 20, 0, PI/2);
    arc(centerX+5,centerY+83, 20, 20, 0, PI/2);
    arc(centerX+10,centerY+85, 20, 20, 0, PI/2);
    arc(centerX+15,centerY+87, 20, 20, 0, PI/2);
    arc(centerX+20,centerY+90, 20, 20, 0, PI/2);
    arc(centerX+25,centerY+95, 20, 20, 0, PI/2);
//    arc(centerX-30,centerY+90, 20, 20, 0, PI/2);
   

///*** Dessine le nez
    fill(0);
    triangle(centerX , centerY + 30, centerX+10, centerY + 50, centerX -10, centerY + 50);
    
    
    
  
}

  
  void mousePressed() {
        println("Clique: x "+mouseX+" y "+mouseY);

  
}

