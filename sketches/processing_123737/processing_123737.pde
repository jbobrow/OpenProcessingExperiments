
PImage A ;
PImage B ;
PImage C ;
PImage D ;
PImage E ;
PImage F ;
PImage G ;
PImage H ;
PImage I ;
PImage J ;
PImage K ;
PImage L ;
PImage M ;
PImage N ;
PImage O ;
PImage P ;
PImage Q ;
PImage R ;
PImage S ;
PImage T ;
PImage U ;
PImage V ;
PImage W ;
PImage X ;
PImage Y ;

int myState = 0 ;
int h = 600 ;

PImage Img ;

PVector leftPos ;
PVector rightPos ;
PVector midPos ;



void setup() {
  size(960, 800);
  smooth();
  background(#2d2d2d);

  A = loadImage("A.jpg") ;
  B = loadImage("B.jpg") ;
  C = loadImage("C.jpg") ;
  D = loadImage("D.jpg") ;
  E = loadImage("E.jpg") ;
  F = loadImage("F.jpg") ;
  G = loadImage("G.jpg") ;
  H = loadImage("H.jpg") ;
  I = loadImage("I.jpg") ;
  J = loadImage("Ii.jpg") ;
  K = loadImage("J.jpg") ;
  L = loadImage("K.jpg") ;
  M = loadImage("L.jpg") ;
  N = loadImage("M.jpg") ;
  O = loadImage("Mm.jpg") ;
  P = loadImage("N.jpg") ;
  Q = loadImage("Nn.jpg") ;
  R = loadImage("O.jpg") ;
  S = loadImage("P.jpg") ;
  T = loadImage("Q.jpg") ;
  U = loadImage("R.jpg") ;
  V = loadImage("S.jpg") ;
  W = loadImage("T.jpg") ;
  X = loadImage("U.jpg") ;
  Y = loadImage("V.jpg") ;

  leftPos = new PVector(width/2-300, height/2) ; 
  rightPos = new PVector(width/2+300, height/2) ; 
  midPos = new PVector(width/2, height/2) ; 
  
  textSize(36) ;
  
  imageMode(CENTER) ;
}

void draw () {
  background(#2d2d2d) ;
  switch(myState) {

  case 0:
    tint(255, 15);
    image(Y, leftPos.x, leftPos.y, 281, 500) ;
    image(B, rightPos.x, rightPos.y, 274, 500) ;
    noTint();
    image(A, midPos.x, midPos.y) ;
      
    break;
    
  case 1:
    tint(255, 15);
    image(A, leftPos.x, leftPos.y, 217, 500) ;  
    image(C, rightPos.x, rightPos.y, 209, 500) ;
    noTint();
    image(B, midPos.x, midPos.y) ;
    break ;
    
  case 2:
  tint(255, 15);
    image(B, leftPos.x, leftPos.y, 274, 500) ;
    image(D, rightPos.x, rightPos.y, 277, 500) ;
    noTint();
    image(C, midPos.x, midPos.y) ;
    break ;
    
  case 3:
  tint(255, 15);
    image(C, leftPos.x, leftPos.y, 209, 500) ;
    image(E, rightPos.x, rightPos.y, 266, 500) ;
    noTint();
    image(D, midPos.x, midPos.y) ;
    break ;
    
  case 4:
  tint(255, 15);
    image(D, leftPos.x, leftPos.y, 277, 500) ;
    image(F, rightPos.x, rightPos.y, 271, 500) ;
    noTint();
    image(E, midPos.x, midPos.y) ;
    break ;
    
  case 5:
  tint(255, 15);
    image(E, leftPos.x, leftPos.y, 266, 500) ;
    image(G, rightPos.x, rightPos.y, 264, 500) ;
    noTint();
    image(F, midPos.x, midPos.y) ;
    break ;
    
  case 6:
  tint(255, 15);
    image(F, leftPos.x, leftPos.y, 271, 500) ;
    image(H, rightPos.x, rightPos.y, 265, 500) ;
    noTint();
    image(G, midPos.x, midPos.y) ;
    break ;
    
  case 7:
  tint(255, 15);
    image(G, leftPos.x, leftPos.y, 264, 500) ;
    image(I, rightPos.x, rightPos.y, 250, 500) ;
    noTint();
        image(H, midPos.x, midPos.y) ;
    break ;
    
  case 8:
  tint(255, 15);
    image(H, leftPos.x, leftPos.y, 265, 500) ;
    image(J, rightPos.x, rightPos.y, 245, 500) ;
    noTint();
        image(I, midPos.x, midPos.y) ;
    break ;
    
  case 9:
  tint(255, 15);
    image(I, leftPos.x, leftPos.y, 250, 500) ;
    image(K, rightPos.x, rightPos.y, 271, 500) ;
    noTint();
        image(J, midPos.x, midPos.y) ;
    break ;
    
  case 10:
  tint(255, 15);
    image(J, leftPos.x, leftPos.y, 245, 500) ;
    image(L, rightPos.x, rightPos.y, 242, 500) ;
    noTint();
        image(K, midPos.x, midPos.y) ;
    break ;
    
  case 11:
  tint(255, 15);
    image(K, leftPos.x, leftPos.y, 271, 500) ;
    image(M, rightPos.x, rightPos.y, 333, 500) ;
    noTint();
        image(L, midPos.x, midPos.y) ;
    break ;
    
  case 12:
  tint(255, 15);
    image(L, leftPos.x, leftPos.y, 242, 500) ;
    image(N, rightPos.x, rightPos.y, 259, 500) ;
    noTint();
        image(M, midPos.x, midPos.y) ;
    break ;
    
  case 13:
  tint(255, 15);
    image(M, leftPos.x, leftPos.y, 333, 500) ;
    image(O, rightPos.x, rightPos.y, 220, 500) ;
    noTint();
        image(N, midPos.x, midPos.y) ;
    break ;
    
  case 14:
  tint(255, 15);
    image(N, leftPos.x, leftPos.y, 259, 500) ;
    image(P, rightPos.x, rightPos.y, 272, 500) ;
    noTint();
        image(O, midPos.x, midPos.y) ;
    break ;
    
  case 15:
  tint(255, 15);
    image(O, leftPos.x, leftPos.y, 220, 500) ;
    image(Q, rightPos.x, rightPos.y, 303, 500) ;
    noTint();
        image(P, midPos.x, midPos.y) ;
    break ;
    
  case 16:
  tint(255, 15);
    image(P, leftPos.x, leftPos.y, 272, 500) ;
    image(R, rightPos.x, rightPos.y, 219, 500) ;
    noTint();
    image(Q, midPos.x, midPos.y) ;
    break ;
    
  case 17:
  tint(255, 15);
    image(Q, leftPos.x, leftPos.y, 303, 500) ;
    image(S, rightPos.x, rightPos.y, 239, 500) ;
    noTint();
        image(R, midPos.x, midPos.y) ;
    break ;
    
  case 18:
  tint(255, 15);
    image(R, leftPos.x, leftPos.y, 219, 500) ;
    image(T, rightPos.x, rightPos.y, 314, 500) ;
    noTint();
        image(S, midPos.x, midPos.y) ;
    break ;
    
  case 19:
  tint(255, 15);
    image(S, leftPos.x, leftPos.y, 239, 500) ;
    image(U, rightPos.x, rightPos.y, 250, 500) ;
    noTint();
        image(T, midPos.x, midPos.y) ;
    break ;
    
  case 20:
  tint(255, 15);
    image(T, leftPos.x, leftPos.y, 314, 500) ;
    image(V, rightPos.x, rightPos.y, 259, 500) ;
    noTint();
        image(U, midPos.x, midPos.y) ;
    break ;
    
  case 21:
  tint(255, 15);
    image(U, leftPos.x, leftPos.y, 250, 500) ;
    image(W, rightPos.x, rightPos.y, 259, 500) ;
    noTint();
        image(V, midPos.x, midPos.y) ;
    break ;
    
  case 22:
  tint(255, 15);
    image(V, leftPos.x, leftPos.y, 259, 500) ;
    image(X, rightPos.x, rightPos.y, 255, 500) ;
    noTint();
        image(W, midPos.x, midPos.y) ;
    break ;
    
  case 23:
  tint(255, 15);
    image(W, leftPos.x, leftPos.y, 259, 500) ;
    image(Y, rightPos.x, rightPos.y, 281, 500) ;
    noTint();
        image(X, midPos.x, midPos.y) ;
    break ;
    
  case 24:
  tint(255, 15);
    image(X, leftPos.x, leftPos.y, 255, 500) ;
    image(A, rightPos.x, rightPos.y, 217, 500) ;  
    noTint();
        image(Y, midPos.x, midPos.y) ;
    break ;
  }//endofswitch//
}///endofdraw//

void keyPressed() {
  switch(keyCode) {

  case 37:///left

    myState = myState - 1 ;
    if (myState < 0) {
      myState = 24 ;
    }

    break ; 

  case 39: // right

    myState = myState + 1 ;
    if (myState > 24) {
      myState = 0 ;
    }

    break ;
  }//endofswitch//
}///endofkeypress



