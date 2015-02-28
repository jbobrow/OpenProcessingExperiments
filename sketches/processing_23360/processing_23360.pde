
public class Asteroid extends Object3D {

  float R;
  PVector position;
  PVector rotation;
  PVector actualRotation = new PVector();
  PVector direction = new PVector();
  Torus torus;

  Asteroid(int xDiv, int yDiv, float R, PImage tex, PVector position, PVector direction, Torus torus) {
    super(xDiv, yDiv, 0, 2 * (float)Math.PI, 0, (float)Math.PI, tex);
    this.R = R;
    this.position = position;
    this.rotation = new PVector(random(-0.1, 0.1), random(-0.1, 0.1), random(-0.1, 0.1));
    this.torus = torus;
    this.direction = direction;
    this.direction.normalize();
  }
  
  //Returns 3D position vector in object coordinates from x,y coordinates
  //in domain space
  PVector phi(double x, double y) {
    double a = x / (phiMax - phiMin) * 2 * Math.PI*2, b = y / (thetaMax - thetaMin) * 2 * Math.PI*2;   
    float r = (float)(R/16 * Math.sin(a) * Math.cos(b)) + R/2;
    return new PVector((float)(r * Math.sin(x) * Math.cos(y)), r * (float)Math.cos(x), (float)(r * Math.sin(x) * Math.sin(y)));
  }

  //Returns normal vector based on phi function derivate
  PVector dPhi(double x, double y) {    
    //Set the north pole vector. In ths case the cross product cannot be computed
    if (Math.abs(x) < 1e-5)
      return new PVector(0, 1, 0);

    double a = x / (phiMax - phiMin) * 2 * Math.PI*2, b = y / (thetaMax - thetaMin) * 2 * Math.PI*2;   
    float r = (float)(R/16 * Math.sin(a) * Math.cos(b)) + R/2;

    //dPhi is computed as the cross product between the gradients
    PVector v = new PVector(-(float)(r * Math.sin(y) * Math.sin(x)), 0, (float)(r * Math.sin(x) * Math.cos(y)))
      .cross(new PVector((float)(r * Math.cos(x) * Math.cos(y)),
      -r * (float)Math.sin(x), (float)(r * Math.sin(y) * Math.cos(x))));
    v.normalize();
    return v;
  }

  void draw() {
    //Draw the asteroid
    pushMatrix();
      translate(position.x, position.y, position.z);
      rotateX(actualRotation.x += rotation.x);
      rotateY(actualRotation.y += rotation.y);
      rotateZ(actualRotation.z += rotation.z);
      super.draw();
    popMatrix();

    PVector collisionPoint = new PVector();
    if(checkCollisions(collisionPoint)){      
      double h = Math.sqrt(position.z * position.z + position.x * position.x) - torus.getR(), theta = Math.atan2(position.y, -h);
      if(theta < 0)
        theta += 2 * (float)Math.PI;
            
      double phi = Math.atan2(position.z, position.x);
      if(phi < 0)
        phi += 2 * (float)Math.PI;      
      
      PVector dPhi = torus.dPhi(phi, theta);
      
      direction.x -= dPhi.x;
      direction.y -= dPhi.y;
      direction.z -= dPhi.z;
      direction.normalize();
    }   
  
    //Move the object according to the direction vector
    position.x += direction.x * 40;
    position.y += direction.y * 40;
    position.z += direction.z * 40;
  }

  boolean checkCollisions(PVector collisionPoint) {
    float phi = (float)Math.atan2(position.z, position.x);
    if(phi < 0)
      phi += 2 * (float)Math.PI;
        
    PVector torusVector = torus.phi(phi, 0, torus.getR(), 0);
    
    //Compute the direction vector from torus axis to asteroid position
    PVector direction = new PVector(position.x - torusVector.x, position.y - torusVector.y, position.z - torusVector.z);
    direction.normalize();
    
    collisionPoint.x = position.x + direction.x * R;
    collisionPoint.y = position.y + direction.y * R;
    collisionPoint.z = position.z + direction.z * R;
    if(PVector.dist(collisionPoint, torusVector) > torus.getr())
      return true;
       
    return false;
  }
}


