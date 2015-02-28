
float B = 0;
float C = 0;
float D = 0;
float E = 0;
float F = 0;
float G = 0;
void setup() {
  size(500,500);
    
}


void draw() {
  background(0);
  smooth();


  ellipse(B,50,50,50);
  
  B = B+1;
  
  if(B>500) {
 B=0;
  
  }
  
  ellipse(C,100,100,100);
  
  C = C+2;
  
  if(C>510) {
    C = 0;
  }
  
    ellipse(D,200,200,200);
  
  D = D+3;
  
  if(D>510) {
    D = 0;
  }
  
    ellipse(E,300,300,300);
  
  E = E+4;
  
  if(E>510) {
    E = 0;
  }
     ellipse(F,400,400,400);
  
  F = F+5;
  
  if(F>510) {
    F = 0;
  }
  
    ellipse(G,500,500,500);
  
  G = G+6;
  
  if(G>510) {
    G = 0;
  }
}

