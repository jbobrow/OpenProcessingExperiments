
//Ajan yksiköt
int sadasosat = 0;
int sadasosaMax = 100;
int sekunnit = 0;
int sekunttiMax = 60;
int minuutit = 0;
int minuuttiMax = 60;
int tunnit = 0;
int tuntiMax = 24;
int paivat = 0;
int paivaMax = 7;
int viikot = 0;
int viikkoMax = 4;
int kuukausi = 0;
int kuukausiMax = 12;
int vuodet = 0;
int plus = 1;

//Laskurin käyttö
boolean aika = false;
boolean napit = true;

void setup ()  {
  size (190,140);
}
void draw () {
sadasosat = sadasosat + plus;
if (sadasosat == sadasosaMax) {
sekunnit = sekunnit + plus;
sadasosat = 0;
if (sekunnit == sekunttiMax) {
minuutit = minuutit + plus;
sekunnit = 0;
}
if (minuutit == minuuttiMax) {
tunnit = tunnit + plus;
minuutit = 0;
}
if (tunnit == tuntiMax) {
paivat = paivat + plus;
tunnit = 0;
}
if (paivat == paivaMax) {
viikot = viikot + plus;
paivat = 0;
}
if (viikot == viikkoMax) {
kuukausi = kuukausi + plus;
viikot = 0;
}
if (kuukausi == kuukausiMax) {
vuodet = vuodet + plus;
kuukausi = 0;
}
}
if (aika == true) {
rect (0,0,500,500);
fill (160,0,160);
text ("Hundredths of seconds: " + sadasosat,20,20);
text ("Seconds: " + sekunnit,20,35);
text ("Minutes: " + minuutit,20,50);
text ("Hours: " + tunnit,20,65);
text ("Days: " + paivat,20,80);
text ("Weeks: " + viikot,20,95);
text ("Months: " + kuukausi,20,110);
text ("Years: " + vuodet,20,125);
fill (200,200,200);
}
if (aika == false && napit == true) {
rect (0,0,500,500);
fill (160,0,160);
text("Press S to start the",10,20);
text("counter.",10,35);
}
fill (200,200,200);
}

void keyPressed () {
if (key == 's' || key == 'S') {
aika = true;
napit = false;
}
}


