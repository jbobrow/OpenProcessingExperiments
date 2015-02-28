
float transparencia = 0.0; // definicion de transparencia

void setup() {
  frameRate(30); // fotogramas x segundo
  size (600, 600);
  background(255);
  smooth();
}

void draw()
{

transparencia = transparencia + .010; //suma de transparencia
float n = noise(transparencia) * height; // random
strokeWeight(10);
stroke (random(255), random(255), random(255), 50); //color
line(n, 0, n, 600);
rect(50, 50, 50,50);
rect(70, 70, 70, 70);
rect(100, 100, 100, 100);
rect(130, 130, 130, 130);
rect(150, 150, 150, 150);
rect(170, 170, 170, 170);
rect(200, 200, 200, 200);
rect(230, 230, 230, 230);
rect(250, 250, 250, 250);
rect(290, 290, 290, 290);
fill(70, 247, 205);
ellipse(40, 40, 40, 40);
}
