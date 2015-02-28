
import java.util.Vector;
import processing.core.PMatrix3D;

class Extrusion{
  
  float topRadius,bottomRadius,tall,sides;
  int pointsNum;
  PVector[] points;
  
  Extrusion(){}
  
  Extrusion(float topRadius, float bottomRadius, PVector[] points, int sides) {
    this.topRadius = topRadius;
    this.bottomRadius = bottomRadius;
    this.points = points;
    this.pointsNum = points.length;
    this.sides = sides;
  }
  
  void draw() {
    if(pointsNum >= 2){  
      float angle = 0;
      float angleIncrement = TWO_PI / sides;

      //begin draw segments between caps
      angle = 0;
      for(int i = 1; i < pointsNum ; ++i){
        beginShape(QUAD_STRIP);
        float angleBetweenNextAndPrevious = 0.0;
        if(i < pointsNum - 1) angleBetweenNextAndPrevious = PVector.angleBetween(points[i],points[i+1]);
        else                  angleBetweenNextAndPrevious = PVector.angleBetween(points[1],points[pointsNum-1]);
        PVector s = new PVector(0,0,1);
        PVector s2 = new PVector(0,0,1);
        PVector cn = new PVector();
        PVector cn2 = new PVector();
        points[i-1].normalize(cn);
        points[i].normalize(cn2);
        PVector r = s.cross(cn);
        PVector r2 = s.cross(cn2);
        PMatrix3D rot = new PMatrix3D(1,0,0,0,
                                      0,1,0,0,
                                      0,0,1,0,
                                      0,0,0,1);
        PMatrix3D rot2 = new PMatrix3D(1,0,0,0,
                                       0,1,0,0,
                                       0,0,1,0,
                                       0,0,0,1);

        rot.rotate(angleBetweenNextAndPrevious,r.x,r.y,r.z);
        rot2.rotate(angleBetweenNextAndPrevious,r2.x,r2.y,r2.z);
        PVector rotVec = new PVector();
        PVector rotVec2 = new PVector();

        for(int j = 0; j < sides + 1; j++){
          // I am still not sure about this. Should the shape be in the xy plane 
          // if the extrusion is mainly along the z axis? If the shape is now in
          // the xz plane, you need to use (0,1,0) as normal vector of the shape
          // (this would be s and s2 above, don't use the short names I have
          // used, sorry)
          PVector shape = new PVector(cos(angle) * topRadius,0,sin(angle) * topRadius);

          rot.mult(shape, rotVec);
          rot2.mult(shape,rotVec2);

          rotVec.add(points[i-1]);
          rotVec2.add(points[i]);

          vertex(rotVec.x,rotVec.y,rotVec.z);
          vertex(rotVec2.x,rotVec2.y,rotVec2.z);
          //vertex(points[i-1].x + cos(angle) * topRadius, points[i-1].y, points[i-1].z + sin(angle) * topRadius);
          //vertex(points[i].x + cos(angle) * bottomRadius, points[i].y, points[i].z + sin(angle) * bottomRadius);

          angle += angleIncrement;
          }
        endShape();
      }
      //begin draw segments between caps
    }else println("Not enough points: " + pointsNum);
  }

  /*void draw() {
    if(pointsNum >= 2){  
      float angle = 0;
      float angleIncrement = TWO_PI / sides;

      //begin draw segments between caps
      angle = 0;
      for(int i = 1; i < pointsNum ; ++i){
        beginShape(QUAD_STRIP);
        float angleBetweenNextAndPrevious = 0.0;
        if(i < pointsNum - 1) angleBetweenNextAndPrevious = PVector.angleBetween(points[i],points[i+1]);
        else                  angleBetweenNextAndPrevious = PVector.angleBetween(points[1],points[pointsNum-1]);
        PVector s = new PVector(1,1,0);
        PVector s2 = new PVector(1,1,0);
        PVector cn = new PVector();
        PVector cn2 = new PVector();
        points[i-1].normalize(cn);
        points[i].normalize(cn2);
        PVector r = s.cross(cn);
        PVector r2 = s.cross(cn2);
        PMatrix3D rot = new PMatrix3D(1,0,0,0,
                                      0,1,0,0,
                                      0,0,1,0,
                                      0,0,0,1);
        PMatrix3D rot2 = new PMatrix3D(1,0,0,0,
                                       0,1,0,0,
                                       0,0,1,0,
                                       0,0,0,1);

        rot.rotate(angleBetweenNextAndPrevious,r.x,r.y,r.z);
        rot2.rotate(angleBetweenNextAndPrevious,r2.x,r2.y,r2.z);
        PVector rotVec = new PVector();
        PVector rotVec2 = new PVector();

        for(int j = 0; j < sides + 1; j++){   
          rot.mult(points[i-1],rotVec);


          // I am not sure about this. Should the shape be in the xy plane 
          // if the extrusion is mainly along the z axis? If the shape is now in
          // the xz plane, you need to use (0,1,0) as normal vector of the shape
          // (this would be s and s2 above, don't use the short names I have
          // used, sorry)
          rotVec.add(new PVector(cos(angle) * topRadius,0,sin(angle) * topRadius));
          rot2.mult(points[i],rotVec2);
          rotVec2.add(new PVector(cos(angle) * topRadius,0,sin(angle) * topRadius));

          vertex(rotVec.x,rotVec.y,rotVec.z);
          vertex(rotVec2.x,rotVec2.y,rotVec2.z);
          //vertex(points[i-1].x + cos(angle) * topRadius, points[i-1].y, points[i-1].z + sin(angle) * topRadius);
          //vertex(points[i].x + cos(angle) * bottomRadius, points[i].y, points[i].z + sin(angle) * bottomRadius);

          angle += angleIncrement;
          }
        endShape();
      }
      //begin draw segments between caps
    }else println("Not enough points: " + pointsNum);
  }*/
}


