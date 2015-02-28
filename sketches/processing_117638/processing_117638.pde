
void setup(){
}

void draw() {
    dibujarCirculoRojo(30,30);
    dibujarCirculoAzul(60,60);
}

void dibujarCirculoRojo(int posicionX, int posicionY){
    fill(255,0,0);
    ellipse(posicionX, posicionY, 30, 30);
}

void dibujarCirculoAzul(int posicionX, int posicionY){
    fill(0,0,255);
    ellipse(posicionX, posicionY, 30, 30);
}
