

Lineas dibuja1;
Lineas2 dibuja2;




void setup (){

background(5,190,170);
size(500,500);
smooth();
frameRate(30);
dibuja1= new Lineas();
dibuja2= new Lineas2();

}
void draw() {
for(int i = 0; i < 50; i++) { 



dibujaX(int(random(155)), int(random(255)), 
int (random(255)), int(random(280)),
int(random(width)), int(random(height)),100);
}
}

void dibujaX (int R, int G, int B, int ancho, int x, int y, int size){ stroke (R, B, G, 255); 
strokeWeight (3); 
line (0, 0, x+size, y-size);

dibuja1.muestraLineas();
dibuja2.muestraLineas2();


}




