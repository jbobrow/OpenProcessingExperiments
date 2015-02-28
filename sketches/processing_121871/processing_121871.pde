
int kirbyX;
int kirbyY;

void setup() {
size(300,500); 
kirbyX = 100;
kirbyY = 550;
}

void draw() {
background(230);
ellipseMode(CENTER);
/* armpjes */
stroke(247,159,240);
fill(245,135,237);
ellipse(kirbyX -30,kirbyY -35, 20,30);
ellipse(kirbyX +30,kirbyY -35,20,30);
/* linkervoet */
fill(202,0,5);
stroke(213,0,5);
ellipse(kirbyX +30,kirbyY +30,30,35);
/* lichaam */
fill(245,135,237);
stroke(247,159,240);
ellipse(kirbyX,kirbyY,80,80);
/* rechtervoet */
fill(202,0,5);
stroke(213,0,5);
ellipse(kirbyX -30,kirbyY +30,30,35);
/* Mond */
fill(202,0,5);
stroke(200,0,5);
arc(kirbyX,kirbyY +10, 10, 15, 0, PI);
/* Ogen */
fill(37,24,188);
stroke(56,43,227);
ellipse(kirbyX -10,kirbyY -10,10,30);
ellipse(kirbyX +10,kirbyY -10,10,30);

/* Beweging naar boven */
kirbyY = kirbyY - 3;

/* Beweging links/rechts */
kirbyX = mouseX;

/* opnieuw */
if(kirbyY==-50){
  kirbyY=550;
}
}
