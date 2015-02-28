

int odst;
int zero=-110;
float suwak=50;
float x_ikon;
float y_ikon;
int k_2010;
int k_2000;
int k_1990;
int k_1980;
int k_1970;
int k_1961;

//Porównanie populacji 
////lata 1961,70,80,90,2000,2010,
void setup(){
size(650,700);


}

////ikony
void ikony()
{
  PImage img;
tint(211,204,66);
img = loadImage("user_group.png");
image(img, 415, 200+(odst*150),2*x_ikon,2*y_ikon);////*a[i],2*a[i]

PFont font;
textSize(18);
text ("0-14 lat", 550,220);
text ("15-64 lat", 550, 400);
text ("65+ lat", 550, 510);///podpisy przy ikonach
}

////suwak 
void linia_czasu() {
fill(247,48,17);
smooth();
stroke(10);
background(255,255,255);

PFont font;
font = loadFont("ArialMT-48.vlw");
fill(0);
textSize(15);
text ("Populacja Polski w latach 1961-2010", 85 , 40);
textSize(12);
text ("Według Danych Banku Światowego", 100 , 65);
textSize(15);
text ("Przygotował", 490 ,670);
text ("Radosław Bomba", 480 ,685);
textSize(10);


if (mouseX>=50 && mouseX<=300 && mouseButton == LEFT && mousePressed)
{
suwak=mouseX;}
fill(0+k_1961+k_1970+k_1980+k_1990+k_2000+k_2010,0,0);
ellipse(suwak,640,20,20);

if (suwak>=40 && suwak<=60){
textSize(50);
k_1961=255;
fill(0) ;
text ("1961", 390 , 100);

}else{k_1961=0;}

if (suwak>=90 && suwak<=110){
textSize(50);
fill(0) ;
k_1970=255;
text ("1970", 390 , 100);
}else{k_1970=0;}

 if (suwak>=140 && suwak<=160){
textSize(50);
k_1980=255;
fill(0) ;
text ("1980", 390 , 100);
}else{k_1980=0;}


if (suwak>=190 && suwak<=210){
textSize(50);
k_1990=255;
fill(0) ;
text ("1990", 390 , 100);
}else{k_1990=0;}



 if (suwak>=240 && suwak<=260){
textSize(50);
k_2000=255;
fill(0) ;
text ("2000", 390 , 100);
}else{k_2000=0;}

if (suwak>=290 && suwak<=310){
textSize(50);
k_2010=255;
fill(0,0,0) ;
text ("2010", 390 , 100);
}else{k_2010=0;}


  for (int i=50;i<=300;i+=50){
  line(i,630,i,650);
  
textSize(17);
fill(0) ;
fill(0+k_1961,0,0);
text ("1961", 25 ,620);
fill(0+k_1970,0,0);
text ("1970", 75 ,620);
fill(0+k_1980,0,0);
text ("1980", 125 ,620);
fill(0+k_1990,0,0);
text ("1990", 175 ,620);
fill(0+k_2000,0,0);
text ("2000", 225 ,620);
fill(0+k_2010,0,0);
text ("2010", 275 ,620);
  
}
line(50,640,300,640);
}

//////////Podziałka do słupków

void skala(){
  for ( int i =50; i <= 550; i+=50) { 
line(50,i, 40,i);
line(45,50, 45,550);
if (i>=50 && i<=550){

textSize(10);
zero=zero+10;
text (-zero+"%", 20 ,i);
textSize(12);
text ("0-14 lat", 80 ,570);
text ("15-64 lat", 150 ,570);
text ("65+ lat", 230 ,570);////podpisy pod podziałką słupków
if (zero==0){
zero=-110;}
}




for (int z=110; z<=600; z+=190){
line(300,z, 600,z);

}///linijki do ikon

}
}





//////1961
void dane_1961(){
  if (suwak>=40 && suwak<=60)
{
String[] dane = loadStrings( "1populacja.csv" );//wczytuje dane

float[] a = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( ";" );
  a[i] = float( cols[0] );
 
fill (247,0,0);
rect (100+ (i*70), 550, 30, -5* a[i]);///rect(x, y, w, h);-prostokąt

x_ikon=a[i];
y_ikon=a[i];
odst=i;
ikony();

text (a[i]+"%", 320 ,220+(i*120)+50);///procent przy ikonach



}


}
}
///////1970
//////////////////////////////
/////////////////////////////
void dane_1970(){
  if (suwak>=90 && suwak<=110)
{
String[] dane = loadStrings( "1populacja.csv" );//wczytuje dane

float[] b = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( ";" );
  b[i] = float( cols[1] );
 
fill (247,0,0);
rect (100+ (i*70), 550, 30, -5* b[i]);///rect(x, y, w, h);-prostokąt

x_ikon=b[i];
y_ikon=b[i];
odst=i;
ikony();


text (b[i]+"%", 320 ,220+(i*120)+50);///procent przy ikonach



}
}
}


///////1980
//////////////////////////////
/////////////////////////////
void dane_1980(){
  if (suwak>=140 && suwak<=160)
{
String[] dane = loadStrings( "1populacja.csv" );//wczytuje dane

float[] c = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( ";" );
  c[i] = float( cols[2] );
 
fill (247,0,0);
rect (100+ (i*70), 550, 30, -5* c[i]);///rect(x, y, w, h);-prostokąt

x_ikon=c[i];
y_ikon=c[i];
odst=i;
ikony();


text (c[i]+"%", 320 ,220+(i*120)+50);///procent przy ikonach



}
}
}
///////1990
//////////////////////////////
/////////////////////////////
void dane_1990(){
  if (suwak>=190 && suwak<=210)
{
String[] dane = loadStrings( "1populacja.csv" );//wczytuje dane

float[] d = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( ";" );
  d[i] = float( cols[3] );
 
fill (247,0,0);
rect (100+ (i*70), 550, 30, -5* d[i]);///rect(x, y, w, h);-prostokąt


x_ikon=d[i];
y_ikon=d[i];
odst=i;
ikony();

text (d[i]+"%", 320 ,220+(i*120)+50);///procent przy ikonach




}
}
}

///////2000
//////////////////////////////
/////////////////////////////
void dane_2000(){
  if (suwak>=240 && suwak<=260)
{
String[] dane = loadStrings( "1populacja.csv" );//wczytuje dane

float[] e = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( ";" );
  e[i] = float( cols[4] );
 
fill (247,0,0);
rect (100+ (i*70), 550, 30, -5* e[i]);///rect(x, y, w, h);-prostokąt

x_ikon=e[i];
y_ikon=e[i];
odst=i;
ikony();


text (e[i]+"%", 320 ,220+(i*120)+50);///procent przy ikonach


}
}
}

///////2010
//////////////////////////////
/////////////////////////////
void dane_2010(){
  if (suwak>=290 && suwak<=310)
{
  String[] dane = loadStrings( "1populacja.csv" );//wczytuje dane

float[] f = new float[ dane.length ];//

for ( int i = 0; i < dane.length; i +=1) {///normalizuje wartości, rozbija listę na małe kawałki,
  String[] cols = dane[i].split( ";" );
  f[i] = float( cols[5] );
 
fill (247,0,0);
rect (100+ (i*70), 550, 30, -5* f[i]);///rect(x, y, w, h);-prostokąt

x_ikon=f[i];
y_ikon=f[i];
odst=i;
ikony();

text (f[i]+"%", 320 ,220+(i*120)+50);///procent przy ikonach



}
}
}

void draw(){

linia_czasu();
skala();

dane_1961();
dane_1970();
dane_1980();
dane_1990();
dane_2000();
dane_2010();

}

