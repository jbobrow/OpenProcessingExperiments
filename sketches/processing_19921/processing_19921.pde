


float positionX, vitesseX;
float positionY, vitesseY;

int mode = 0;

void setup() {
  size(400,400);
  positionX = width/2;
  positionY = height/2;
  vitesseX = vitesseY = 0;
  noStroke();
  smooth();
}


void draw() {
  background(100);

  float cibleX = mouseX;
  float cibleY = mouseY;

  if ( mode == 0 ) {
    
    // INSTANTANE
    positionX = cibleX;
    positionY = cibleY;
    fill(200);
  } 
  else if ( mode == 1 ) {
    
    // VITESSE CONSTANTE
    float deltaX = cibleX - positionX;
    float deltaY = cibleY - positionY;
    float vitesse = 3;
    
    float angle = atan2( cibleY-positionY , cibleX-positionX );
    float distance = dist( cibleX , cibleY , positionX , positionY );
    positionX = cos(angle) * min( vitesse , distance ) + positionX;
    positionY = sin(angle) * min( vitesse , distance ) + positionY;
    fill(200,100,100);
  }
  else if ( mode == 2 ) {
    
    //VITESSE PROPORTIONNELLE
    positionX = ( cibleX - positionX) / 10.0 + positionX;
    positionY = ( cibleY - positionY) / 10.0 + positionY;
    fill(100,200,100);
  }
  else if ( mode == 3 ) {
    
    // DEPLACEMENT ELASTIQUE
    float k = 0.04;
    float d = 0.9;
    float accelerationX = k * (cibleX - positionX);
    vitesseX = d * (vitesseX + accelerationX);       
    positionX = positionX + vitesseX;  
    float accelerationY = k * (cibleY - positionY);
    vitesseY = d * (vitesseY + accelerationY);       
    positionY = positionY + vitesseY;
    fill(100,100,200);
  }
 
  
  ellipse(positionX,positionY,50,50);
}

void mousePressed() {

  mode = (mode + 1) % 4;
  
}

