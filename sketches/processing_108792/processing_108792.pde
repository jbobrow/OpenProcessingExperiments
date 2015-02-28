
void setup() {
  size(800, 800);
  smooth();
  colorMode(HSB, 150, 500, 20);
}

void draw() {
  noFill();
  strokeWeight(5);
  
  
  for(int L = 200; L > 0; L -= 20)
  
  for(int M = 200; M > 0; M -= 20)
 
  for(int R = 400; R > 0; R -= 20){
    fill(R/3, 100, 50);
    rectMode(CENTER);
    rect(width/2, height/2, R, R);
    fill(L/4, 100, 100);
    rect(100, 700, L, L);
    fill(M/4, 100, 100);
    rect(100, 500, M, M);
   
  }
  for(int N = 200; N > 0; N -=20)
  for(int O = 200; O >0; O -=20)
  for(int P = 200; P > 0; P -=20)
  
  {fill(N/3, 107, 63);
  rect(100, 300, N, N);
  fill(O/4, 114, 52);
  rect(100, 100, O, O);
  fill(P/4, 114, 91);
  rect(300, 100, P, P);
  
  }
  for(int Q =200; Q >0; Q -=20)
  for(int U = 200; U>0; U -=20)
  for(int E = 200; E > 0; E -=20)
  {fill(Q/2, 88, 80);
    rect(700, 100, Q, Q);
  fill(U/3, 77, 114);
  rect(700, 300, U, U);
  fill(E/3, 100, 70);
  rect(500, 100, E, E);
  }
  for(int S = 200; S > 0; S-=20)
  for(int Y = 200; Y > 0; Y -=20)
  for(int G = 200; G > 0; G -=20)
  {fill(S/2, 52, 107);
    rect(700, 500, S, S);
 
   fill(Y/2, 52, 166);
   rect(700, 700, Y, Y);
   
   fill(G/2, 52, 114);
   rect(500, 700, G, G);
   
 
  }
  for(int B = 200; B >0; B -=20)
  {fill(B/4, 52, 52);
    rect(300, 700, B, B);
    
  }
}
