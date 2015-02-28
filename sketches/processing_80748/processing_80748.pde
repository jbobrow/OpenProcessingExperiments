
// int [] tableDesAges = {26,25,22,22,24,25,27,24,28,21,23,23,22,21,19,21,21,21,25,27,22,22};
int [] superficieDhabitation = {45,27,27,45,55,27,27,27,55,75,9,55,45,17,35,23,27,23,75,90,27,17,75};
int [] nombreDeLivres = {90, 125, 125, 90, 150, 30, 150, 10, 50, 150, 125, 90, 50, 30, 150, 30, 10, 30, 150, 10, 30, 50, 150};
boolean [] aspectDesLivres = {true,false,true,true,true,true,true,true,false,false,false,true,false,false,true,false,true,false,false,true,false,true,true,true,true,true,true};
//

void setup () {

  size (1000,1000);
  
  println(superficieDhabitation.length);  // Longeur du tableau
  for (int n=0; n < nombreDeLivres.length; n++) {  // pour mettre dans l'odre
  
  // int age = tableDesAges [n];
  int surface = superficieDhabitation [n];
  int livres = nombreDeLivres [n];
  boolean aspect = aspectDesLivres [n];
  int couleurLivres = aspect? #FFAF2E: #714806;
  
  /*int affichageDesLivres;
    if (aspect) {
      affichageDesLivres = "ces livres sont bien traités";
    }else{
      affichageDesLivres = "ces livres sont abimés";
    } */
  
  fill (couleurLivres, 160);                           // couleur selon l'aspect des livres
  
  ellipse (50+n*50, 50+n*50, +livres, +livres);      //nombre de livres

  fill (255,255,255);
  ellipse (50+n*50, 50+n*50, +surface, +surface);    //superficie de l'habitation
  
println ("dans une habitation d'environ "+surface+"m², on trouve "+livres+" livres "+aspect);
    

  
  }  
};
