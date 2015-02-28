
class Balle{
  /*Déclaration des variables*/
  float posx;
  float posy;
  float ballesize;
  color ballecolor;
  float vitesse;
  float gravity;
  boolean life;
  float angle;
  float angleCible;
  float millisInitial;
  float millisPresent;
  float temps;
  color balleCollision;
  color couleurActuel;
  boolean collision;
  
  /*Fonction constructrice avec paramètres*/
  Balle(float px, float py, float b_size, float v, color c)
  {
    //Assignation de valeur aux variables
    life=true;
    posx=px;
    posy=py;
    ballesize=b_size;
    ballecolor=c;
    couleurActuel=ballecolor;
    vitesse=v;
    gravity=0.01;
    balleCollision = color(255,0,0,80); 
    collision=false; 
    
    //Définir des angles pour le déplacement sur un angle random sur 360° 
    angle = random(PI*2);
    angleCible = random(PI*2);
  }
  
  /*Permet de changer la valeur boolean de collision, capturer le millis() du moment et changer l'angle de direction*/
  void changeValueCollision()
  {
    collision=true;
    angleCible = angleCible+(PI/2);
    millisInitial=millis();
  }
  
  /*Permet de vérifier à chaque DRAW s'il y a collision*/
  void chek_collision()
  {
    //S'il y a collision
    if(collision==true)
    {   
      //Pendant 100 millisecondes, la couleur sera la valeur de la variable balleCollision
      if(millis()-millisInitial  <= 100)
      {
        couleurActuel=balleCollision;
      }
     //Sinon, on remet collision à faux et on remet la couleur actuelle à la valeur initiale
      else
      {
        couleurActuel=ballecolor;
        collision=false;
      }
    }
   
  }
  
  /*Affiche la balle*/
  void affiche()
  {
    fill(couleurActuel); //Remplir avec la valeur contenue dans couleur actuelle (appellée dans la "main")
    noStroke(); // Enlever les traits
    ellipse(posx, posy, ballesize, ballesize); //Créer une ellipse avec des paramètres dans le main
    chek_collision(); // Appelle la fonction chek_collision pour qu'elle soit appelée en boucle
    meurt(); // Appelle la fonction meurt qui remet la valeur boolean de life à false 
  }
  
  void bouge(){
    // Définir l'ange cible de la balle
    if ( random(100) < 5 ) 
    {
       angleCible = random(PI*2); //Angle aléatoire de 360°
    }
    
   /* Déplacer la balle (Exemple vu en classe)*/
   float angle_difference = angleCible - angle;
     
    angle_difference = angle_difference  % (PI * 2); 
     
     if (angle_difference > PI) 
     {
      angle_difference = angle_difference- PI * 2;
      } else if (angle_difference < -PI)  {
      angle_difference = angle_difference + PI * 2;
    }
     
    angle = angle_difference * 0.1 + angle;
     
    posx = posx + cos(angle) * vitesse;
    posy = posy + sin(angle) * vitesse;
     
    if ( posx > width + 10) posx = - 10;
    else if ( posx < -10) posx = width + 10;
    else if ( posy > height + 10) posy = - 10;
    else if ( posy < -10) posy = height + 10;
    /*----------------FIN------------------*/
    
  }
  
  /*Fonction qui s'assure que si la possition de l'objet dépasse la hauteur de la scène, elle change la valeur de la boolean à false*/
  void meurt(){
    if(posy>height+20)
    {
      life=false;
    }
  }
  
}

