
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

  randomSeed(1);  // Immer die gleiche Zufallsfolge

  float numberOfDots = 4000;
 
  float innerRadius = 100;
  float outerRadius = 200;
  
  float minAngle = 0;
  float maxAngle = mouseX / float(width) * TWO_PI;


  for (int j = 0; j < numberOfDots; j++) {

    float randomangle = random(minAngle, maxAngle);   // Zufaelliger Winkel 

    float randomradius = map(random(0, 1), 0, 1, innerRadius, outerRadius); // Zufaelliger Radius zwischen innerRadius und outerRadius 

    float x = -sin(randomangle) * randomradius; 
    float y = cos(randomangle) * randomradius; 

    ellipse(x, y, 2, 2);
  }
}
