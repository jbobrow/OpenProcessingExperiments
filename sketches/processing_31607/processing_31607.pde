
import processing.opengl.*;


PFont font;
float angulo = 0.0;
float angulo2 = 0.0;
void setup () {
size (600,600,P3D);
smooth();
noStroke();
//stroke (255);
font = loadFont("Future-100.vlw");
textFont(font);
}
void draw () {
  
background (255);


angulo = angulo - 0.01;
 translate(300, 300);
 rotateY(angulo);

//hora

int a= second ();
int b= minute();
int c= hour ();
String t= nf(c,2) + ":" + nf (b,2) + ":" + nf (a,2);
textAlign(CENTER);
fill (100,200,50);
//textSize (100);


//map pide de donde sacar la informacion, hace un mapeo
float s =map (second(), 0, 60,0,300);
float m =map (minute(), 0, 60,0,300);
float h =map (hour(), 0, 24,0,300);
text (t, 0,m,m*2); 

int d = day();    // Values from 1 - 31
int mo = month();  // Values from 1 - 12
int y = year();   // 2003, 2004, 2005, etc.
String p = nf(d,2) + "/"+ nf(mo,2) + "/"+ nf(y,2) ;
//textAlign(CENTER);
text(p, m, m/4,-200);


pushMatrix();

rotateX (90);
text (t, 0,0,m*2);

popMatrix();

pushMatrix();

rotateX (90);
text (t, -100,-300,m);

popMatrix();



translate(0,0,0);
fill (255,0,0);
//curve (-100,s,300,s,100,10,300,s*2);

pushMatrix();
rotateX (angulo2*2);
//noFill (); 

stroke (5);
//sphere (s/2);
fill (0,50);

box(m*2);
popMatrix();

for (int f=000; f<=100; f=f+10) { rotateY (90);
translate (0,0,s);
rect (f,0,50,50);}
}

//void mousePressed() { 
//saveFrame () ;
//}

