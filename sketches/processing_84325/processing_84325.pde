

/*
 * CirclePoints class
 */

public class CirclePoints{
  public Vec3D[] circle1;
  public Vec3D[] circle2;
  

  //
  // Constructors
  //

  public CirclePoints(Vec3D p1, Vec3D p2, float rad1, float rad2, float frac, int sides){
    Vec3D direction = p2.sub(p1);
    direction.normalize();
    Vec3D delta = p2.sub(p1).scale(frac);
    Vec3D perp = perpendicular(direction);
    Vec3D perp1 = perp.scale(rad1);
    Vec3D perp2 = perp.scale(rad2);
  
    float deltaAng = TWO_PI/float(sides);
    circle1 = new Vec3D[sides+1];
    circle2 = new Vec3D[sides+1];
    for(int i = 0; i < sides+1; i++){
      circle1[i] = new Vec3D(p1.x+delta.x+perp1.x, p1.y+delta.y+perp1.y, p1.z+delta.z+perp1.z);
      circle2[i] = new Vec3D(p2.x-delta.x+perp2.x, p2.y-delta.y+perp2.y, p2.z-delta.z+perp2.z);
      perp1.rotateAroundAxis(direction,deltaAng);
      perp2.rotateAroundAxis(direction,deltaAng);
    }
  }


  public CirclePoints(Vec3D p1, Vec3D p2, Vec3D pReference, float rad1, float rad2, float frac, int sides){
    Vec3D direction = p2.sub(p1);
    direction.normalize();
    Vec3D delta = p2.sub(p1).scale(frac);
    Vec3D perp = perpendicular(direction);
    Vec3D perp1 = perp.scale(rad1);
    Vec3D perp2 = perp.scale(rad2);
  
    int steps = 360*4;
    float deltaAng = TWO_PI/float(steps);
    Vec3D tempPerp1 = new Vec3D(perp1.x,perp1.y,perp1.z);
    float ang = 0;
    float minDistSq = 100000;
    for(int i = 0; i < steps; i++){
      Vec3D p = new Vec3D(p1.x+delta.x+tempPerp1.x, p1.y+delta.y+tempPerp1.y, p1.z+delta.z+tempPerp1.z);
      float distSq = sq(p.x-pReference.x) + sq(p.y-pReference.y) + sq(p.z-pReference.z);
      if(distSq < minDistSq){
        minDistSq = distSq;
        ang = i*deltaAng;
      } 
      tempPerp1.rotateAroundAxis(direction,deltaAng);
    }
    perp1.rotateAroundAxis(direction,ang);
    perp2.rotateAroundAxis(direction,ang);
    
    deltaAng = TWO_PI/float(sides);
    circle1 = new Vec3D[sides+1];
    circle2 = new Vec3D[sides+1];
    for(int i = 0; i < sides+1; i++){
      circle1[i] = new Vec3D(p1.x+delta.x+perp1.x, p1.y+delta.y+perp1.y, p1.z+delta.z+perp1.z);
      circle2[i] = new Vec3D(p2.x-delta.x+perp2.x, p2.y-delta.y+perp2.y, p2.z-delta.z+perp2.z);
      perp1.rotateAroundAxis(direction,deltaAng);
      perp2.rotateAroundAxis(direction,deltaAng);
    }
  }


  //
  // Class Methods 
  //


  // paint
  public void paint(color col){
    noStroke();
    fill(col);
    beginShape(TRIANGLE_STRIP);
      for(int i = 0; i < circle1.length; i++){
        vertex(circle1[i].x,circle1[i].y,circle1[i].z);
        vertex(circle2[i].x,circle2[i].y,circle2[i].z);
      }
    endShape(CLOSE);
  }


  // paintConnector
  void paintConnector(CirclePoints c, color col){
    noStroke();
    fill(col);
    beginShape(TRIANGLE_STRIP);
      for(int i = 0; i < circle1.length; i++){
        vertex(c.circle2[i].x,c.circle2[i].y,c.circle2[i].z);
        vertex(circle1[i].x,circle1[i].y,circle1[i].z);
      }
    endShape(CLOSE);
  }


  // getReference
  public Vec3D getReference(){
    return circle2[0].copy();
  }

  
  // perpendicular
  private Vec3D perpendicular(Vec3D p){
    Vec3D perp = new Vec3D();
    if(p.x != 0 && p.y != 0 && p.z != 0){
      perp.set(1,-p.x/p.y,0);
      perp.normalize();
    }
    else if(p.x == 0){
      perp.set(1,0,0);
    }
    else if(p.y == 0){
      perp.set(0,1,0);
    }
    else if(p.z == 0){
      perp.set(0,0,1);
    }

    return perp;
  }

}

