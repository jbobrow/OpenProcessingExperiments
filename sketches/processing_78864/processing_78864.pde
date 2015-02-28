

int[] tableDesAges = {  21, 25, 23, 22, 25, 24, 21, 24, 21, 22, 22, 24, 25};

boolean[] tableDesGenres = {  true, true, false, true,  true, true, true, true, true, true, true, false, true};

String[] tableDesPrenoms = {"Chloé","Sophie","Gaultier","Salomé","Marie-Agathe",
"Mylène","mathilde","Sarah","Dominika","AURELIA","Anaïs","Henri","JULIE"};
// true = féminin 
// false = masculain
void setup() {
  
  size(300,700);
  background(255);
  
  //
  /* exemple de modulo
  
  14 % 12 = 2;
  12 % 14 = 12;
  4 % 5 = 4;
  5 % 4 = 1;
  44%33 = 11;
  1111 % 2 = 1;
  3 % 2 = 1;
  5 % 2 = 1;
  4 % 2 = 0;
  2 % 2 = 0; 
  
  */
  //
  
  println(tableDesAges.length);
  textAlign(CENTER);
 
  for(int n = 0; n < tableDesAges.length ; n++){
    // boucle "for" pour faire une énumération de n, 
    // de 0 jusqu'à 12, le nombre d'elements dans le tableau tableDesAges
    
    //
    int age = tableDesAges[n];
    boolean sexe = tableDesGenres[n];
    String prenom = tableDesPrenoms[n]; //
    
    prenom = prenom.toUpperCase(); // converti la chaine en majuscule 
    int couleurGenre = sexe ? #ff0080 : #0033ff; // associe la couleur en fonction du genre
    
    int positionX = (n*60) % 100 +10; // calcule la position X de base de la puce
    // le symbole % (pourcentage) est l'opérateur de modulo
    int positionY = n*50+10;// calcule la position Y de base de la puce    
    
    String affichageGenre; 
    

    if(sexe){
      // condition Si > fille
      affichageGenre = ", cette fille a ";
    }else{
      // condition Sinon > garçon
      affichageGenre = ", ce garçon a ";
    }
    
    noStroke(); 
    // arrete le trait 
    fill(couleurGenre);
    // définit le remplissage en fonction de la couleur "fille ou garçon"
    
    ellipse(30+positionX,30+positionY,age*2,age*2);
    // dessine le cercle en fonction de l'age
    text(prenom,120+positionX,35+positionY);
    // dessine le texte du prénom

    stroke(couleurGenre,128);
    // définit la couleur du trait
    line(30+positionX,10+35+positionY,200+positionX,10+35+positionY);
    // dessine la ligne

    fill(255,128);
    // fait un remplissage blanc à 50% opacité
    ellipse(30+positionX,30+positionY,30,30);
    // dessine le cercle à l'intérieur du cercle de l'age
    
    fill(couleurGenre);
    // définit le remplissage en fonction de la couleur "fille ou garçon"
    text(age,30+positionX,35+positionY);    
    // dessine le texte de l'age au milieu du cercle
    //
    println(prenom+affichageGenre+age+" ans");
    // affiche le résultat courant dans la console 
  }
  
}

void draw() {
}



