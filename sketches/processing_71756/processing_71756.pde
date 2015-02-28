
int c = 0;  int c1 = 1;  int c2 = 2;  int c3 = c2*2; //0,1,2,4
int c4 = c1+c3;  int c5 = c4*c2;  int c6 = c4+c5;  int c7 = c5*c2; //5,10,15,20
int c8 = c4*c4;  int c9 = c8 + c2;  int c10 = c5*(c1+c2);  int c11 = c10+c2; //25,27,30,32
int c12 = c11+c2;  int c13 = c10+c4;  int c14 = c10+(c3*c2);  int c15 = c7*c2; //34,35,38,40
int c16 = c15+c4;  int c17 = c16+(c2*c3);  int c18 = c8*c2;  int c19 = c18+c4; //45,48,50,55
int c20 = c10*c2;  int c21 = c20+c4;  int c22 = c15*c2;  int c23 = c22+c4; //60,65,80,85
int c24 = c10*(c1+c2);  int c25 = c5*c5;  int c26 = c25+c4;  int c27 = c25+c5; //90,100,105,110
int c28 = c25+c6;  int c29 = c25+c7;  int c30 = c8*c4;  int c31 = c29+(c2*c3); //115,120,125,128
int c32 = c25+c10;  int c33 = c25+c13;  int c34 = c25+c14;  int c35 = c25+c15; //130,135,138,140
int c36 = c25+c16;  int c37 = c22*c2;  int c38 = c24*c2;  int c39 = c25+c24; //145,160,180,190
int c40 = c5*c7;  int c41 = c40+c4;  int c42 = c40+c6;  int c43 = c40+c7; //200,205,215,220
int c44 = c40+c8;  int c45 = c40+c10; int c46 = c45+c4;  int c47 = c40+c15; //225,230,235,240
int c48 = c40+c19;  int c49 = c31*c2;  int c50 = c49*c2; //255,256,512

int localX = c49;
int localY = c49;

void setup() {
  size( c50, c50 );
  smooth();
}


//
// draw() is called once per frame to draw
//
void draw() {
  background(c);
  if ( mousePressed  &&  ( mouseButton == LEFT ) ) {
    localX = mouseX;
    localY = mouseY;
  }

int move = abs((pmouseX - mouseX)/c4);

rectMode(CENTER);
ellipseMode(CENTER);


stroke(c); //lower jaw
fill(c48,c46,c45);
triangle(localX-c19,localY+c18,localX,localY+c38,localX+c19,localY+c18);

fill(c); // jaw blockers
stroke(c);
triangle(localX-c8,localY+c29,localX-c6,localY+c32,localX-c13,localY+c35);
triangle(localX-c6,localY+c32,localX,localY+c34,localX-c13,localY+c35);
triangle(localX,localY+c34,localX+c6,localY+c32,localX+c13,localY+c35);
triangle(localX+c6,localY+c32,localX+c8,localY+c29,localX+c13,localY+c35);
triangle(localX-c13,localY+c34,localX+c13,localY+c34,localX,localY+c38);

stroke(c48,c40,c40); //Gums
strokeWeight(c3);
line(localX-c17,localY+c19,localX-c7,localY+c29);
line(localX-c7,localY+c29,localX-c5,localY+c32);
line(localX-c5,localY+c32,localX,localY+c33);
line(localX,localY+c33,localX+c5,localY+c32);
line(localX+c5,localY+c32,localX+c7,localY+c29);
line(localX+c7,localY+c29,localX+c17,localY+c19);

stroke(c39);
strokeWeight(c1);
fill(c48,c48,c46);
ellipse(localX,localY+c5,c35,c32); //head

fill(c,localX,localY,c31);
triangle(localX-c21,localY,localX-c20,localY-c5,localX-c37,localY-c10); //antennae
triangle(localX+c21,localY,localX+c20,localY-c5,localX+c37,localY-c10);
triangle(localX-c18,localY-c10,localX-c15,localY-c13,localX-c24,localY-c29);
triangle(localX+c18,localY-c10,localX+c15,localY-c13,localX+c24,localY-c29);
triangle(localX-c7,localY-c15,localX-c5,localY-c15,localX-c6,localY-c35);
triangle(localX+c5,localY-c15,localX+c7,localY-c15,localX+c6,localY-c35);

stroke(c48,c48,c46); // antennae line blockers
line(localX-c21,localY,localX-c20,localY-c5);
line(localX+c21,localY,localX+c20,localY-c5);
line(localX-c18,localY-c10,localX-c15,localY-c13);
line(localX+c18,localY-c10,localX+c15,localY-c13);
line(localX-c7,localY-c15,localX-c5,localY-c15);
line(localX+c5,localY-c15,localX+c7,localY-c15);

stroke(c46,c46,c42);
fill(c48,c48,c46);
triangle(localX,localY+c29,localX-c5,localY+c24,localX+c5,localY+c24); // beak tip
triangle(localX-c7,localY+c24,localX-c7,localY+c22,localX-c5,localY+c24); // teeth beak 1
triangle(localX+c7,localY+c24,localX+c7,localY+c22,localX+c5,localY+c24); // 2
triangle(localX-c7,localY+c29,localX-c5,localY+c32,localX-c5,localY+c29); //teeth bottom 1
triangle(localX+c5,localY+c32,localX+c5,localY+c29,localX+c7,localY+c29); // 2
triangle(localX-c10,localY+c25,localX-c7,localY+c25,localX-c8,localY+c27); //teeth middle 1
triangle(localX+c10,localY+c25,localX+c7,localY+c25,localX+c8,localY+c27); // 2
triangle(localX-c14,localY+c22,localX-c8,localY+c22,localX-c12,localY+c24); //teeth top 1
triangle(localX+c9,localY+c22,localX+c14,localY+c22,localX+c11,localY+c24); // 2

stroke(c47); // eyes
fill(c43);
ellipse(localX-c15,localY-c7,c7,c5);
ellipse(localX+c15,localY-c7,c7,c5);
stroke(move); // pupils
strokeWeight(c);
fill(c46,localX,localY);
ellipse(localX-c15,localY-c7,move,move);
ellipse(localX+c15,localY-c7,move,move);

stroke(c32); // nostrils
fill(c32);
ellipse(localX-c7,localY+c10,move+c4,move+c5);
ellipse(localX+c7,localY+c10,move+c4,move+c5);

strokeWeight(c2);
stroke(c48,c48,c46);
fill(c48,c48,c46);
triangle(localX-c20,localY+c15,localX+c20,localY+c15,localX,localY+c25); // beak
stroke(c46,c46,c42);
line(localX+c5,localY+c5,localX+c20,localY+c15);
line(localX-c20,localY+c15,localX-c5,localY+c5);
bezier(localX-c5,localY+c5,localX-c4,localY,localX+c4,localY,localX+c5,localY+c5);


stroke(c44,c44,c41); //Mandible 1
triangle(localX-c36,localY+c23,localX-c20,localY+c15,localX-c16,localY+c19);
triangle(localX-c36,localY+c23,localX-c26,localY+c23,localX-c16,localY+c19);
triangle(localX-c36,localY+c23,localX-c26,localY+c23,localX-c20,localY+c30);
triangle(localX-c26,localY+c23,localX-c20,localY+c30,localX-c13,localY+c29);
triangle(localX-c20,localY+c30,localX-c13,localY+c29,localX-c13,localY+c32);
triangle(localX-c13,localY+c32,localX-c13,localY+c29,localX-c7,localY+c28);
triangle(localX-c13,localY+c32,localX-c5,localY+c28,localX-c7,localY+c28);
triangle(localX-c7,localY+c27,localX-c7,localY+c28,localX-c5,localY+c28);


stroke(c44,c44,c41); // Mandible 2
triangle(localX+c16,localY+c19,localX+c20,localY+c15,localX+c36,localY+c23);
triangle(localX+c16,localY+c19,localX+c26,localY+c23,localX+c36,localY+c23);
triangle(localX+c26,localY+c23,localX+c36,localY+c23,localX+c20,localY+c30);
triangle(localX+c26,localY+c23,localX+c13,localY+c29,localX+c20,localY+c30);
triangle(localX+c13,localY+c29,localX+c13,localY+c32,localX+c20,localY+c30);
triangle(localX+c13,localY+c29,localX+c13,localY+c32,localX+c7,localY+c28);
triangle(localX+c5,localY+c28,localX+c13,localY+c32,localX+c7,localY+c28);
triangle(localX+c5,localY+c28,localX+c7,localY+c27,localX+c7,localY+c28);

stroke(c48,c48,c46,c37); // Mandible Line Blocker
line(localX-c20,localY+c15,localX-c16,localY+c19);
line(localX+c16,localY+c19,localX+c20,localY+c15);


}
