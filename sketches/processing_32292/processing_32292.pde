
//Variables setup:  
 int SepA = 100;
 int SepB =100;
//Variables draw/myFunction:
int L;
int M;
   
void setup(){
  
  size(500, 1000);
  background(255);
  
  stroke(1);
  //noStroke();
  smooth();
  strokeWeight(1);
  //noFill();
  fill(40,43,50,150);
  
  for(int D = 0; D < width/SepA; D++){
      for(int F = 0; F < height/SepB; F++){
        pushMatrix();
        translate(D*SepA, F*SepB);
        myFunction();
        popMatrix();
      }
  }
 
}

void myFunction(){
//void draw(){
  int L=10;
  int M=2;
  while(M<100)
  {
  triangle(M*L,50, M*L, 120,10,20);
    M=M+M;
  }

}

