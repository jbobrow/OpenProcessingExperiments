
class Cylinder
{
float topRadius; 
float bottomRadius; 
int sides = 30;
Particle a;
Particle b;

  Cylinder(float _topRadius, float _bottomRadius, Particle _a, Particle _b)
  {
    a = _a;
    b = _b;
    topRadius =_topRadius;
    bottomRadius = _bottomRadius;
  }

  void render()
  {
    float angle = 0;
    float angleIncrement = TWO_PI / sides;
    PVector c = new PVector(a.position().x()-b.position().x(),a.position().y()-b.position().y(),a.position().z()-b.position().z());
    float h = dist(0,0,0,c.x,c.y,c.z);   
    
    float r = sqrt(pow(c.x,2)+pow(c.y,2)+pow(c.z,2));
    float theta = atan2(c.y,c.x);
    float phi = acos(c.z/r);
    
    pushMatrix();
    translate(b.position().x(),b.position().y(),b.position().z());
    rotateZ(theta);
    rotateY(phi);
    rotateX(-HALF_PI);
    beginShape(QUAD_STRIP);
    texture(skin);
    for (int i = 0; i < sides + 1; ++i) {
    float u = skin.width / sides * i;  
    vertex(bottomRadius*cos(angle), h, bottomRadius*sin(angle), u, 0);
    vertex(topRadius*cos(angle), -1, topRadius*sin(angle), u, skin.height);
    angle += angleIncrement;
    }
    endShape();
    popMatrix();
  }
}

