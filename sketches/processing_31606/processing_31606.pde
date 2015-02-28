
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
int d = day();    // Values from 1 - 31
int mo = month();  // Values from 1 - 12
int y = year();   // 2003, 2004, 2005, etc.
String p = nf(d,2) + "/"+ nf(mo,2) + "/"+ nf(y,2) ;
//textAlign(CENTER);
text(p, 100, 128);




angulo = angulo - 0.01;
 translate(300, 300,-500);
 rotateY(angulo);
//hora

int a= second ();
int b= minute();
int c= hour ();
String t= nf(c,2) + ":" + nf (b,2) + ":" + nf (a,2);
//textAlign(CENTER);
fill (100,200,50);
//textSize (100);
//text (t, 200, height /2 + 20); 

text (t, 0,100); 

//map pide de donde sacar la informacion, hace un mapeo
float s =map (second(), 0, 60,0,300);
float m =map (minute(), 0, 60,0,300);
float h =map (hour(), 0, 24,0,300);

//pushMatrix();
rotateX (angulo2*2);
noFill (); 
stroke (59);
sphere (s/2);
fill (0,50);
box(m*2);

//popMatrix();
}
//void mousePressed() { 
//saveFrame () ;
//}

