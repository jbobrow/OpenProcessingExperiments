
int A = 10;
int B = 10;
int C = 50;
int D = 50;

void setup (){
 
 size (700, 400); 
 background (0);
  
}


void draw (){
  
}

void mousepressed (){
 
}

void mouseMoved (){
  ellipse (B, B, A, 10);
  A=A+10;
  B=B+20;
  ellipse (C, C, 10, D);
  D=D+10;
  C=C+50;
  
  
}
