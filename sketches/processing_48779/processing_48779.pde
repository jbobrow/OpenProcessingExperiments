
import ddf.minim.*;
// déclaration du lecteur mp3 (la même liste de mots que ci-dessous est enrégitrée
// et moulinée en concaténation au hasard avec CataRT ancienne version 0.9.9
// http://imtr.ircam.fr/imtr/CataRT
// + basse en modelisation Moog le tout enregistré en mp3 par commodité
Minim minim;
AudioPlayer song;

// meilleur voeux 2012 par Etienne Brunet
// Sketch d'après les cours de Matthieu Savary, Marco Serrano et Jimi Hertz à Main d'Oeuvre
// déclaration des 2 listes de mots identiques, liste en haut en bdc Times et en bas : Cap Helvetica 
// la liste de mot du bas est redonnée dans le même random que la liste 2 en Langue LOGO

String[] [] biMot = {
  {
    "Année", "& heureuse", "Bonne", "Excellente", "& Grande", "& Amour", 
    "& Fortune", "Election", "Progrès", "& Joie", "& Générosité", "& Amitié", "& Travail", "Patrie", "International", 
    "Deux", "Mille", "Douze", "2012", "Force", "Jouissance", "Paix", "Intelligence", "Ecologie", "Binaire", "Santé", "Bonheur"
  }
  , 
  { 
    "ANNEE", "& HEUREUSE", "BONNE", "EXCELLENTE", "& GRANDE", "& AMOUR", "& FORTUNE", 
    "ELECTION", "PROGRES", "& JOIE", "& GENEROSITE", "& AMITIE", "& TRAVAIL", "PATRIE", 
    "INTERNATIONAL", "DEUX", "MILLE", "DOUZE", "2012", "FORCE", "JOUISSANCE", "PAIX", 
    "INTELLIGENCE", "ECOLOGIE", "BINAIRE", "SANTE", "BONHEUR"
  }
};
PFont font ;

void setup() 
{
// méthode de lecture du mp3
  minim = new Minim(this);
  song = minim.loadFile("bonn-anneeV2.mp3");
  song.play();
  frameRate(0.50);
  size (960, 540);
  smooth();
}
void draw()
{
  background  ((random (80, 190)), (random (100, 120)), (random (100, 120)));
  // mise en oeuvre des 2 listes de mots
  int premierIndex = int(random(0, 27));
  int secondIndex = int(random(0, 27));

  // les lignes parallèles
  strokeWeight (1);
  for (float i=10; i<=200; i*=1.2) {
    line(10, i, 960, 540);
  }
  // la ligne plus grasse
  strokeWeight (5);
  stroke (255);
  line (10, 230, 960, 540);

  // les 2 lignes plus horizontale

  strokeWeight (1);
  stroke (255);
  line (10, 186, 960, 186);

  strokeWeight (1);
  stroke (255);
  line (10, 192, 960, 192);

  // Mot en Times tiré au hasard
  font = loadFont("Times-Roman-75.vlw");
  textFont(font);
  textAlign(CENTER);
  fill(0);
  text((biMot[0][premierIndex]), width/2, 250);

  // Mot en helvetica tiré au hasard
  font = loadFont("HelveticaNeue-CondensedBold-75.vlw");
  textFont(font);
  fill(random (1, 155), random (1, 55), random (1, 155));
  text((biMot[1][secondIndex]), width/2, 320);

  // traduction en LogoLangue du mot en helvetica  
  font = loadFont("ClassifiedDingbats-72.vlw");
  textFont(font);
  fill(100, 0, random (0, 255));
  text((biMot[1][secondIndex]), width/2, 190);
}
void stop()
{
  song.close();
  minim.stop();

  super.stop();
}


