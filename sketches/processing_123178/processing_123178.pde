
PImage img;
PFont font;
String texte = "#What Else ? @Nespresso";
int compteur = 0;

void setup() {
 
  size(451,586);
  img = loadImage("Clooney.jpg");
  background(0);
  frameRate(1000);
  
}
void draw() {
    compteur ++;
    if (compteur >= texte.length()) compteur = 0;
    char lettre = texte.charAt(compteur);
    println(lettre);
    int x = int(random(img.width));
    int y = int(random(img.height));
    color couleur = img.get(x, y);  
    fill(red(couleur), green(couleur), blue(couleur));
    float bx = x + random(-20, 20);
    float by = y + random(-20, 20);
    text(lettre, x, y); 
  
    }
void keyPressed() {
  if (key == 'o') saveFrame("resultat_" + millis() + ".png");
}


