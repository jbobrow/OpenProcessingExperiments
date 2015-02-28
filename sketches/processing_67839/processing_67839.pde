
class Ball {
///Zmienne Globalne
float x;
float y;
int on1;
int on;
int maz;
int wielko;

///Konstruktor klasy
Ball(float _x, float _y, int _on1, int _on,int _maz, int _wielko){
  
  x=_x;
  y=_y;
  on1=_on1;
  on=_on;
  maz=_maz;
  wielko=_wielko;
}
///Funkcja
void run(){
    licz();
    ikony();



///FFFF.csv
//przemieść

}



void ikony(){
  
 



  
  
fill(0);
PFont font; 
textSize(20);
text("MALE",240,157);
text("FEMALE",510,157);
text("TOTAL",370,203);

fill(255,255,255);
textSize(20);
text("LIFE EXPECTANCY AT BIRTH IN EUROPEAN COUNTRIES",30,40);
textSize(10);
text("World Bank Data",30,55);
text("Made by Radoslaw BombA",650,20);
fill(0);

PImage img; 
tint(255);
img = loadImage("120px-Mars_symbol.svg.png");
image(img, 220, 160,80,80);

PImage ig; 
tint(255);
ig = loadImage("77px-Venus_symbol.svg.png");
image(ig, 500, 160,80,80);


PImage oni; 
tint(255);
oni = loadImage("toilets.png");
image(oni, 368, 200,70,70);




}


void licz(){


///załączanie zmiennej men female itp

 fill(255,255,255);
triangle(147, 135,404,135, 248,310);
triangle(248,310, 552,310, 404,135);
triangle(404,135, 653, 135, 552,310);
///plansza biała kraje
rect(50,530,700,150);


//font = loadFont("KodchiangUPC-48.vlw");



if ( mouseX>=160 && mouseX<=320 && mouseY>=135 && mouseY<=260 
&& mousePressed == true){
  on1=1;
}

if ( mouseX>=360 && mouseX<=450 && mouseY>=184 && mouseY<=308 
&& mousePressed == true){
  on1=2;
}

if ( mouseX>=483 && mouseX<=655 && mouseY>=135 && mouseY<=246 
&& mousePressed == true){
  on1=3;
}

if (on1==1)
{
  maz=3;
  fill (255,3,3);
triangle(147, 135,404,135, 248,310);
}


if (on1==2)
{
  maz=1;
  fill(255,3,3);
triangle(248,310, 552,310, 404,135);
}



if (on1==3)
{
  maz=2;
  fill(255,3,3);
triangle(404,135, 653, 135, 552,310);

}






if (mouseX>=89 && mouseX <=262 && mouseY>=538 && mouseY<=552 && 
mousePressed == true)
{
  on=2;
}

if (mouseX>=89 && mouseX <=262 && mouseY>=553 && mouseY<=562 && 
mousePressed == true)
{
  on=3;
}

if (mouseX>=89 && mouseX <=262 && mouseY>=568 && mouseY<=577 && 
mousePressed == true)
{
  on=4;
}


if (mouseX>=89 && mouseX <=262 && mouseY>=578 && mouseY<=587 && 
mousePressed == true)
{
  on=5;
}

if (mouseX>=89 && mouseX <=262 && mouseY>=588 && mouseY<=597 && 
mousePressed == true)
{
  on=6;
}

if (mouseX>=89 && mouseX <=262 && mouseY>=598 && mouseY<=607 && 
mousePressed == true)
{
  on=7;
}

if (mouseX>=89 && mouseX <=262 && mouseY>=608 && mouseY<=620 && 
mousePressed == true)
{
  on=8;
}


if (mouseX>=89 && mouseX <=262 && mouseY>=623 && mouseY<=634 && 
mousePressed == true)
{
  on=9;
}

if (mouseX>=89 && mouseX <=262 && mouseY>=635 && mouseY<=646 && 
mousePressed == true)
{
  on=10;
}

if (mouseX>=89 && mouseX <=262 && mouseY>=647 && mouseY<=658 && 
mousePressed == true)
{
  on=11;
}


if (mouseX>=278 && mouseX <=330 && mouseY>=538 && mouseY<=550 && 
mousePressed == true)
{
  on=12;
}

if (mouseX>=278 && mouseX <=330 && mouseY>=551 && mouseY<=563 && 
mousePressed == true)
{
  on=13;
}

if (mouseX>=278 && mouseX <=330 && mouseY>=564 && mouseY<=576 && 
mousePressed == true)
{
  on=14;
}


if (mouseX>=278 && mouseX <=330 && mouseY>=577 && mouseY<=589 && 
mousePressed == true)
{
  on=15;
}

if (mouseX>=278 && mouseX <=330 && mouseY>=589 && mouseY<=601 && 
mousePressed == true)
{
  on=16;
}

if (mouseX>=278 && mouseX <=330 && mouseY>=602 && mouseY<=611 && 
mousePressed == true)
{
  on=17;
}


if (mouseX>=278 && mouseX <=330 && mouseY>=612 && mouseY<=622 && 
mousePressed == true)
{
  on=18;
}

if (mouseX>=278 && mouseX <=330 && mouseY>=623 && mouseY<=635 && 
mousePressed == true)
{
  on=19;
}


if (mouseX>=278 && mouseX <=330 && mouseY>=636 && mouseY<=649 && 
mousePressed == true)
{
  on=20;
}

if (mouseX>=278 && mouseX <=366 && mouseY>=650 && mouseY<=667 && 
mousePressed == true)
{
  on=21;
}


if (mouseX>=448 && mouseX <=590 && mouseY>=539 && mouseY<=550 && 
mousePressed == true)
{
  on=22;
}

if (mouseX>=448 && mouseX <=590 && mouseY>=551 && mouseY<=562 && 
mousePressed == true)
{
  on=23;
}

if (mouseX>=448 && mouseX <=590 && mouseY>=563 && mouseY<=574 && 
mousePressed == true)
{
  on=24;
}

if (mouseX>=448 && mouseX <=590 && mouseY>=575 && mouseY<=586 && 
mousePressed == true)
{
  on=25;
}

if (mouseX>=448 && mouseX <=590 && mouseY>=587 && mouseY<=598 && 
mousePressed == true)
{
  on=26;
}


if (mouseX>=448 && mouseX <=590 && mouseY>=599 && mouseY<=610 && 
mousePressed == true)
{
  on=27;
}

if (mouseX>=448 && mouseX <=590 && mouseY>=611 && mouseY<=622 && 
mousePressed == true)
{
  on=28;
}


if (mouseX>=448 && mouseX <=590 && mouseY>=623 && mouseY<=634 && 
mousePressed == true)
{
  on=29;
}

if (mouseX>=448 && mouseX <=590 && mouseY>=635 && mouseY<=646 && 
mousePressed == true)
{
  on=30;
}

if (mouseX>=448 && mouseX <=590 && mouseY>=647 && mouseY<=658 && 
mousePressed == true)
{
  on=31;
}


if (mouseX>=620 && mouseX <=750 && mouseY>=538 && mouseY<=551 && 
mousePressed == true)
{
  on=32;
}


if (mouseX>=620 && mouseX <=750 && mouseY>=552 && mouseY<=563 && 
mousePressed == true)
{
  on=33;
}


if (mouseX>=620 && mouseX <=750 && mouseY>=564 && mouseY<=575 && 
mousePressed == true)
{
  on=34;
}

if (mouseX>=620 && mouseX <=750 && mouseY>=576 && mouseY<=587 && 
mousePressed == true)
{
  on=35;
}

if (mouseX>=620 && mouseX <=750 && mouseY>=588 && mouseY<=599 && 
mousePressed == true)
{
  on=36;
}

if (mouseX>=620 && mouseX <=750 && mouseY>=600 && mouseY<=611 && 
mousePressed == true)
{
  on=37;
}

if (mouseX>=620 && mouseX <=750 && mouseY>=612 && mouseY<=623 && 
mousePressed == true)
{
  on=38;
}

if (mouseX>=620 && mouseX <=750 && mouseY>=624 && mouseY<=635 && 
mousePressed == true)
{
  on=39;
}

if (mouseX>=620 && mouseX <=750 && mouseY>=636 && mouseY<=647 && 
mousePressed == true)
{
  on=40;
}

if (mouseX>=620 && mouseX <=750 && mouseY>=648 && mouseY<=659 && 
mousePressed == true)
{
  on=41;
}


///albania
if (on==2){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Albania1.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (88,538, wielko,15);

PFont font; 
fill(255,255,255);
textSize(35);
text("ALBANIA",315,470);
}



////Austraia
if (on==3){
  
  
  noStroke();
String[] dane = loadStrings( "Austria.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  rect (x+(i*10),y, 8, -a[i]*1.5);
    
    
     
}

rect (88,550, wielko,15);

PFont font; 
fill(255,255,255);
textSize(35);
text("AUSTRIA",315,470);



}



////Bialorus


if (on==4){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Bialorus.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (88,562,wielko,15);

PFont font; 
fill(255,255,255);
textSize(35);
text("BELARUS",315,470);
}


////Belgia
if (on==5){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Belgia.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (88,574, wielko,15);

PFont font; 
fill(255,255,255);
textSize(35);
text("BELGIUM",315,470);
}

///Bośnia i Hercegowina

if (on==6){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Bosniaihercegowina.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (88,586, wielko,15);

PFont font; 
fill(255,255,255);
textSize(35);
text("BOSNIA AND HERZEGOVINA",170,470);
}



///Bulgaria

if (on==7){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Bulgaria.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (88,598, wielko,15);

PFont font; 
fill(255,255,255);
textSize(35);
text("BULGARIA",315,470);
}


///Croatia

if (on==8){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "croatia.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (88,610, wielko,15);

PFont font; 
fill(255,255,255);
textSize(35);
text("CROATIA",315,470);
}

///Czech republic

if (on==9){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Czechy.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (88,622, wielko,15);

PFont font; 
fill(255,255,255);
textSize(35);
text("CZECH REPUBLIC",270,470);
}

///Denmark

if (on==10){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "dania.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (88,634, wielko,12);

PFont font; 
fill(255,255,255);
textSize(35);
text("DENMARK",315,470);
}

///estonia
if (on==11){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Estonia.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (88,646, wielko,14);

PFont font; 
fill(255,255,255);
textSize(35);
text("ESTONIA",315,470);
}

///Finlandia

if (on==12){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Finlandia.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (279,536,wielko,14);

PFont font; 
fill(255,255,255);
textSize(35);
text("FINLAND",315,470);
}


///Farancja
if (on==13){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Francja.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (279,550,wielko,14);

PFont font; 
fill(255,255,255);
textSize(35);
text("FRANCE",315,470);
}

///Niemcy

if (on==14){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Germany.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (279,562,wielko,14);

PFont font; 
fill(255,255,255);
textSize(35);
text("GERMANY",315,470);
}


//Greece

///Niemcy

if (on==15){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Greece.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (279,574,wielko,14);

PFont font; 
fill(255,255,255);
textSize(35);
text("GREECE",315,470);
}

///Węgry

if (on==16){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Hungary.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (279,586,wielko,14);

PFont font; 
fill(255,255,255);
textSize(35);
text("HUNGARY",315,470);
}


///Iceland

if (on==17){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "IcelandL.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (279,598,wielko,14);

PFont font; 
fill(255,255,255);
textSize(35);
text("Iceland",315,470);
}


///Włochy
if (on==18){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Italy.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (279,610,wielko,14);

PFont font; 
fill(255,255,255);
textSize(35);
text("ITALY",315,470);
}

///Łotwa

if (on==19){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Latvia.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (279,622,wielko,14);

PFont font; 
fill(255,255,255);
textSize(35);
text("LATVIA",315,470);
}


//Litwa
if (on==20){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Lithuania.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (279,634,wielko,14);

PFont font; 
fill(255,255,255);
textSize(35);
text("LITHUANIA",315,470);
}


//Luxemburg
if (on==21){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Luxemburg.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (279,646,wielko,14);

PFont font; 
fill(255,255,255);
textSize(35);
text("LUXEMBOURG",315,470);
}
//Macedonia
if (on==22){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Macedonia.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (450,538,wielko,14);

PFont font; 
fill(255,255,255);
textSize(35);
text("MACEDONIA",315,470);
}



///Malta

if (on==23){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Malta.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (450,550,wielko,14);

PFont font; 
fill(255,255,255);
textSize(35);
text("MALTA",315,470);
}

///MOLDOVA

if (on==24){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Moldova.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (450,562,wielko,14);

PFont font; 
fill(255,255,255);
textSize(35);
text("MOLDOVA",315,470);
}


///MONTENEGRO

if (on==25){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "montenegro.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (450,574,wielko,14);

PFont font; 
fill(255,255,255);
textSize(35);
text("MONTENEGRO",315,470);
}


///NETHERLANDS

if (on==26){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Niderlandy.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (450,586,wielko,14);

PFont font; 
fill(255,255,255);
textSize(35);
text("NETHERLANDS",315,470);
}

///NORWAY

if (on==27){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Norway.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (450,598,wielko,14);

PFont font; 
fill(255,255,255);
textSize(35);
text("NORWAY",315,470);
}

///POLAND

if (on==28){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Polska.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (450,610,wielko,14);

PFont font; 
fill(255,255,255);
textSize(35);
text("POLAND",315,470);
}


///PORTUGAL

if (on==29){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Portugal.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (450,622,wielko,14);

PFont font; 
fill(255,255,255);
textSize(35);
text("PORTUGAL",315,470);
}

///IRELAND

if (on==30){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Irlandia.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (450,634,wielko,14);

PFont font; 
fill(255,255,255);
textSize(35);
text("REPUBLIC OF IRELAND",240,470);
}

///ROMANIA

if (on==31){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Romania.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (450,646,wielko,14);

PFont font; 
fill(255,255,255);
textSize(35);
text("ROMANIA",315,470);
}

///RUSSIA

if (on==32){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Russia.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (619,538, 130,15);

PFont font; 
fill(255,255,255);
textSize(35);
text("RUSSIA",315,470);
}

///San Marino

if (on==33){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "San Marino.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (619,550, 130,15);

PFont font; 
fill(255,255,255);
textSize(35);
text("SAN MARINO",315,450);
textSize(20);
text("(lack of data)",365,470);
}

///SERBIA
if (on==34){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Serbia.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (619,562, 130,15);

PFont font; 
fill(255,255,255);
textSize(35);
text("SERBIA",320,450);
textSize(20);
text("(lack of data)",315,470);
}


///SLOVAKIA
if (on==35){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Slovak Republic.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (619,574, 130,15);

PFont font; 
fill(255,255,255);
textSize(35);
text("SLOVAKIA",315,470);
}

///SLOVENIA
if (on==36){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Slovenia.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (619,586, 130,15);

PFont font; 
fill(255,255,255);
textSize(35);
text("SLOVENIA",315,470);
}


///Spain
if (on==37){
 
   
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Spain.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (619,598, 130,15);

PFont font; 
fill(255,255,255);
textSize(35);
text("SPAIN",315,470);
}


///Sweden

if (on==38){
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Sweden.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (619,610, 130,15);

PFont font; 
fill(255,255,255);
textSize(35);
text("SWEDEN",315,470);
}

///Switzerland

if (on==39){
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Switzerland.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (619,622, 130,15);

PFont font; 
fill(255,255,255);
textSize(35);
text("SWITZERLAND",315,470);
}

///UKRAINE

if (on==40){
 
 
   noStroke(); 
  
String[] dane = loadStrings( "Ukraine.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (619,634, 130,15);

PFont font; 
fill(255,255,255);
textSize(35);
text("UKRAINE",315,470);
}

///UNITED KINGDOM
if (on==41){
 
 
   noStroke(); 
  
String[] dane = loadStrings( "UK.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( "," );//

a[i] = float( cols[maz] );
 

  
  rect (x+(i*10),y, 8, -a[i]*1.5);
   
   
 
}
rect (619,646, 130,15);

PFont font; 
fill(255,255,255);
textSize(35);
text("UNITED KINGDOM",265,470);
}

  ///data\total\female\male value.substring(0,5)
  

 

}
  
 

///kształty przełącznik płeć




}





