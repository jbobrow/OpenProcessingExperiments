
class Cylinder
{
float topRadius; 
float bottomRadius; 
float tall; 
int sides = 16;
PVector position;
PVector rotation;
  
  Cylinder(float _topRadius, float _bottomRadius, float _tall)
  {
    topRadius = _topRadius;
    bottomRadius = _bottomRadius;
    tall = _tall;
  }
  
  void render()
  {
    float angle = 0;
    float angleIncrement = TWO_PI / sides;
    pushMatrix();
    rotateX(PI);
    translate(0, -tall, 0);
    noStroke();
    beginShape(QUAD_STRIP);
    for (int i = 0; i < sides + 1; ++i) {
      vertex(topRadius*cos(angle), 0, topRadius*sin(angle));
      vertex(bottomRadius*cos(angle), tall, bottomRadius*sin(angle));
      angle += angleIncrement;
    }
    endShape();
    popMatrix();
  }
}

