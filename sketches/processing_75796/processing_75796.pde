
//Project battlearena © pinaattilatty

  //Hahmon asetukset
int hahmo_koko = 50; //Hahmon koko pikseleinä x & y suunnassa.
int hahmo_nopeus_2 = 3; //Hahmon nopeus pikseleinä / sekuntti.
int hahmo_nopeus = 3; //Hahmon nopeus pikseleinä / sekuntti.
int hahmo_x = 300; //Hahmon aloituspiste x suunnassa.
int hahmo_y = 300; //Hahmon aloituspiste y suunnassa.
int hahmo_y_2 = 300;

  //Näppäimet
boolean w = false;
boolean a = false;
boolean s = false;
boolean d = false;
boolean j = false;

  //Hahmon kuvat
PImage hahmo;
PImage hahmo_yla_oikea;
PImage hahmo_yla_vasen;
PImage hahmo_yla;
PImage hahmo_oikea;
PImage hahmo_vasen;
PImage hahmo_ala_oikea;
PImage hahmo_ala_vasen;
PImage hahmo_ala;

  //Hypyn kuvat
PImage hyppy_yla_oikea;
PImage hyppy_yla_vasen;
PImage hyppy_yla;
PImage hyppy_oikea;
PImage hyppy_vasen;
PImage hyppy_ala_oikea;
PImage hyppy_ala_vasen;
PImage hyppy_ala;

void setup() {
  
  //Ruudun koko
size(800,600);

  //Taustan väri
background(300,300,300);

  //Kuvien lataus 
 
 //Hahmon kuvien lataus 
hahmo = loadImage("img/hahmo/hahmo_ala.PNG");
hahmo_yla_oikea = loadImage("img/hahmo/hahmo_yla_oikea.PNG");
hahmo_yla_vasen = loadImage("img/hahmo/hahmo_yla_vasen.PNG");
hahmo_yla = loadImage("img/hahmo/hahmo_yla.PNG");
hahmo_oikea = loadImage("img/hahmo/hahmo_oikea.PNG");
hahmo_vasen = loadImage("img/hahmo/hahmo_vasen.PNG");
hahmo_ala_oikea = loadImage("img/hahmo/hahmo_ala_oikea.PNG");
hahmo_ala_vasen = loadImage("img/hahmo/hahmo_ala_vasen.PNG");
hahmo_ala = loadImage("img/hahmo/hahmo_ala.PNG");

  //Hypyn kuvien lataus
hyppy_yla_oikea = loadImage("img/hahmo/hyppy/hyppy_yla_oikea.PNG");
hyppy_yla_vasen = loadImage("img/hahmo/hyppy/hyppy_yla_vasen.PNG");
hyppy_yla = loadImage("img/hahmo/hyppy/hyppy_yla.PNG");
hyppy_oikea = loadImage("img/hahmo/hyppy/hyppy_oikea.PNG");
hyppy_vasen = loadImage("img/hahmo/hyppy/hyppy_vasen.PNG");
hyppy_ala_oikea = loadImage("img/hahmo/hyppy/hyppy_ala_oikea.PNG");
hyppy_ala_vasen = loadImage("img/hahmo/hyppy/hyppy_ala_vasen.PNG");
hyppy_ala = loadImage("img/hahmo/hyppy/hyppy_ala.PNG");

}

  //Itse koodi alkaa tästä
void draw() {

  //Piirtää hahmon
rect(-2,-2,802,602);
image(hahmo,hahmo_x,hahmo_y);

  //"Seinät"
if (hahmo_x < 0) {
hahmo_x = hahmo_x + hahmo_nopeus;
}
if (hahmo_x > 750) {
hahmo_x = hahmo_x - hahmo_nopeus;
}
if (hahmo_y < 0) {
hahmo_y = hahmo_y + hahmo_nopeus;
}
if (hahmo_y > 550) {
hahmo_y = hahmo_y - hahmo_nopeus;
}
  //Hahmon liikkuminen
  
  // W
if(w == true){
hahmo_y = hahmo_y - hahmo_nopeus;
hahmo = hahmo_yla;
}
if(w == true && a == true) {
hahmo_nopeus = hahmo_nopeus_2;
hahmo = hahmo_yla_vasen;
}
if(w == true && d == true) {
hahmo_nopeus = hahmo_nopeus_2;
hahmo = hahmo_yla_oikea;
}
  // A
if(a == true){
hahmo_x = hahmo_x - hahmo_nopeus;
hahmo = hahmo_vasen;
}
if(a == true && w == true ) {
hahmo_nopeus = hahmo_nopeus_2;
hahmo = hahmo_yla_vasen;
}
if(a == true && s == true ) {
hahmo_nopeus = hahmo_nopeus_2;
hahmo = hahmo_ala_vasen;
}
  // S
if(s == true){
hahmo_y = hahmo_y + hahmo_nopeus;
hahmo = hahmo_ala;
}
if(s == true && a == true ) {
hahmo_nopeus = hahmo_nopeus_2;
hahmo = hahmo_ala_vasen;
}
if(s == true && d == true ) {
hahmo_nopeus = hahmo_nopeus_2;
hahmo = hahmo_ala_oikea;
}
  // D
if(d == true){
hahmo_x = hahmo_x + hahmo_nopeus;
hahmo = hahmo_oikea;
}
if(d == true && s == true ) {
hahmo_nopeus = hahmo_nopeus_2;
hahmo = hahmo_ala_oikea;
}
if(d == true && w == true ) {
hahmo_nopeus = hahmo_nopeus_2;
hahmo = hahmo_yla_oikea;
}
  // Bugikorjaus liikkumiseen.
if(a == true && w == true && d == true) {
hahmo = hahmo_yla;
}
if(w == true && a == true && s == true) {
hahmo = hahmo_vasen;
}
if(a == true && s == true && d == true) {
hahmo = hahmo_ala;
}
if(s == true && d == true && w == true) {
hahmo = hahmo_oikea;
}

  //Testaa onko näppäin X painettuna
if (keyPressed) {
if (key == 'w' || key == 'W') {
w = true;
}
if (key == 'a' || key == 'A') {
a = true;
}
if (key == 's' || key == 'S') {
s = true;
}
if (key == 'd' || key == 'd') {
d = true;
}
}

}

void keyReleased() {
  
  //Jos näppäintä X ei paineta, lopettaa liikkumisen
if (key == 'w' || key == 'W') {
w = false;
}
if (key == 'a' || key == 'A') {
a = false;
}
if (key == 's' || key == 'S') {
s = false;
}
if (key == 'd' || key == 'D') {
d = false;
}
}


