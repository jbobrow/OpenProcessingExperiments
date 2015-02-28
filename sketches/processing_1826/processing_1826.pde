
size(400, 400);
smooth();

int numPetalos = 18;
int talloLargo = height/3;
int talloAncho = height/40;
int centroAncho = height/10;
int petaloAncho = height/30;

background(0);
translate(0, 2*talloLargo);

// Tierra
fill(#EA8111);
stroke(0);
strokeWeight(talloAncho);
rect(0, 0, width, talloLargo);

// Tallo
stroke(#09A702);
strokeCap(PROJECT);
strokeWeight(talloAncho);
translate(width/2, 0);
line(0, 0, 0, -talloLargo);

// Flor
translate(0, -talloLargo);
stroke(255);
fill(#FFCD00);
ellipse(0, 0, centroAncho, centroAncho);

// Petalos
strokeWeight(talloAncho/3);
fill(#FF0095);
stroke(#9B025B);
for(int i=0; i<numPetalos; i++){
  rotate(TWO_PI/numPetalos);
  ellipse(0, centroAncho, petaloAncho, centroAncho);
}

//saveFrame("screen.png");

