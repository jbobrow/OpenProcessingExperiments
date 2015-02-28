
//Emanuele S. Reis - Curva pontos

int y=5;
int x=10;
void setup () {
size (200,200);
background (150);
}
void draw() {
int spacing= 10;
int endLegs=180;
stroke (49,34,224);
strokeWeight (3);
x=x+spacing;
point (x-35,x*x/270);
}
