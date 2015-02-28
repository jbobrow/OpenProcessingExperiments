
// Cette classe permet de générer une courbe de bézier avec des paramètres aléatoires
 
class BezierCouleur
{

/******************************************/   
//ATTRIBUTS

 //Position
  float posX1,posY1,posX2,posY2; //Position des extrémités
  float control1x, control1y,control2x, control2y; //Points de contrôles
  float theta; //Orientation
  //Couleur
  float teinte;
  float sature;
  float bright;
  float alphaCourbe;
  //Largeur de la terminaison
  float rayonEllipse;
   
/******************************************/   
//CONSTRUCTEUR

  BezierCouleur()
  {
    this.teinte = teinte;
    
    this.theta = radians(random(0,360));
    this.posX1= 0;
    this.posY1= 0;
    
    this.posX2= random(70,140);
    this.posY2= random(70,140);
    
    this.control1x= random(50,90);
    this.control1y= random(50,90);
    this.control2x= random(50,90);
    this.control2y= random(50,90);
    
    this.teinte=random(0,255);
    this.sature=random(50,100);
    this.bright=random(200,255);
    this.alphaCourbe=4;
    
    this.rayonEllipse=random(3,9);
  }
  
/******************************************/   
//MÉTHODES


//----------------------------
//  AFFICHER LA COURBE

  void draw()
  {
    //Dessiner le segment bézier couleur du cercle chromatic.
     pushMatrix();
    rotate(theta);
    stroke(teinte,sature,bright,alphaCourbe);
    strokeWeight(1);
     noFill();  
    bezier(posX1,posY1,control1x,control1y,control2x,control2y,posX2,posY2);
    fill(teinte,sature,bright,alphaCourbe);

   //Dessiner la terminaison de la courbe
   noStroke();  
    ellipse(posX2,posY2,rayonEllipse,rayonEllipse);
    popMatrix();
  }
  
}

