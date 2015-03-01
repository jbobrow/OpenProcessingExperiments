
void setup() {
    size(400, 400);
    p = 0;
}

void desenharArco(float diametro, float zenite, float azimute, float deslocamento) {
    pushMatrix();
    rotate(zenite);
    float diam = abs(diametro * sqrt(1 - pow(deslocamento, 2)));
    ellipse(deslocamento * azimute * diametro / 2, 0, diam * sqrt(1 - pow(azimute, 2)), diam);
    popMatrix();
}

void desenharEsfera(float arfagem, float guinada, float diametro, int meridianos, int paralelos) {
    noFill();
    stroke(0, 255, 0, 128);
    strokeWeight(2);

    ellipse(0, 0, diametro, diametro);

    int i;
    float angulo, dx, dy;
    for(i = meridianos; i > 0; i--) {
        angulo = guinada + PI / meridianos * i;
        dx = cos(angulo);
        dy = sin(arfagem) * sin(angulo);
        desenharArco(diametro, atan2(dy, dx), mag(dx, dy), 0);
    }
    desenharArco(diametro, HALF_PI, cos(arfagem), 0);
    for(i = paralelos++; i > 0; i--) {
        desenharArco(diametro, HALF_PI, cos(arfagem), sin(i * HALF_PI / paralelos));
        desenharArco(diametro, HALF_PI, cos(arfagem), -sin(i * HALF_PI / paralelos));
    }
}

float p;

void draw() {
    background(0);

    pushMatrix();
    translate(200, 200);
    desenharEsfera(p = (p + 0.005) % TWO_PI, p * 2, 300, 4, 2);
    popMatrix();
}

