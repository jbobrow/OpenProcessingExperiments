
void setup()
{
  //je déclare une variable pour la taille de la page
  int Variable_size;
  Variable_size = 500;
  //je déclare une variable pour la couleur de fond
  int Variable_background;
  Variable_background = 0;
  //je déclare une variable pour la couleur du trait
  int variable_stroke;
  variable_stroke = 255;
  //je déclare une variable pour l'épaisseur du trait
  int Variable_strokeweight;
  Variable_strokeweight = 2;
  

  
  //SIZE
  //La taille en pixel du papier de la fenêtre est largeur= 500 hauteur= 500
  size(Variable_size,Variable_size);
  
  smooth();
 
  //BACKGROUND
  //Peindre le fond de notre fenetre (0)
  background(Variable_background);
}

void draw()
{ 
  
  //je déclare une variable pour la couleur du trait
  int Variable_stroke;
  Variable_stroke = 255;
  //je déclare une variable pour l'épaisseur du trait
  int Variable_strokeweight;
  Variable_strokeweight = 2;
  //je déclare une variable pour le x d'une ligne
  int Variable_line;
  Variable_line = 250;
  //je déclare une variable pour le y d'une ligne
  int Variable_line2;
  Variable_line2 = Variable_line+50;
  //je déclare une variable pour l'arc
  int Variable_arc;
  Variable_arc = Variable_line-150;
  //je déclare une variable pour l'arc
  int Variable_arc2;
  Variable_arc2 = Variable_arc+10;
  
  //NOFILL
  //les formes suivantes ne seront pas remplies
  noFill();
  
  //STROKE
  //Les formes suivnates auront un contour blanc
  stroke(Variable_stroke);
  
  //ELLIPSE
  //Dessiné plusieurs ellipses
  
  strokeWeight(Variable_strokeweight);
  arc(Variable_line,Variable_line,Variable_arc,Variable_arc2,0,1);
   //arc(Variable_line,Variable_line,Variable_arc,Variable_arc2,1,2);
   //arc(Variable_line,Variable_line,Variable_arc,Variable_arc2,2,3);
   //arc(Variable_line,Variable_line,Variable_arc,Variable_arc2,3,4);
   //arc(Variable_line,Variable_line,Variable_arc,Variable_arc2,4,5);
   //arc(Variable_line,Variable_line,Variable_arc,Variable_arc2,5,6);
   //arc(Variable_line,Variable_line,Variable_arc,Variable_arc2,6,7);
  
  line(Variable_line,Variable_line,Variable_line2,Variable_line);
  
  
  noLoop();
}


