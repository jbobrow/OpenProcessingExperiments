
void setup()
{
  
size(400,600);

}

void draw()
{
noStroke();
//couleurforme et couleurfond sont les variables corrrespondant aux couleurs de la forme(que l'on doit voir) et pour l'autre la couleur du fond.
int couleurforme;
couleurforme =30;
int couleurfond;
couleurfond = 255-couleurforme;

background(couleurfond);
fill(couleurforme);

//formatl et FormatL sont les variables corrrespondant au format du sketch
int formatL;
formatL = 800;
int formatl;
formatl = 1200;

//diametrel et diametreL sont les diamètre de chaque arc en longueur et largeur.
int diametrel;
diametrel = 40;
int diametreL;
diametreL = 40;

//strokeweiht est la variable pour l'épaisseur des traits
int strokeweight;
strokeweight = 4;

//1e ligne
//unarcx et unarcy sont les variables des coordonnées x et y des formes de la première ligne
//forme 1 en haut à gauche
int unarcx;
unarcx = 40;
int unarcy;
unarcy = 40;

arc(unarcx,unarcy,diametrel,diametreL,PI,PI/2+PI);
arc(unarcx,unarcy,diametrel,diametreL,PI/2,PI);
arc(unarcx+20,unarcy,diametrel,diametreL,PI,PI/2+PI);
arc(unarcx,unarcy,diametrel,diametreL,0,PI/2);

//forme2
arc(unarcx*2.5,unarcy,diametrel,diametreL,PI,PI/2+PI);
arc(unarcx*2,unarcy,diametrel,diametreL,0,PI/2);
arc(unarcx*3,unarcy/2,diametrel,diametreL,PI/2,PI);
arc(unarcx*3,unarcy*1.5,diametrel,diametreL,PI,PI/2+PI);
//forme3
arc(unarcx*4,unarcy,diametrel,diametreL,PI,PI/2+PI);
arc(unarcx*3.5,unarcy,diametrel,diametreL,0,PI/2);
arc(unarcx*4.5,unarcy,diametrel,diametreL,PI,PI/2+PI);
arc(unarcx*4.5,unarcy,diametrel,diametreL,PI/2,PI);
//forme4
arc(unarcx*5.5,unarcy,diametrel,diametreL,PI,PI/2+PI);
arc(unarcx*5,unarcy,diametrel,diametreL,0,PI/2);
arc(unarcx*6,unarcy,diametrel,diametreL,PI,PI/2+PI);
arc(unarcx*5.5,unarcy,diametrel,diametreL,0,PI/2);
//forme5
arc(unarcx*7,unarcy,diametrel,diametreL,PI,PI/2+PI);
arc(unarcx*7,unarcy*1.5,diametrel,diametreL,PI,PI/2+PI);
arc(unarcx*7,unarcy/2,diametrel,diametreL,0,PI/2);
arc(unarcx*7.5,unarcy,diametrel,diametreL,PI/2,PI);
//forme6
arc(unarcx*8.5,unarcy,diametrel,diametreL,PI,PI/2+PI);
arc(unarcx*8.5,unarcy*1.5,diametrel,diametreL,PI,PI/2+PI);
arc(unarcx*9,unarcy,diametrel,diametreL,PI,PI/2+PI);
arc(unarcx*9,unarcy,diametrel,diametreL,PI/2,PI);

//bloc autour des formes 1,2,3,4,5,6
//ces blocs permettent d'obtenir la contre forme des formes de la ligne 2
//Fondunx et fonduny représentent les blocs qui entourent les formes de la première ligne
fill(couleurforme);
int fondunx;
fondunx = 10;
int fonduny;
fonduny = 20;
rect(fondunx*0,fonduny*0,formatL,diametrel/2);
rect(fondunx*0,fonduny*0,diametreL/2,diametrel*1.5);
rect(fondunx*0,fonduny*3,formatL,diametrel/2);
rect(fondunx*6,fonduny,diametreL/2,diametrel);
rect(fondunx*12,fonduny,diametreL/2,diametrel*1.5);
rect(fondunx*18,fonduny,diametreL/2,diametrel*1.5);
rect(fondunx*24,fonduny,diametreL/2,diametrel);
rect(fondunx*30,fonduny,diametreL/2,diametrel);
rect(fondunx*36,fonduny,diametreL,diametrel);

//2e ligne
//deuxarcx et deuxarcy sont les variables des coordonnées x et y des formes de la deuxième ligne
int deuxarcx;
deuxarcx = 40;
int deuxarcy;
deuxarcy = 40;
//forme 1
arc(deuxarcx,deuxarcy*3,diametrel,diametreL,PI,PI/2+PI);
arc(deuxarcx,deuxarcy*3,diametrel,diametreL,PI/2,PI);
arc(deuxarcx*1.5,deuxarcy*3,diametrel,diametreL,PI,PI/2+PI);
arc(deuxarcx,deuxarcy*3,diametrel,diametreL,0,PI/2);
//forme 2
arc(deuxarcx*2.5,deuxarcy*3,diametrel,diametreL,PI,PI/2+PI);
arc(deuxarcx*2,deuxarcy*3,diametrel,diametreL,0,PI/2);
arc(deuxarcx*3,deuxarcy*2.5,diametrel,diametreL,PI/2,PI);
arc(deuxarcx*3,deuxarcy*3.5,diametrel,diametreL,PI,PI/2+PI);
//forme3
arc(deuxarcx*4,deuxarcy*3,diametrel,diametreL,PI,PI/2+PI);
arc(deuxarcx*3.5,deuxarcy*3,diametrel,diametreL,0,PI/2);
arc(deuxarcx*4.5,deuxarcy*3,diametrel,diametreL,PI,PI/2+PI);
arc(deuxarcx*4.5,deuxarcy*3,diametrel,diametreL,PI/2,PI);
//forme4
arc(deuxarcx*5.5,deuxarcy*3,diametrel,diametreL,PI,PI/2+PI);
arc(deuxarcx*5,deuxarcy*3,diametrel,diametreL,0,PI/2);
arc(deuxarcx*6,deuxarcy*3,diametrel,diametreL,PI,PI/2+PI);
arc(deuxarcx*5.5,deuxarcy*3,diametrel,diametreL,0,PI/2);
//forme5
arc(deuxarcx*7,deuxarcy*3,diametrel,diametreL,PI,PI/2+PI);
arc(deuxarcx*7,deuxarcy*3.5,diametrel,diametreL,PI,PI/2+PI);
arc(deuxarcx*7,deuxarcy*2.5,diametrel,diametreL,0,PI/2);
arc(deuxarcx*7.5,deuxarcy*3,diametrel,diametreL,PI/2,PI);
//forme6
arc(deuxarcx*8.5,deuxarcy*3,diametrel,diametreL,PI,PI/2+PI);
arc(deuxarcx*8.5,deuxarcy*3.5,diametrel,diametreL,PI,PI/2+PI);
arc(deuxarcx*9,deuxarcy*3,diametrel,diametreL,PI,PI/2+PI);
arc(deuxarcx*9,deuxarcy*3,diametrel,diametreL,PI/2,PI);

//3e ligne
//troisarcx et troisarcy sont les variables des coordonnées x et y des formes de la troisième ligne
int troisarcx;
troisarcx = 40;
int troisarcy;
troisarcy = 40;
//forme 1 
stroke(couleurforme);
strokeCap(ROUND);
strokeWeight(strokeweight-2);
noFill();

arc(troisarcx,troisarcy*5,diametrel,diametreL,PI,PI/2+PI);
arc(troisarcx,troisarcy*5,diametrel,diametreL,PI/2,PI);
arc(troisarcx*1.5,troisarcy*5,diametrel,diametreL,PI,PI/2+PI);
arc(troisarcx,troisarcy*5,diametrel,diametreL,0,PI/2);

//forme 2
arc(troisarcx*2.5,troisarcy*5,diametrel,diametreL,PI,PI/2+PI);
arc(troisarcx*2,troisarcy*5,diametrel,diametreL,0,PI/2);
arc(troisarcx*3,troisarcy*4.5,diametrel,diametreL,PI/2,PI);
arc(troisarcx*3,troisarcy*5.5,diametrel,diametreL,PI,PI/2+PI);
//forme3
arc(troisarcx*4,troisarcy*5,diametrel,diametreL,PI,PI/2+PI);
arc(troisarcx*3.5,troisarcy*5,diametrel,diametreL,0,PI/2);
arc(troisarcx*4.5,troisarcy*5,diametrel,diametreL,PI,PI/2+PI);
arc(troisarcx*4.5,troisarcy*5,diametrel,diametreL,PI/2,PI);
//forme4
arc(troisarcx*5.5,troisarcy*5,diametrel,diametreL,PI,PI/2+PI);
arc(troisarcx*5,troisarcy*5,diametrel,diametreL,0,PI/2);
arc(troisarcx*6,troisarcy*5,diametrel,diametreL,PI,PI/2+PI);
arc(troisarcx*5.5,troisarcy*5,diametrel,diametreL,0,PI/2);
//forme5
arc(troisarcx*7,troisarcy*5,diametrel,diametreL,PI,PI/2+PI);
arc(troisarcx*7,troisarcy*5.5,diametrel,diametreL,PI,PI/2+PI);
arc(troisarcx*7,troisarcy*4.5,diametrel,diametreL,0,PI/2);
arc(troisarcx*7.5,troisarcy*5,diametrel,diametreL,PI/2,PI);
//forme6
beginShape();
arc(troisarcx*8.5,troisarcy*5,diametrel,diametreL,PI,PI/2+PI);
arc(troisarcx*8.5,troisarcy*5.5,diametrel,diametreL,PI,PI/2+PI);
arc(troisarcx*9,troisarcy*5,diametrel,diametreL,PI,PI/2+PI);
arc(troisarcx*9,troisarcy*5,diametrel,diametreL,PI/2,PI);
endShape(CLOSE);

//4e ligne
//quatrearcx et quatrearcy sont les variables des coordonnées x et y des formes de la quatrième ligne
int quatrearcx;
quatrearcx = 40;
int quatrearcy;
quatrearcy = 40;
//forme 1
stroke(couleurforme);
strokeCap(ROUND);
strokeWeight(strokeweight+3);
noFill();
arc(quatrearcx,quatrearcy*7,diametrel,diametreL,PI,PI/2+PI);
arc(quatrearcx,quatrearcy*7,diametrel,diametreL,PI/2,PI);
arc(quatrearcx*1.5,quatrearcy*7,diametrel,diametreL,PI,PI/2+PI);
arc(quatrearcx,quatrearcy*7,diametrel,diametreL,0,PI/2);
//forme 20
arc(quatrearcx*2.5,quatrearcy*7,diametrel,diametreL,PI,PI/2+PI);
arc(quatrearcx*2,quatrearcy*7,diametrel,diametreL,0,PI/2);
arc(quatrearcx*3,quatrearcy*6.5,diametrel,diametreL,PI/2,PI);
arc(quatrearcx*3,quatrearcy*7.5,diametrel,diametreL,PI,PI/2+PI);
//forme3
arc(quatrearcx*4,quatrearcy*7,diametrel,diametreL,PI,PI/2+PI);
arc(quatrearcx*3.5,quatrearcy*7,diametrel,diametreL,0,PI/2);
arc(quatrearcx*4.5,quatrearcy*7,diametrel,diametreL,PI,PI/2+PI);
arc(quatrearcx*4.5,quatrearcy*7,diametrel,diametreL,PI/2,PI);
//forme4
arc(quatrearcx*5.5,quatrearcy*7,diametrel,diametreL,PI,PI/2+PI);
arc(quatrearcx*5,quatrearcy*7,diametrel,diametreL,0,PI/2);
arc(quatrearcx*6,quatrearcy*7,diametrel,diametreL,PI,PI/2+PI);
arc(quatrearcx*5.5,quatrearcy*7,diametrel,diametreL,0,PI/2);
//forme5
arc(quatrearcx*7,quatrearcy*7,diametrel,diametreL,PI,PI/2+PI);
arc(quatrearcx*7,quatrearcy*7.5,diametrel,diametreL,PI,PI/2+PI);
arc(quatrearcx*7,quatrearcy*6.5,diametrel,diametreL,0,PI/2);
arc(quatrearcx*7.5,quatrearcy*7,diametrel,diametreL,PI/2,PI);
//forme6
arc(quatrearcx*8.5,quatrearcy*7,diametrel,diametreL,PI,PI/2+PI);
arc(quatrearcx*8.5,quatrearcy*7.5,diametrel,diametreL,PI,PI/2+PI);
arc(quatrearcx*9,quatrearcy*7,diametrel,diametreL,PI,PI/2+PI);
arc(quatrearcx*9,quatrearcy*7,diametrel,diametreL,PI/2,PI);

//5e ligne
//cinqarcx et cinqarcy sont les variables des coordonnées x et y des formes de la cinquième ligne
int cinqarcx;
cinqarcx = 40;
int cinqarcy;
cinqarcy = 40;
//forme 1
stroke(couleurforme);
strokeCap(PROJECT);
strokeWeight(strokeweight);
noFill();
arc(cinqarcx,cinqarcy*9,diametrel,diametreL,PI,PI/2+PI);
arc(cinqarcx,cinqarcy*9,diametrel,diametreL,PI/2,PI);
arc(cinqarcx*1.5,cinqarcy*9,diametrel,diametreL,PI,PI/2+PI);
arc(cinqarcx,cinqarcy*9,diametrel,diametreL,0,PI/2);
//forme 2
arc(cinqarcx*2.5,cinqarcy*9,diametrel,diametreL,PI,PI/2+PI);
arc(cinqarcx*2,cinqarcy*9,diametrel,diametreL,0,PI/2);
arc(cinqarcx*3,cinqarcy*8.5,diametrel,diametreL,PI/2,PI);
arc(cinqarcx*3,cinqarcy*9.5,diametrel,diametreL,PI,PI/2+PI);
//forme3
arc(cinqarcx*4,cinqarcy*9,diametrel,diametreL,PI,PI/2+PI);
arc(cinqarcx*3.5,cinqarcy*9,diametrel,diametreL,0,PI/2);
arc(cinqarcx*4.5,cinqarcy*9,diametrel,diametreL,PI,PI/2+PI);
arc(cinqarcx*4.5,cinqarcy*9,diametrel,diametreL,PI/2,PI);
//forme4
arc(cinqarcx*5.5,cinqarcy*9,diametrel,diametreL,PI,PI/2+PI);
arc(cinqarcx*5,cinqarcy*9,diametrel,diametreL,0,PI/2);
arc(cinqarcx*6,cinqarcy*9,diametrel,diametreL,PI,PI/2+PI);
arc(cinqarcx*5.5,cinqarcy*9,diametrel,diametreL,0,PI/2);
//forme5
arc(cinqarcx*7,cinqarcy*9,diametrel,diametreL,PI,PI/2+PI);
arc(cinqarcx*7,cinqarcy*9.5,diametrel,diametreL,PI,PI/2+PI);
arc(cinqarcx*7,cinqarcy*8.5,diametrel,diametreL,0,PI/2);
arc(cinqarcx*7.5,cinqarcy*9,diametrel,diametreL,PI/2,PI);
//forme6
arc(cinqarcx*8.5,cinqarcy*9,diametrel,diametreL,PI,PI/2+PI);
arc(cinqarcx*8.5,cinqarcy*9.5,diametrel,diametreL,PI,PI/2+PI);
arc(cinqarcx*9,cinqarcy*9,diametrel,diametreL,PI,PI/2+PI);
arc(cinqarcx*9,cinqarcy*9,diametrel,diametreL,PI/2,PI);

//6e ligne
//sixsarcx et sixsarcy sont les variables des coordonnées x et y des formes de la sixième ligne
int sixarcx;
sixarcx = 40;
int sixarcy;
sixarcy = 40;
//forme 1
stroke(couleurfond);
fill(couleurforme);
int fondsixrecx;
fondsixrecx = 10;
int fondsixrecy ;
fondsixrecy = 420;
//rectangle blanc qui intervient en dessous des arc noirs.
rect(fondsixrecx*0,fondsixrecy,formatL,diametreL);
strokeCap(PROJECT);
strokeWeight(strokeweight);
noFill();
arc(sixarcx,sixarcy*11,diametrel,diametreL,PI,PI/2+PI);
arc(sixarcx,sixarcy*11,diametrel,diametreL,PI/2,PI);
arc(sixarcx*1.5,sixarcy*11,diametrel,diametreL,PI,PI/2+PI);
arc(sixarcx,sixarcy*11,diametrel,diametreL,0,PI/2);
//forme 2
arc(sixarcx*2.5,sixarcy*11,diametrel,diametreL,PI,PI/2+PI);
arc(sixarcx*2,sixarcy*11,diametrel,diametreL,0,PI/2);
arc(sixarcx*3,sixarcy*10.5,diametrel,diametreL,PI/2,PI);
arc(sixarcx*3,sixarcy*11.5,diametrel,diametreL,PI,PI/2+PI);
//forme3
arc(sixarcx*4,sixarcy*11,diametrel,diametreL,PI,PI/2+PI);
arc(sixarcx*3.5,sixarcy*11,diametrel,diametreL,0,PI/2);
arc(sixarcx*4.5,sixarcy*11,diametrel,diametreL,PI,PI/2+PI);
arc(sixarcx*4.5,sixarcy*11,diametrel,diametreL,PI/2,PI);
//forme4
arc(sixarcx*5.5,sixarcy*11,diametrel,diametreL,PI,PI/2+PI);
arc(sixarcx*5,sixarcy*11,diametrel,diametreL,0,PI/2);
arc(sixarcx*6,sixarcy*11,diametrel,diametreL,PI,PI/2+PI);
arc(sixarcx*5.5,sixarcy*11,diametrel,diametreL,0,PI/2);
//forme5
arc(sixarcx*7,sixarcy*11,diametrel,diametreL,PI,PI/2+PI);
arc(sixarcx*7,sixarcy*11.5,diametrel,diametreL,PI,PI/2+PI);
arc(sixarcx*7,sixarcy*10.5,diametrel,diametreL,0,PI/2);
arc(sixarcx*7.5,sixarcy*11,diametrel,diametreL,PI/2,PI);
//forme6
arc(sixarcx*8.5,sixarcy*11,diametrel,diametreL,PI,PI/2+PI);
arc(sixarcx*8.5,sixarcy*11.5,diametrel,diametreL,PI,PI/2+PI);
arc(sixarcx*9,sixarcy*11,diametrel,diametreL,PI,PI/2+PI);
arc(sixarcx*9,sixarcy*11,diametrel,diametreL,PI/2,PI);


//ces blocs permettent d'obtenir la contre forme des formes de la ligne 5
//fondsixrecx et fondsixrecy représentent les blocs qui entourent les formes de la ligne 6+
noStroke();
fill(couleurfond);
rect(fondsixrecx*0,fondsixrecy,diametreL/2,diametrel);
rect(fondsixrecx*6,fondsixrecy,diametreL/2,diametrel);
rect(fondsixrecx*12,fondsixrecy,diametreL/2,diametrel);
rect(fondsixrecx*18,fondsixrecy,diametreL/2,diametrel);
rect(fondsixrecx*24,fondsixrecy,diametreL/2,diametrel);
rect(fondsixrecx*30,fondsixrecy,diametreL/2,diametrel);
rect(fondsixrecx*36,fondsixrecy,diametreL,diametrel);

//7e ligne
//septarcx et septsarcy sont les variables des coordonnées x et y des formes de la septième ligne
int septarcx;
septarcx = 40;
int septarcy;
septarcy = 40;
//forme 1
stroke(couleurfond);
fill(couleurforme);
int fondrecx;
fondrecx = 10;
int fondrecy;
fondrecy = 500;
//rectangle blanc qui intervient en dessous des arc noirs.
rect(fondrecx,fondrecy,formatL-10,diametrel);
strokeCap(PROJECT);
strokeWeight(strokeweight+9);
noFill();
arc(septarcx,septarcy*13,diametrel,diametreL,PI,PI/2+PI);
arc(septarcx,septarcy*13,diametrel,diametreL,PI/2,PI);
arc(septarcx*1.5,septarcy*13,diametrel,diametreL,PI,PI/2+PI);
arc(septarcx,septarcy*13,diametrel,diametreL,0,PI/2);
//forme 2
arc(septarcx*2.5,septarcy*13,diametrel,diametreL,PI,PI/2+PI);
arc(septarcx*2,septarcy*13,diametrel,diametreL,0,PI/2);
arc(septarcx*3,septarcy*13,diametrel,diametreL,PI/2,PI);
arc(septarcx*3,septarcy*13.5,diametrel,diametreL,PI,PI/2+PI);
//forme3
arc(septarcx*4,septarcy*13,diametrel,diametreL,PI,PI/2+PI);
arc(septarcx*3.5,septarcy*13,diametrel,diametreL,0,PI/2);
arc(septarcx*4.5,septarcy*13,diametrel,diametreL,PI,PI/2+PI);
arc(septarcx*4.5,septarcy*13,diametrel,diametreL,PI/2,PI);
//forme4
arc(septarcx*5.5,septarcy*13,diametrel,diametreL,PI,PI/2+PI);
arc(septarcx*5,septarcy*13,diametrel,diametreL,0,PI/2);
arc(septarcx*6,septarcy*13,diametrel,diametreL,PI,PI/2+PI);
arc(septarcx*5.5,septarcy*13,diametrel,diametreL,0,PI/2);
//forme5
arc(septarcx*7,septarcy*13,diametrel,diametreL,PI,PI/2+PI);
arc(septarcx*7,septarcy*13.5,diametrel,diametreL,PI,PI/2+PI);
arc(septarcx*7,septarcy*13,diametrel,diametreL,0,PI/2);
arc(septarcx*7.5,septarcy*13,diametrel,diametreL,PI/2,PI);
//forme6
arc(septarcx*8.5,septarcy*13,diametrel,diametreL,PI,PI/2+PI);
arc(septarcx*8.5,septarcy*13.5,diametrel,diametreL,PI,PI/2+PI);
arc(septarcx*9,septarcy*13,diametrel,diametreL,PI,PI/2+PI);
arc(septarcx*9,septarcy*13,diametrel,diametreL,PI/2,PI);
noStroke();
//fondrecx et fondrecy représentent les blocs qui entourent les formes de la ligne 7
fill(couleurfond);
rect(fondrecx*0,fondrecy,diametreL/2,diametrel);
rect(fondrecx*6,fondrecy,diametreL/2,diametrel);
rect(fondrecx*12,fondrecy,diametreL/2,diametrel);
rect(fondrecx*18,fondrecy,diametreL/2,diametrel);
rect(fondrecx*24,fondrecy,diametreL/2,diametrel);
rect(fondrecx*30,fondrecy,diametreL/2,diametrel);
rect(fondrecx*36,fondrecy,diametreL,diametrel);




}


