
// Importer une police et écrire dans le sketch

// Pour les polices de caractères, c'est similaire aux images. Il faut tout d'abord utiliser le menu et "Create Font"
// On peut y choisir sa police, sa taille et le nom du fichier vlw que Processing copiera dans un dossier data.

// Déclaration de la variable de police :
PFont Mon_Verdana;
// Variables pour distribuer les lettres dans l'espace :
int x;
int y;
int couleur;

void setup() {
size (600,600);
background (0);
smooth();
noStroke();
frameRate(20);
colorMode (HSB,100);

// Chargement du fichier vlw dan la variable :
Mon_Verdana = loadFont ("Verdana-Bold-50.vlw");
}

// A chaque appel de draw, la position des lettres change et la couleur de remplissage aussi :
void draw() {
x = int(random(600));
y = int(random(600));
couleur = int(random(100));
fill (couleur,100,80,60); // Teinte, saturation, luminosité, alpha.
}

// Avec keyPressed, on écrit dans notre police :
void keyPressed() {
// TextFont est le choix de la plume (Police, taille de la police) :
textFont (Mon_Verdana, 50);
// Text est l'instruction qui écrit (Chaîne de caractère, position x, position y) :
text(key,x,y);
}

