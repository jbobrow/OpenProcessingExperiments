
Rabbit[] lapins = new Rabbit[0];

int sexe;
int initialisation;
int generation;
int taille_chaine;
int lapins_morts;
int mois;
int compteur;

// maternity
float x_mat;
float y_mat;
int t_mat;
float xtime;
float ytime;


void setup() {
  size(600,600);
  initialisation = 1;
  sexe = 1;
  generation = 0;
  mois = 0;
  compteur = 0;

  xtime = 0.0;
  ytime = 100.0;

  // maternity
  x_mat = noise(xtime)*width;  
  y_mat =  noise(ytime)*height;
  t_mat = 50;
  
  PFont lapins = loadFont("rabbits.vlw"); // choix de la typo
  textFont(lapins, 20);  // Definition de la taille de la typo
}

void draw() {
  fill(0,0,0,40);
  noStroke();
  rect(0,0,width,height);

  compteurMois();
  newGeneration();
  afficher();

  for ( int i = 0; i < lapins.length; i++) {
    lapins[i].display();
  }
}

void newGeneration() {
  if (initialisation == 1) {
    Rabbit h = new Rabbit(1);
    lapins = (Rabbit[]) append(lapins,h);

    Rabbit f = new Rabbit(2);
    lapins = (Rabbit[]) append(lapins,f);

    initialisation += 1;
    generation += 1;
  }
}

void afficher() {
  fill(255);
  text("Generation : ", 0, 20);
  text(generation, 130, 20);
  
  taille_chaine = lapins.length - lapins_morts;
  text("Living rabbits :", 0, 50);
  text(taille_chaine, 130, 50);
  
  text("Dead rabbits :",0, 80);
  text(lapins_morts, 130, 80);
  
  text("Mounth :", 0, 110);
  text(mois, 130, 110);
}

void compteurMois() {
  compteur += 1;
  
  if( compteur % 250 == 0) {
    mois += 1;
  }
}

