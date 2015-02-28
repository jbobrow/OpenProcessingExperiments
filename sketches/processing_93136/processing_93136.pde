
//Emanuele S. Reis - Exercicio linhas 2
int y=5;
int x=15;

void setup () {
  size (200,200);
background (100);
} 
void draw() {
int spacing= 1;
int endLegs=150;
 strokeWeight (3);
    x=x+spacing;
    point (x-35,x*x/20);
     line (x-35, x*x/270, x-37, x*x/50);
}
