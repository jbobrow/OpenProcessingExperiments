
// hommage au Bimot, livre de Julien Blaine. Processing d'après le cours de Matthie Savary
// déclaration des 2 listes de mots, liste en haut en bdc Times et en Cap Helvetica en bas

String[] [] biMot = {{"Dé","Agacer","Pie", "Aubère", "Rouanne", "Nuage", "Accuse", "Coup", "Choc", "La",
"Bai", "Isabelle", "Je", "Robes", "Chiffons", "Loquer", "Désirs", "Vocabul", "Abécéd aire", "Via",
"Sauge", "Laurier", "Fenouil", "Persil", "Safran", "Basilic", "Coriandre", "Feuille",
"Poumons", "Cartilage", "Reins", "Foie", "Vaisseaux", "Peau", "Cheveux", "Poils", "Muscles", "Viscères", "Squelette", "Cervelle",
"Con", "Fruit", "Marée", "Cloaque", "Ecrire", "Lamême", "Lodeur", },
{ "APOSTROPHE", "UNE", "èVE", "COLORé", "VERBE", "NOM", "PHOTOGRAPHiE", "iMAGE", "CHiFFONS", "LOQUES", 
"CAUSER", "DiCTiONN AiRE", "RéGLiSSE", "CUMiN", "MUSCADE", "POiVRE", "CANELLE", "GENièVRE", "PiMENT","GiNGEMBRE",
"RACiNE", "GOUDRONNéS", "DéCONJUGUé", "ENSABLéS", "ENGORGé", "ENCRASSéS", "RiDES", "BLANCS", "GRiS", "DOULEURS", "MéMOiRES", 
"ESTiVAL", "DEL OCéAN", "BASSE", "ORiGiNEL", "ODEUR", "CRESCENDO", "LE SON", "L iMAGE"}};
PFont font ;

void setup() 
{
   frameRate(0.75);
 size (400, 650);
 smooth();

}
void draw()
{
   background (255);
  // mise en oeuvre des 2 listes de mots
  int premierIndex = int(random(0, 38));
  int secondIndex = int(random(0,38));
   // les lignes parallèles
   strokeWeight (1);
for(float i=10; i<=380; i*=1.2){
  line(10, i, 390, i);
}
// la ligne plus grasse
strokeWeight (5);
line (10, 310, 390, 310);
  
font = loadFont("Times-Roman-48.vlw");
textFont(font);
 textAlign(CENTER);
 fill(0);

  text((biMot[0][premierIndex]), width/2, 300);
  
font = loadFont("HelveticaNeue-CondensedBold-48.vlw");
textFont(font);
 fill(random (1, 255), random (1, 255), random (1, 255));
  text((biMot[1][secondIndex]), width/2, 360);
}



