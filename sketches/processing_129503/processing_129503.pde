
/* @pjs font = "Plaster-Regular.ttf"; */
/* @pjs font = "Raleway-Thin.ttf"; */

/*big: raleway heavy, bitter bold, berkshire swash, 
plaster one, plaster
little: raleway thin */

 
int x = 150;
int x1 = 210;
int x2 = 240;
int x3 = 190;
int x4 = 155;
int x5 = 200;
int x6 = 200;
int x7 = 165;
int x8 = 265;
int x9 = 100;
int x10 = 155;
int x11 = 180;
int x12 = 180;
int x13 = 160;
int x14 = 160;
int x15 = 163;
 
PFont plaster;
PFont rale;
 
PImage blossom;



 
 
void setup( ) {
 
size (470,535);
 


rale = createFont ("Raleway-Thin.ttf", 120);
textFont(rale);

plaster = createFont ("Plaster-Regular.ttf", 120);
textFont(plaster);

blossom = loadImage ("quadblossomtwo.png");

}
 
void draw( ) {
 
image (blossom, 0, -1);
 

fill (205, 120, 100);
textFont (rale, 19);
text ("In a Station of the Metro  (1913)", 185, 375);


fill (216, 208, 161);
textFont (rale, 11);
text("The apparition", 185, 420) ;
 
 
fill (216, 208, 161);
textFont (rale, 11);
text("of these faces", 280, 420) ;
 
fill (216, 208, 161);
textFont (rale, 11);
text("in the crowd  :", 380, 420);
 
 
fill (216, 208, 161);
textFont (rale, 11);
text("petals", 185, 450) ;
 
fill (216, 208, 161);
textFont (rale, 11);
text(" on a wet,", 235, 450) ;
 
fill (216, 208, 161);
textFont (rale, 11);
text ("black", 287, 450);
 
fill (216, 208, 161);
textFont (rale, 11);
text ("bough  .", 335, 450);
 
 
fill (199, 181, 45, 100);
textFont (plaster, 38);
text ("Ezra Pound", 185, 515);
 
 
//ellipses
 
fill(#FFFFDB);
noStroke ();
ellipse(x, 520, 10, 10);
x = x + 5;
if (x > 470) {
  x = 150;
}
 
 
fill(#FFFFDB);
noStroke ();
ellipse(x1, 525, 7, 7);
x1 = x1 + 4;
if (x1 > 470) {
  x1 = 210;
}
 
 
fill(#FFFFDB);
noStroke ();
ellipse(x2, 475, 10, 10);
x2 = x2 + 3;
if (x2 > 470) {
  x2 = 240;
}
 
fill(#FFFFDB);
noStroke ();
ellipse(x3, 530, 7, 7);
x3 = x3 + 2;
if (x3 > 470) {
  x3 = 190;
}
 
fill (#BEBF27);
noStroke ();
ellipse(x4, 530, 7, 7);
x4 = x4 + 4;
if (x4 > 470) {
  x4 = 155;
}
 
fill (#BEBF27);
noStroke ();
ellipse (x5, 520, 8, 8);
x5 = x5 + 6;
if (x5 > 470) {
  x5 = 200;
}
     
 
fill (#BEBF27);
noStroke ();
ellipse(x6, 530, 8, 8);
x6 = x6 + 5;
if (x6 > 470) {
  x6 = 200;
}
 
fill (#5A5A0F);
noStroke ();
ellipse(x7, 525, 8, 8);
x7 = x7 + 2;
if (x7 > 470) {
  x7 = 365;
}
 
 
fill(#ffffff);
rect(x8, 525, 7, 5);
x8 = x8 + 3;
if (x8 > 470) {
  x8 = 365;
}
 
 
fill (#5A5A0F);
rect (x9, 515, 8, 4);
x9 = x9 + 3;
if (x9 > 470) {
  x9 = 300;
}
 
fill (#5A5A0F);
rect (x10, 520, 7, 5);
x10 = x10 + 3;
if (x10 > 470) {
  x10 = 355;
}
 
fill (#5A5A0F);
rect (x11, 520, 7, 7);
x11 = x11 + 5;
if (x11 > 470) {
  x11 = 280;
}
 
fill (#BEBF27);
rect (x12, 520, 7, 4);
x12 = x12 + 5;
if (x12 > 470) {
  x12 = 280;
}
 
fill (#BEBF27);
rect (x13, 527, 7, 4);
x13 = x13 + 5;
if (x13 > 470) {
  x13 = 260;
}
 
fill (#FFFFFF);
rect (x14, 517, 7, 5);
x14 = x14 + 4;
if (x14 > 470) {
  x14 = 260;
}
 
fill (#ffffff);
rect (x15, 520, 7,4);
x15 = x15 + 4;
if (x15 > 470) {
  x15 = 263;
}
 
}



