

float courante;
float ciblee;
float vitesse;

float courante2;
float ciblee2;


void setup() {
  size(400, 400);
  smooth();

  courante = width/2;
  vitesse = 10;
  
}

void draw() {

  background( 0 );

  ciblee = mouseX;
  
 float distance = abs(ciblee - courante);
if ( courante < ciblee ) {
        courante = courante + min(distance,vitesse);
} else {
        courante = courante - min(distance,vitesse);
}


  
  fill(255,0,0);
  ellipse( courante, height/2, 30, 30);
}

