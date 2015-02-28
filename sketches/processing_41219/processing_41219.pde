
float x = 60;
float y = 440;
int radius = 45;
int bodyHeight = 160;
int neckHeight = 70;
float easing = 0.02;
void setup() 
{
size(720, 480);
background (255, 252, 157);
smooth();
strokeWeight(2);
ellipseMode(RADIUS);
}

void draw() {
int targetX = mouseX;
x += (targetX - x) * easing;
if (mousePressed) {
  background (255, 252, 157);
neckHeight = 16;
bodyHeight = 90;
radius = 35;
strokeWeight(7);
} else {
neckHeight = 70;
bodyHeight = 160;
radius = 45;
background (255, 252, 157);
strokeWeight(2);
}

float ny = y - bodyHeight - neckHeight - radius;
 
// cuello
stroke(102); //setear stroke a gris
line(x+12, y-bodyHeight, x+12, ny);
line(x+3, y-bodyHeight, x+3,ny);
line(x-5, y-bodyHeight, x-5,ny);

// antena
stroke (102); //setar stroke a gris
line(x+12, ny, x-18, ny-43);
line(x+12, ny, x+42, ny-99);
line(x+12, ny, x+78, ny+15);

// cuerpo
noStroke(); //desabilito stroke
fill(212, 250, 91); //seteo relleno a amarillo
ellipse(x, y-33, 33, 33);
fill(108, 124, 11); //seteo relleno a verde
rect(x-45, y-bodyHeight, 90, bodyHeight-33);
fill(237, 25, 34); //relleno a rojo
rect(x-65, y-bodyHeight,90, 25);

// cabeza
fill(237, 25, 34);
ellipse(x+12, ny, radius, radius);
fill(255);
ellipse(x+24, ny-6, 14, 14);
fill(0);
ellipse(x+24, ny-6, 3, 3);
fill(153);
ellipse(x-1, ny-6, 5, 5);
ellipse(x+45,ny, 3, 3);
ellipse(x+30, ny-30, 4, 4);
 
}

