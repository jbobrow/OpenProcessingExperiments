
int rougeX = 66;
int rougeY = 100;
int rougeR = 20;

int vertX = 122;
int vertY = 100;
int vertR = 30;

int etat;

void setup() {
  size(200, 200);
  smooth();
  noStroke();
  
}

void draw() {  //draw function loops
 

  
  if ( etat == 0 ) {
    background(0);
  } 
  else if ( etat == 1) {
    background(200, 50, 50);
  } 
  else {
    background(50, 200, 50);
  }


  fill(255, 0, 0);
  ellipse( rougeX, rougeY, rougeR *2, rougeR *2 );


  fill(0, 255, 0);
  ellipse( vertX, vertY, vertR *2, vertR *2 );
  
 
}

void mousePressed() {

  float rougeDistance = dist( mouseX, mouseY, rougeX, rougeY ); 
  
  float vertDistance = dist( mouseX, mouseY, vertX, vertY );
  
  if ( rougeDistance < rougeR ) {
    etat = 1;
  } else if ( vertDistance < vertR ) {
    etat = 2;
  } else {
    etat = 0; 
  }
}
