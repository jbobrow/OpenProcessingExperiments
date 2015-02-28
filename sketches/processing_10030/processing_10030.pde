
//////////////////////////////////////////
////////Designed by Joelle Leung  ////////
////////as a comment on the       ////////
////////arbitrary nature of signs.////////
//////////////////////////////////////////
////////   Joelleleung.com        ////////
//////////////////////////////////////////
//////////////////////////////////////////
import ddf.minim.*;
Minim minim;
AudioPlayer a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,xx,yy,z;

//import processing.video.*;
//MovieMaker mm;


 
 
PImage A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z;


int maxH = 129;
int minH = 0;
int letterW = 129;          // Width of the letter
int letterH = maxH;

float x = -letterW;       // X position of the letters
float y = 0;              // Y position of the letters



void setup() {
  minim = new Minim(this);

size(924,450);
  smooth();
  noStroke();
  background(255); 
  A = loadImage("A.gif");
  B = loadImage("B.gif");
  C = loadImage("C.gif");
  D = loadImage("D.gif");
  E = loadImage("E.gif");
  F = loadImage("F.gif");
  G = loadImage("G.gif");
  H = loadImage("H.gif");
  I = loadImage("I.gif");
  J = loadImage("J.gif");
  K = loadImage("K.gif");
  L = loadImage("L.gif");
  M = loadImage("M.gif");
  N = loadImage("N.gif");
  O = loadImage("O.gif");
  P = loadImage("P.gif");
  Q = loadImage("Q.gif");
  R = loadImage("R.gif");
  S = loadImage("S.gif");
  T = loadImage("T.gif");
  U = loadImage("U.gif");
  V = loadImage("V.gif");
  W = loadImage("W.gif");
  X = loadImage("X.gif");
  Y = loadImage("Y.gif");
  Z = loadImage("Z.gif");
// in = minim.loadFile("01 Lay It Down (Ft. Anthony Hamilton).mp3");
a = minim.loadFile("A.mp3");
b = minim.loadFile("B.mp3");
c = minim.loadFile("C.mp3");
d = minim.loadFile("D.mp3");
e = minim.loadFile("E.mp3");
f = minim.loadFile("F.mp3");
g = minim.loadFile("G.mp3");
h = minim.loadFile("H.mp3");
i = minim.loadFile("I.mp3");
j = minim.loadFile("J.mp3");
k = minim.loadFile("K.mp3");
l = minim.loadFile("L.mp3");
m = minim.loadFile("M.mp3");
n = minim.loadFile("N.mp3");
o = minim.loadFile("O.mp3");
p = minim.loadFile("P.mp3");
q = minim.loadFile("Q.mp3");
r = minim.loadFile("R.mp3");
s = minim.loadFile("S.mp3");
t = minim.loadFile("T.mp3");
u = minim.loadFile("U.mp3");
v = minim.loadFile("V.mp3");
w = minim.loadFile("W.mp3");
xx = minim.loadFile("X.mp3");
yy = minim.loadFile("Y.mp3");
z = minim.loadFile("Z.mp3");
  }



void draw() {
//translate((width/2)-540, (height/2)-390); 
//mm.addFrame();

}


void keyPressed() { 
     float y_pos;
     if (letterH == maxH) {
       y_pos = y + minH;
    if( key == 'A' || key == 'a') {
a.play();
image(A, x, y_pos, letterW, letterH);

  } 
  else if( key == 'B' || key == 'b') {
       y_pos = y + minH;
b.play();
image(B, x, y_pos, letterW, letterH);

   }
     else if( key == 'C' || key == 'c') {
       y_pos = y + minH;
c.play();
image(C, x, y_pos, letterW, letterH);
   }
     else if( key == 'D' || key == 'd') {
       y_pos = y + minH;
d.play();
image(D, x, y_pos, letterW, letterH);
   }
     else if( key == 'E' || key == 'e') {
       y_pos = y + minH;
e.play();
image(E, x, y_pos, letterW, letterH);
   }
     else if( key == 'F' || key == 'f') {
       y_pos = y + minH;
f.play();
image(F, x, y_pos, letterW, letterH);
   }
     else if( key == 'G' || key == 'g') {
       y_pos = y + minH;
g.play();
image(G, x, y_pos, letterW, letterH);
   }
     else if( key == 'H' || key == 'h') {
       y_pos = y + minH;
h.play();
image(H, x, y_pos, letterW, letterH);
   }
        else if( key == 'I' || key == 'i') {
       y_pos = y + minH;
i.play();
image(I, x, y_pos, letterW, letterH);
   }
        else if( key == 'J' || key == 'j') {
       y_pos = y + minH;
j.play();
image(J, x, y_pos, letterW, letterH);
   }
        else if( key == 'K' || key == 'k') {
       y_pos = y + minH;
k.play();
image(K, x, y_pos, letterW, letterH);
   }
        else if( key == 'L' || key == 'l') {
       y_pos = y + minH;
l.play();
image(L, x, y_pos, letterW, letterH);
   }
        else if( key == 'M' || key == 'm') {
       y_pos = y + minH;
m.play();
image(M, x, y_pos, letterW, letterH);
   }
        else if( key == 'N' || key == 'n') {
       y_pos = y + minH;
n.play();
image(N, x, y_pos, letterW, letterH);
   }
        else if( key == 'O' || key == 'o') {
       y_pos = y + minH;
o.play();
image(O, x, y_pos, letterW, letterH);
   }
        else if( key == 'P' || key == 'p') {
       y_pos = y + minH;
p.play();
image(P, x, y_pos, letterW, letterH);
   }
       else if( key == 'Q' || key == 'q') {
q.play();
image(Q, x, y_pos, letterW, letterH);
   }
     else if( key == 'R' || key == 'r') {
       y_pos = y + minH;
r.play();
image(R, x, y_pos, letterW, letterH);
   }
     else if( key == 'S' || key == 's') {
       y_pos = y + minH;
s.play();
image(S, x, y_pos, letterW, letterH);
   }
     else if( key == 'T' || key == 't') {
       y_pos = y + minH;
t.play();
image(T, x, y_pos, letterW, letterH);
   }
        else if( key == 'U' || key == 'u') {
       y_pos = y + minH;
u.play();
image(U, x, y_pos, letterW, letterH);
   }
        else if( key == 'V' || key == 'v') {
       y_pos = y + minH;
v.play();
image(V, x, y_pos, letterW, letterH);
   }
        else if( key == 'W' || key == 'w') {
       y_pos = y + minH;
w.play();
image(W, x, y_pos, letterW, letterH);
   }
        else if( key == 'X' || key == 'x') {
       y_pos = y + minH;
xx.play();
image(X, x, y_pos, letterW, letterH);
   }
        else if( key == 'Y' || key == 'y') {
       y_pos = y + minH;
yy.play();
image(Y, x, y_pos, letterW, letterH);
   }
        else if( key == 'Z' || key == 'z') {
       y_pos = y + minH;
z.play();
image(Z, x, y_pos, letterW, letterH);

   }
 else if(key == CODED) {
    if (keyCode == LEFT) {
   //    y_pos = y;
        x = - letterW;   
  }}       
         else if(key == CODED) {
    if (keyCode == RIGHT) {
   //    y_pos = y;
        x = + letterW;         
 }}
 else if( key == BACKSPACE) {
      y = 0;
      x = 0;
 //       x = - letterW;
      background (255);
x = 0;
y_pos = 0;
   }
}
  // Update the "letter" position
    x =  ( x + letterW ); 
    
      // Wrap horizontally
  if (x > width - letterW) {
    x = 0;
    y+= maxH;
  }

  // Wrap vertically
  if( y > height - letterH) {
    y = 0;      // reset y to 0
  }

}


void stop()
{
  // always close audio I/O classes

  a.close();
  b.close();
  c.close();
  d.close();
  e.close();
  f.close();
  g.close();
  h.close();
  i.close();        
  j.close();
  k.close();
  l.close();
  m.close();
  n.close();
  o.close();
  p.close();
  q.close();
  r.close();
  s.close();
  t.close();
  u.close();
  v.close();
  w.close();
  xx.close();
  yy.close();  
  z.close();  
  
  // always stop your Minim object
  minim.stop();
 
  super.stop();


     
}

