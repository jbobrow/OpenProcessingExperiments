
void setup() {
  size(500, 500);

  smooth();
}


void draw() {
  background(0);

  noStroke();
  fill(255);
  ellipseMode(CENTER);

  translate(width/2, height/2);
  
  randomSeed(312);  // Immer die gleiche Zufallsfolge
  
  float numberOfDots = 4000;
  float radius = 180;

  for (int j = 0; j < numberOfDots; j++) {

    float randomangle = random(0, TWO_PI);   // Zufaelliger Winkel von 0 - 360 Grad
    
    float randomradius = radius * sqrt(random(0, 1));   // Homogene Verteilung

    float x = -sin(randomangle) * randomradius; 
    float y = cos(randomangle) * randomradius; 

    ellipse(x, y, 5, 5);
  }
}
