

float x, y, xCiblee, yCiblee, vitesse;

void setup() {
  size(400, 400);
  smooth(); 

  vitesse = 5;
  
}

void draw() {

  background(0);

  xCiblee = mouseX;
  yCiblee = mouseY;


  float radians = atan2( yCiblee-y, xCiblee-x );
  float distance = dist( xCiblee, yCiblee, x, y );
  x = cos(radians) * min(distance,vitesse) + x;
  y = sin(radians) * min(distance,vitesse) + y;


  ellipse(x, y, 30, 30);
}

