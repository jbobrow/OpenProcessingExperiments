
class Cylinder
{
  
  float topRadius;
  float bottomRadius;
  float branchHeight;
  int sides = 16;
   
  Cylinder(float _topRadius, float _bottomRadius, float _branchHeight)
  {
    topRadius = _topRadius;
    bottomRadius = _bottomRadius;
    branchHeight = _branchHeight;
  }
   
  void render() // Renders the cylinder
  {
    float angle = 0;
    float angleIncrement = TWO_PI / sides;
    pushMatrix();
    rotateX(PI);
    translate(0, -branchHeight, 0);
    noStroke(); // No outlining needed for the tree
    beginShape(QUAD_STRIP);
    for (int i = 0; i < sides + 1; ++i) { // Pieces quadrilateral srips together to form a cylinder
      vertex(topRadius * cos(angle), 0, topRadius * sin(angle));
      vertex(bottomRadius * cos(angle), branchHeight, bottomRadius * sin(angle));
      angle += angleIncrement;
    }
    endShape();
    popMatrix();
  }
  
}


