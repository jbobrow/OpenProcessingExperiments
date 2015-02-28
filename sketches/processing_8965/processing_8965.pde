
class Feedback { // Déclaration d'une classe Feedback

    ArrayList vecteurs; // Déclaration d'un arrayList pour contenir les éléments du feedback dans une liste.

  // Constructeur de la classe Feedback
  Feedback(int n) { // Combien sur le long s'étendra le feedback
    vecteurs = new ArrayList(); //Initier une nouvelle ArrayList se nommant Vecteur
    //Boucle qui a comme limite la longueur du feedback déclaree et qui ajoute a la liste un nouveau Vecteur
    //Un vecteur est un l'établissement d'un point donnée dans l'espace
    for(int i = 0 ; i < n; i++){
      vecteurs.add(new PVector(0,0)); 
    }
  }
  // fonction qui déplace le dernier éléments de la liste vers la première.
  void update(int newX, int newY) {
    // On élimine le premier élément de la liste
    vecteurs.remove(1);
    // et on ajoute un autre éléments à la fin de la liste à l'update suivante. 
    vecteurs.add(new PVector(newX,newY));
  }

  // Fonction qui affichera le feedback
  void display() {
    // On dessine tout ce qui a été updater
    for (int i = 0; i < vecteurs.size(); i ++ ) {
      // On dessine un cercle pour chaque élément de l'arrayList. 
      // La couleur et la grandeur est définie par l'index i;
      stroke(51-i,88-i,34-i); 
      fill(26-i,25-i,14-i,20);
      // On va donc chercher un vecteur dans la liste
      PVector vecteur = (PVector) vecteurs.get(i);
      //et on l'affiche avec un cercle a la position x et y de la liste
      ellipse(vecteur.x,vecteur.y,i,i); 
    }

  }

}



