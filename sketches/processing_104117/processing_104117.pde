
// desenhando com circulos animados

int crescimento = +1;
int diametro = 1;
//diametro inicial e valor de incremento

void setup() {
size(200, 200);
smooth();
frameRate(180);
}

void draw() {
 background(0);
 diametro = (diametro + crescimento);
 if (diametro > 300){
   diametro = 1;
 }
 noFill();
 stroke(200);
 ellipse(100, 100, diametro, diametro);

}
