
/*
TP2-Sophie Blondeau
Key Up= Change l'apparence
Clic = Change l'effet
N'importe quel autre touche = retourne au mode normal
*/


//Initialiser les variables
int couleur;
int fillColor;

void setup()
{
  size(400,400); //Spécifie la grosseur et le type de librairie
  rectMode(CENTER); //Situe le centre du rectangle au centre 
  strokeWeight(0.5); //Spécifie la grosseur du trait
  frameRate(10); // Spécifie la vitesse de cadence
  smooth(); //Lisse le tout
}

void draw(){
  background(255); // Arrière-plan blanc
  //Première boucle pour la hauteur)
for (int i = 0; i < height; i = i + 3) 
{
  //Deuxième boucle pour la largeur
  for (int j = 0; j < width; j = j + 3) 
  {
    //Troisième boucle pour les carrées à l'intérieur du carré
    for (int k = 40; k > 0; k = k-10)
    { 
      //Si on survole un carré
      if ( insideRect( i*14 , j*14 , 40 , 40 , mouseX, mouseY) )
      {
         couleur= couleur-20; //Change la valeur de la couleur
         fill(couleur); // Remplissage du carré
         rect(i*15,j*15,k,k); //Créer un rectangle selon la bouche for
         ellipse(i*15,j*15,30,30);//Créer un cercle selon une boucle for
      }
       //Si aucun carré n'est survolé
      else{
         couleurDraw();//Appelé la fonction
         keyPressed();
         rect(i*15,j*15,k,k);//Créer un rectangle selon la boucle for
      }
    }
  }
}}

//Fonction pour changer de couleur);
void couleurDraw()
{
   if(mousePressed)
      {
        noStroke();//Enlevé les contours
        couleur= couleur-50;//Change la valeur de la variable
        fill(couleur);//Remplir les rectangles
      }
      else{
        stroke(255); //Contour blanc
        fill(0); //Fond noir
      }
}

//Fonction si touche enfoncé
void keyPressed() {
  //Si up est enfoncé
  if (key == CODED) {
    if (keyCode == UP) {
      //Augmenter la couleur de 10 a chaque clic
      fillColor = fillColor = fillColor+10;
      if(fillColor>=255)//S'assurer que la couleur ne dépasse pas 255 (Blanc)
      {fillColor=0;}
      //Remplir avec 0
      fill(fillColor);

    }
  }
}


//Code Thomas Fredericks (Cours)
boolean  insideRect (float rectX, float rectY, float rectW, float rectH , float x , float y) {
  return ( x > rectX && x < rectX+rectW && y > rectY && y < rectY+rectH ) ;
   
}


