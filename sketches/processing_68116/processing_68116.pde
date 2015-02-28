
int A = 40;
int C = 320;
void setup() {
  size(500, 200);
  smooth();
  fill(255,235,3);
}
void draw() {
 background(0,0,0); 
     if(A>=10) {
    A--;
    C++;
     }       
 float Abierto = radians(A);
 float Cerrado = radians(C);  
  arc(100, 100, 100, 100, Abierto, Cerrado);
}
