
// EJERCICIOS GRAFICANDO CURVA
// 1) Reemplace ciclos por llamadas recursivas (20 puntos)
// 2) Portar código a OpenProcessing (10 puntos)
// 3) Cuál es el valor de "lim" más interesante? (10 puntos)
// 4) Puedes lograr efectos y colores más interesantes? (10 p) 


// Globales
long timer;
int lim;


void setup()
{
  size(600,600);
  colorMode(RGB,255);
  frameRate(10);    
  timer = millis();
  lim = 90;
}

void grafica(int t)
{
    strokeWeight(30);
    for (int i=1; i<=lim; i++) {
        int c = int(random(1,220)); // 1..220
        stroke(c,c,c+random(-10,150),c); // c,t,c*t,c/t,c-t
        rotate(-1*sin(i*2*PI+3*i));
        point(30+i,height-6*i);
    }
}

void draw() {
    background(0,0,100);
    if (millis()-timer > 1000) {
        lim += round(random(-3,3));
        if (lim<2) {
            lim = 2;
        }
        timer = millis(); // reset timer
    }
    for (int t=1; t<100; t++) {
        grafica(t);
    }
}

