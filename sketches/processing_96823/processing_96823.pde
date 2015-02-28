
//Emanuele Reis - Exercício Reforço 1

void setup (){
size (200,200);
background (#FFDC0F);
}
int x;
void draw (){
  strokeWeight (2);
  smooth (1);
  line (20,10,80,10);
  for (int x=10; x<100; x=x+x) {
  line(20, x*2, 80, x+5);
}
  }
