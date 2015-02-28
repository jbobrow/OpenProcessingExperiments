
/* @jps font = "Oxygen-Regular.ttf"; */
/* @jps font = "PatuaOne-Regular.ttf"; */

int x = 350;
int x1 = 310;
int x2 = 340;
int x3 = 290;
int x4 = 255;
int x5 = 300;
int x6 = 400;
int x7 = 365;
int x8 = 365;
int x9 = 300;
int x10 = 355;
int x11 = 280;
int x12 = 280;
int x13 = 260;
int x14 = 260;
int x15 = 263;



PImage blossom;



void setup( ) {

size (575,600);

blossom = loadImage ("quadblossom.jpg");

}

void draw( ) {

image (blossom, 0, 0);


PFont oxy;
oxy = createFont ("Oxygen-Regular.ttf");

PFont patty;
patty = createFont ("PatuaOne-Regular.ttf");

fill (#FFFFFF);
textFont (patty, 50);
text("The apparation", 75, 100) ;


fill (#FFFFFF);
textFont (oxy, 30);
text("of these faces", 200, 165) ;

fill (#FFFFFF);
textFont (oxy, 30);
text("in the crowd;", 350, 215);


fill (#F5A8A8);
textFont (patty, 60);
text("petals", 300, 300) ;

fill (#FFFFFF);
textFont (oxy, 30);
text(" on a wet,", 300,375) ;

fill (#ffffff);
textFont (oxy, 27);
text ("black", 375, 415);

fill (#ffffff);
textFont (oxy, 25);
text ("bough.", 420, 450);

fill (100);
textFont (oxy, 16);
text ("In a Station of the Metro  --", 22, 14);

fill (75);
textFont (oxy, 16);
text ("Ezra Pound", 210, 14);


//ellipses

fill(#FFFFDB);
noStroke ();
ellipse(x, 510, 10, 10);
x = x + 10;
if (x > 540) {
  x = 350;
}


fill(#FFFFDB);
noStroke ();
ellipse(x1, 525, 7, 7);
x1 = x1 + 10;
if (x1 > 540) {
  x1 = 310;
}


fill(#FFFFDB);
noStroke ();
ellipse(x2, 550, 10, 10);
x2 = x2 + 10;
if (x2 > 540) {
  x2 = 340;
}

fill(#FFFFDB);
noStroke ();
ellipse(x3, 535, 7, 7);
x3 = x3 + 10;
if (x3 > 540) {
  x3 = 290;
}

fill (#BEBF27);
noStroke ();
ellipse(x4, 530, 7, 7);
x4 = x4 +15;
if (x4 > 540) {
  x4 = 255;
}

fill (#BEBF27);
noStroke ();
ellipse (x5, 550, 8, 8);
x5 = x5 + 15;
if (x5 > 540) {
  x5 = 300;
}
    

fill (#BEBF27);
noStroke ();
ellipse(x6, 545, 8, 8);
x6 = x6 + 15;
if (x6 > 540) {
  x6 = 400;
}

fill (#5A5A0F);
noStroke ();
ellipse(x7, 525, 8, 8);
x7 = x7 + 15;
if (x7 > 540) {
  x7 = 365;
}


fill(#ffffff);
rect(x8, 550, 7, 5);
x8 = x8 +15;
if (x8 > 535) {
  x8 = 365;
}


fill (#5A5A0F);
rect (x9, 530, 8, 4);
x9 = x9 + 10;
if (x9 > 535) {
  x9 = 300;
}

fill (#5A5A0F);
rect (x10, 540, 7, 5);
x10 = x10 + 10;
if (x10 > 535) {
  x10 = 355;
}

fill (#5A5A0F);
rect (x11, 520, 7, 7); 
x11 = x11 + 15;
if (x11 > 535) {
  x11 = 280;
}

fill (#BEBF27);
rect (x12, 535, 7, 4);
x12 = x12 + 15;
if (x12 > 535) {
  x12 = 280;
}

fill (#BEBF27);
rect (x13, 535, 7, 4);
x13 = x13 + 10;
if (x13 > 535) {
  x13 = 260;
}

fill (#FFFFFF);
rect (x14, 545, 7, 5);
x14 = x14 + 10;
if (x14 > 535) {
  x14 = 260;
}

fill (#ffffff);
rect (x15, 520, 7,4);
x15 = x15 + 15;
if (x15 > 535) {
  x15 = 263;
}

}



