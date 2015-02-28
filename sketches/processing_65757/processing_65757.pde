

// 1ER SYSTÈME DE PARTICULES

// ArrayList est permet de créer une liste à taille variable (On peut ajouter, retirer, retrouver des éléments) :
ArrayList les_particules;

void setup() {
size(600,600);
les_particules = new ArrayList();
smooth();
colorMode(HSB,100);
}

void draw() {

// A chaque appel de draw, on ajoute un objet particule à la liste particules grâce à la méthode add. 60 nouvelles par seconde.
les_particules.add(new particule());
// C'est à dire non pas un petit truc rond, mais plus précisément les données suivantes :
// - Une position X et Y qui correspond à l'emplacement du curseur à ce moment précis
// - Une vitesse X et Y tirée au sort
// - Une couleur tirée au sort

background(0);

// Parcourt la liste jusqu'à sa limite :
for (int i = 0; i < les_particules.size(); i++ ) { 
// On utilise la classe particule et ses méthodes pour manipuler chaque particule enregistrée :
particule p = (particule) les_particules.get(i);
// Le 1er terme ci-dessus est un objet particule (dérivé de la classe) qui est capable de manipuler les
// données enregistrées dans la liste. C'est un couteau-suisse "particule" qui va traiter les données.
p.avancer(); // 1er outil
p.gravite(); // 2ème outil
p.dessiner(); // 3ème outil
}

// On utilise remove() pour supprimer la 1ère case (le plus avancé dans l'animation) :
if (les_particules.size() > 400) {
les_particules.remove(0); 
}

}

