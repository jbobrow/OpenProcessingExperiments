
PFont typo;
String quote= " J'aime la photo, et je suis passioné par l'art du tatouage";

void setup() {
size (1500,700);
typo= loadFont("AndaleMono-40.vlw");

textFont (typo);



}

void draw () {
 textSize (25);
 text (quote,25,60);
 textSize (40);
 text (quote,25,150);



}

