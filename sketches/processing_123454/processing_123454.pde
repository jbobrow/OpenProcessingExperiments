
int kirbyX;
int kirbyY;
int kleur;
int teller;
int richting;
boolean test;

void setup() {
size(300,500); 
kirbyX = 100;
kirbyY = 550;
richting = 2;
teller = 0;
test = false;
}

void draw() {
  if(mouseX<width/2){
    background(kleur);
    kleur = kleur + 1;
        if(kleur > 255){
     kleur = 255; }
  }
  
  if(mouseX>width/2){
    background(kleur);
    kleur = kleur - 1;
    if(kleur < 0){
    kleur = 0;}
    }
ellipseMode(CENTER);
/* armpjes */
if(test == false){fill(245,135,237); stroke(247,159,240);}
if(test == true){fill(255,146,82);  stroke(255,146,82);}
ellipse(kirbyX -30,kirbyY -35, 20,30);
ellipse(kirbyX +30,kirbyY -35,20,30);
/* linkervoet */
fill(202,0,5);
stroke(213,0,5);
ellipse(kirbyX +30,kirbyY +30,30,35);
/* lichaam */
if(test == false){fill(245,135,237); stroke(247,159,240);}
if(test == true){fill(255,146,82); stroke(255,146,82);}
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
kirbyX = kirbyX + richting;

//* Links en rechts
if(kirbyX>260 || kirbyX<40){richting = -richting;
teller = teller + 1;
}
if(teller == 5){teller = 0; test = !test; }

/* opnieuw */
if(kirbyY==-50){
  kirbyY=550;
}
}
