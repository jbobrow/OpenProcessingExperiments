
// Emanuele S. Reis - Exercicios quadrados

void setup (){
  size(200,200);
  background (0);
}  
  void draw (){
    int a,b,c,d;
    a=d=20;
    b=c=10;
    for (int e=5; e<10; e=e+1){
    rect (a,50,b,c);
    a=a+20;
    rect (a+e*d,100,b,c);
    rect (a+e*d, 30,b,c);
  }
  }
