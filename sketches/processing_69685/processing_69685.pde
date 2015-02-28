
final int TAILLE = 100;


float[] tableauDeX;
float[] tableauDeY;

void setup() {
  size(400, 400);
  smooth();

  tableauDeX = new float[TAILLE];
  tableauDeY = new float[TAILLE];


  for ( int i =0; i < TAILLE ; i = i + 1) { 
    tableauDeX[ i ] = random(0, width);
    tableauDeY[ i ] = random(0, height);
  }
}


void draw() {
  background(100);

  for ( int i =0; i < TAILLE ; i = i + 1) { 
    if ( insideCircle(tableauDeX[ i ] , tableauDeY[ i ], 20, mouseX, mouseY ) ) {
      fill(255, 0, 0);
    } 
    else {
      fill(0, 0, 255);
    }

    ellipse( tableauDeX[ i ] ,  tableauDeY[ i ], 40, 40 );
  }

}


boolean insideCircle( float circleX, float circleY, float circleRadius, float x, float y) {

  float distance = dist( circleX, circleY, x, y);

  boolean result = distance < circleRadius;

  return result;
}
