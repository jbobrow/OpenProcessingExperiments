


// *** Definition des constantes
final int FRAMERATE = 8;
final int SCREENW   = 500;
final int SCREENH  = 500;

// *** Declaration globale et initialisation des paramètres de loop

int stab=0;
int stabrx1 = 0;
int staborx2 = 0;
int stabory1 = 0;
int stabory2 = 0;
int stabe = 0;
boolean stabing=false;



// *** Declaration Global du monstre
DeathValentin monster;
DeadFleche  fleche;

// *** Constructeur du programme
void setup(){
  
  frameRate(FRAMERATE);
  size (SCREENW,SCREENH);
  monster= new DeathValentin(250,200);
  fleche=new DeadFleche(250,250);
}


//*** Dessine DeathValentin à chaque click
   void draw(){
    background (0);
    monster.dessine(); 
  //fleche.dessine();
}


//*** Classe de l'animal
class DeathValentin {
  
  int centerx;
  int centery;
  
  
  DeathValentin( int _centerx,int _centery){
    this.centerx = _centerx;
    this.centery = _centery;
  }
  
  
 
  void dessine () {
    
    //*** déssine le corps
    this.drawHeart(this.centerx,this.centery,50);
    width = SCREENW/2;
    height= SCREENW/2;
    this.drawEye(60,40);
    
   // this.drawAiles(this.cos x, sin x);
   // this.drawAiles(this.centeryx,this.centery,40);
  //  this.drawNoeudpap(115,154);

  }
       
   void drawHeart(int x,int y,int z){
     
    noStroke();
    fill(255,0,0);
    beginShape();
    vertex(x, y);
    bezierVertex(x, y-(z*4), x+(z*8), y-(z*2), x, y+(z*5));
    vertex(x, y);
    bezierVertex(x, y-(z*4), x-(z*8), y-(z*2), x, y+(z*5));
    endShape();
  }  
  
  //*** Méthode de dessin d'un oeil
  
  void drawEye(int x, int y){ 
    
    
  //*** Dessin du contour de l'oeil
    
   
   //fill(0);
   //strokeWeight(50);
   //ellipse(160,270,123,146);
   smooth();
   fill(0);
   strokeWeight(20);
   ellipse(this.centerx+x,this.centery+y,70,60);
   ellipse(this.centerx-x,this.centery+y,70,60);
   
   
  
 
    //*** Dessin de la pupille
    fill(250);
    strokeWeight(50);
    ellipse(this.centerx+x,this.centery+y,40,40);
    ellipse(this.centerx-x,this.centery+y,40,40);
    
     ///*** dessin de l'iris
    fill(0);
//   stroke(0);  ======================  ?????? me fait apparaître les autres formes écrites en arrière plan what the fuck
    strokeWeight(4);
    ellipse(this.centerx+x,this.centery+y,40,15);
    ellipse(this.centerx-x,this.centery+y,40,15);
    
    //--> Initilise l'axe des x et y pour la position des yeux
//    float axex = (mouseX-x < 0 ? (0.-(1-((float)mouseX/((float)x)))) : ((float)mouseX-(float)x)/((float)SCREENW-(float)x));
//    float axey = (mouseY-(y-35) < 0 ? (0.-(1-((float)mouseY/((float)(y-35))))) : ((float)mouseY-(float)(y-35))/((float)SCREENH-(float)(y-35)));
		
    //--> D�place le centre vers la position de l'oeil
//     translate(x,y);
//     rotate(angle / 360 * PI * 2);
    
    //*** Dessin du nez
    fill(0);
    strokeWeight(50);
    triangle(250,271,224,294,277,294);
    
    //*** Dessine la bouche avant la mort de DeathValentin
    fill(0);
    strokeWeight(50);
    triangle(208,355,236,331,270,355);
    triangle(242,355,263,330,297,355);
    
    //*** Dessine la cicatrice

    fill(0);
    arc( 150,  155,260 , 60, PI/2, PI);
    
    float f = 0.0;
    beginShape(POLYGON);
    while(f < HALF_PI) {
    vertex(width/2 + cos(f)*40, height/2 + sin(f)*200);
    f += PI/20.0;
}
    endShape();
    //*** Dessine les points de sutures
    
//  arc(50, 55, 70, 70, PI, TWO_PI-PI/2);
//  arc(50, 55, 80, 80, TWO_PI-PI/2, TWO_PI);
    fill(0);
    strokeWeight(2);
    stroke(0);
    line(93,142,84,187);
    line(106,142,99,188);
     line(118,142,118,191);
    line(134,144,131,192);
    line(275,364,288,379);
    line(281,357,292,375);
    line(289,350,311,367);
    line(294,341,320,362);
    line(305,327,333,352);
    line(312,316,341,344);
    line(322,308,349,339);
    line(328,297,363,323);
    line(332,291,367,320);
    line(340,283,371,312);
    line(346,276,375,298);
    line(380,289,357,260);
    line(385,279,363,252);
    
    
  
  }
 
     //*** Méthode de dessin d'une aile
    
    //  void drawFly(cos x, sin y) { 
//    void drawFly(int x, int y) {
     
//    float angle = 0.0; 
//     beginShape(POLYGON); 
       //vertex(width/2, height/2);
//      while( QUARTER_PI) { 
//      vertex(width/2 + cos(60)*x, height/2 + sin(60)*x); 
//      angle += PI/12.0; 
//    } 
//    endShape(CLOSE);
     
}    
  
//
//
  

//    void drawNoeudpap   ( int x , int y ){
      

    //***  Dessine le noeud papillon
    
    
//    fill(250);

//   strokeWeight(2);
//   ellipse(248,446,248,470);
   
    
//   stroke(30,173,17);
//    ellipse ( this.centerx+x,this.centery+y,50,50);
//
    
//    triangle(177,432,225,449,188,432);
//    triangle(x1+30 , y1 , x2+30 , y2    , x3+30 , y3      );
    
    
    

    
    //*** Dessine la bouche après le départ de la flèches
    
    
//    strokeWeight(5);
//    stroke(250);
//    line(224,294,277,294);
//  }

    


  ///*** Nouvelle classe fleche
class  DeadFleche {
       
  
  int cx;
  int cy;
  int w=200;
  int h=10;
  int pw=20;
  int ph=50;
  
  
  DeadFleche( int _centerx,int _centery){
    this.cx = _centerx;
    this.cy = _centery;
    
  }
  
  ///*** Dessine fleche
 
  void dessine () {
 
   int th=4*h;
   
   th= 4*h;
  
   fill(234,21,21);
   strokeWeight(2);
   rect(cx-w/2,cy-h/2,w,h);
   
  /// Dessine  une pointe de fleche
   
  fill(250);
//  triangle (cx+(w/2),cy-(th/2),cx2+(w/2),cy2-(th/2),cx3+(w/2),cy3-(th/2),cx4+(w/2);
    triangle(cx+(w/2),cy-(th/2),cx+(w/2),cy+(th/2),cx+(w/2)+(int)sqrt(pow(th,2)-pow(th/2,2)),cy);
    
   /// Dessine plume
  /* 
  int x1=cx-w/2
  int y1=cy-h/2
  int x2=
  int y2=
  int x3=
  int y3=
  int x4=
  int y4=
  
 //  quad(x1, y1, x2, y2, x3, y3, x4, y4)
   
   fill(250);
   quad(142,205,132,189,
   */

  }
    
}
  
    //*** Detecte quand la flèche part.
    //
 //
 //
// if mousePressed
//  fill(0);
//  ellipse(250,364,100,100);
   
    
    
                                               ///**** supposition des bugs : faire une translation pour changer le centre avant l'interaction 




///  }




void mousePressed() {
        println("Clique: x "+mouseX+" y "+mouseY);



  }

