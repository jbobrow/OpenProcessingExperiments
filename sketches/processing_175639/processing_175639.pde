
PVector[] initialVertexes;
float     fractalRadius;
PVector   currentPoint;
int       currentVertex;
PVector   helpColorVector;
PVector   helpFractalVector;
int       numberOfPoints;
float     offsetY;
float     ANGLE_OFFSET;                   // Used to align top vertex with vertical axis when applied
float     HALF_DISTANCE;
int       NUMBER_OF_VERTEXES   = 20;
int       MAX_NUMBER_OF_POINTS = 30000;  
 
 
void keyPressed() {
    background(255);
    changeSystem();
}
 
void mousePressed() {
    background(255);
    changeSystem();
}
 
void changeSystem() {
    switch(NUMBER_OF_VERTEXES) {
        case 3:
            NUMBER_OF_VERTEXES = 5;
        break;
         
        case 5:
            NUMBER_OF_VERTEXES = 6;
        break;
         
        case 6:
            NUMBER_OF_VERTEXES = 8;
        break;
         
        case 8:
            NUMBER_OF_VERTEXES = 20;
        break;
         
        case 20:
            NUMBER_OF_VERTEXES = 3;
        break;       
    }
     
  setGeometricProperties();
  setInitialVertexes();   
}
 
 
void setup() {
  size(600, 400);
  background(255);
  strokeWeight(4f);
   
  setGeometricProperties();
  setInitialVertexes();
}
 
void setGeometricProperties() {
  fractalRadius  = width * 0.5f - 120f;
  numberOfPoints = NUMBER_OF_VERTEXES;
  offsetY        = 0;
     
  switch (NUMBER_OF_VERTEXES) {
    case 3:
      ANGLE_OFFSET  = -PI / 6;
      HALF_DISTANCE = 0.5F;
      offsetY       = height * 0.05F;
    break;
 
    case 5:
      ANGLE_OFFSET  = PI / 10;
      HALF_DISTANCE = 0.625F;  
    break;
     
    case 6:
      ANGLE_OFFSET  = PI / 6;
      HALF_DISTANCE = 0.666F;  
    break;
     
    case 8:
      ANGLE_OFFSET  = PI / 4;
      HALF_DISTANCE = 0.7f;  
    break;
 
    case 20:
      ANGLE_OFFSET  = 0;
      HALF_DISTANCE = 0.8F;  
    break;
     
    default:
        print("Alien Queen Bug: Geometric properties should never be on defaulf case");
    break;
  }
}
 
void setInitialVertexes() {
  initialVertexes = new PVector[NUMBER_OF_VERTEXES];
  float ang       = TWO_PI / NUMBER_OF_VERTEXES;
   
  for (int i = 0; i < NUMBER_OF_VERTEXES; i++) {
    float x            = fractalRadius * cos(ang * (i + 1) + ANGLE_OFFSET);
    float y            = -fractalRadius * sin(ang * (i + 1) + ANGLE_OFFSET);
    initialVertexes[i] = new PVector(x, y); 
  }
   
  // First point can be anywhere inside the polygon.
  currentPoint = new PVector(width * 0.2f, height * 0.2f);
   
  helpColorVector   = new PVector();
  helpFractalVector = new PVector();
}
 
void addPointToFractal() {
  if (numberOfPoints >= MAX_NUMBER_OF_POINTS) return;
 
  numberOfPoints++;
   
  if (numberOfPoints == MAX_NUMBER_OF_POINTS) println("End of Chaos Game");
 
  currentVertex       = floor(random(NUMBER_OF_VERTEXES));
  helpFractalVector.x = initialVertexes[currentVertex].x;
  helpFractalVector.y = initialVertexes[currentVertex].y;
  helpFractalVector.sub(currentPoint);
  helpFractalVector.mult(HALF_DISTANCE);
  currentPoint.add(helpFractalVector);
}
 
 
// The color is computed based on the distance the
//   point is from the vertex it's moving toward.
// More distant points are more redish
//   (as in the Doppler Effect in the Universe)
// Colors are also computed based on a clamped
//   eletromagnetic spectrum: [400, 700] nm
//   (obs: visible colors are [390, 750])
void setColor() {
  helpColorVector.x = initialVertexes[currentVertex].x;
  helpColorVector.y = initialVertexes[currentVertex].y;
  helpColorVector.sub(currentPoint);
  float wavelength = 400.0f + 300.0f * (helpColorVector.mag() / fractalRadius);
   
  float r = 0,
        g = 0,
        b = 0;
    if (wavelength >= 400f && wavelength <= 440f) {
        r = -1.0f * ((wavelength - 440.0f) / 40.0f);
        g = 0;
        b = 1f;
    } else if (wavelength > 440f && wavelength <= 490f) {
        r = 0;
        g = (wavelength - 440.0f) / 50.0f;
        b = 1f;
    } else if (wavelength > 490f && wavelength <= 510f) {
        r = 0f;
        g = 1f;
        b = -1.0f * ((wavelength - 510.0f) / 20.0f);
    } else if (wavelength > 510 && wavelength <= 580) {
        r = (wavelength - 510.f) / 70.f;
        g = 1f;
        b = 0f;
    } else if (wavelength > 580f && wavelength <= 645f) {
        r = 1f;
        g = -1.0f * ((wavelength - 645.0f) / 65.0f);
        b = 0;
    } else if (wavelength > 645f && wavelength <= 700f) {
        r = 1.0f;
        g = 0f;
        b = 0f;
    }
  
    color c = color((int)(r * 255), (int)(g * 255), (int)(b * 255));
    stroke(c);
}
 
void draw() {
  translate(width * 0.5f, height * 0.5f);
  addPointToFractal();
  setColor();
   
  // Drop first 30 points to improve accuracy 
  if (numberOfPoints < 30) return;
   
  point(currentPoint.x, currentPoint.y + offsetY);
}

