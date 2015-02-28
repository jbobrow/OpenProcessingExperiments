
void setup() {
  size(500, 500); 
  smooth();
} 


void draw() {
  background(0);

  PVector light = new PVector(mouseX, mouseY);
  PVector facet = new PVector(width/2, height - 50);
  PVector target = new PVector(width - 50, height / 2);

  noFill();

  stroke(255);
  ellipse(light.x, light.y, 20, 20);
  ellipse(target.x, target.y, 20, 20);
  ellipse(facet.x, facet.y, 30, 15);


  PVector facetToLight = new PVector();
  facetToLight.set(light);
  facetToLight.sub(facet);
  facetToLight.normalize();

  PVector facetToTarget = new PVector();
  facetToTarget.set(target);
  facetToTarget.sub(facet);
  facetToTarget.normalize();

  drawVector(facet, facetToTarget, 150);
  drawVector(facet, facetToLight, 150);

  PVector direction = new PVector();
  direction.set(facetToTarget);
  direction.add(facetToLight);
  direction.normalize();

  stroke(255, 0, 0);
  drawVector(facet, direction, 100);


  PVector tangent = new PVector();
  tangent.x = direction.y;
  tangent.y = -direction.x;

  stroke(0, 255, 0);
  drawVector(facet, tangent, -20);
  drawVector(facet, tangent, 20);
}

/* Visualize a vector at a specific point */
void drawVector(PVector point, PVector direction, float length) {
  ellipseMode(CENTER);
  ellipse(point.x, point.y, 5, 5);  
  line(point.x, point.y, point.x + direction.x * length, point.y + direction.y * length);
}
