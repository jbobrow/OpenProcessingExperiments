
class Circle{
   int meshCount = 8;
   PVector[] ring;
   //------------------------------------------------------------------------------------------------constractor
   Circle(int _meshCount){
     meshCount = _meshCount;
     ring = new PVector[meshCount];
   }
   //------------------------------------------------------------------------------------------------void Init()
   public void Init(float _z, float _r){
     for(int i = 0; i < meshCount; i++){
       ring[i] = new PVector(_r*cos(2*PI*i/meshCount), _r*sin(2*PI*i/meshCount), _z);
     }
   }
   //------------------------------------------------------------------------------------------------void angle()
   public void angle(float angle){
     /////////////////////////////////////////////////////////////////////////////////build angleMatrix
     PMatrix3D angleMatrix = new PMatrix3D(angle , 0,     0, 0,
                                          0,   angle,     0, 0,
                                          0,       0, angle, 0,
                                          0,       0,     0, 1);
     /////////////////////////////////////////////////////////////////////////////////build angleMatrix
     for(int i = 0; i < meshCount; i++){
       ring[i] = new PVector(ring[i].x*angleMatrix.m00 + ring[i].y*angleMatrix.m10 + ring[i].z*angleMatrix.m20,
                             ring[i].x*angleMatrix.m01 + ring[i].y*angleMatrix.m11 + ring[i].z*angleMatrix.m21,
                             ring[i].x*angleMatrix.m02 + ring[i].y*angleMatrix.m12 + ring[i].z*angleMatrix.m22);
     }
   }
   //------------------------------------------------------------------------------------------------void bend()
   public void bend(float bend){
     /////////////////////////////////////////////////////////////////////////////////build bendMatrix
     PMatrix3D bendMatrix = new PMatrix3D(cos(bend) , 0, -sin(bend), 0,
                                          0,          1,          0, 0,
                                          sin(bend),  0,  cos(bend), 0,
                                          0,          0,          0, 1);
     /////////////////////////////////////////////////////////////////////////////////build bendMatrix
     for(int i = 0; i < meshCount; i++){
       ring[i] = new PVector(ring[i].x*bendMatrix.m00 + ring[i].y*bendMatrix.m10 + ring[i].z*bendMatrix.m20,
                             ring[i].x*bendMatrix.m01 + ring[i].y*bendMatrix.m11 + ring[i].z*bendMatrix.m21,
                             ring[i].x*bendMatrix.m02 + ring[i].y*bendMatrix.m12 + ring[i].z*bendMatrix.m22);
     }
   }
   //------------------------------------------------------------------------------------------------void twist()
   public void twist(float twist){
     /////////////////////////////////////////////////////////////////////////////////build twistMatrix
     PMatrix3D twistMatrix = new PMatrix3D(cos(twist) , sin(twist),0, 0,
                                           -sin(twist), cos(twist),0, 0,
                                           0,           0,         1, 0,
                                           0,           0,         0, 1);
     /////////////////////////////////////////////////////////////////////////////////build twistMatrix
     for(int i = 0; i < meshCount; i++){
       ring[i] = new PVector(ring[i].x*twistMatrix.m00 + ring[i].y*twistMatrix.m10 + ring[i].z*twistMatrix.m20,
                             ring[i].x*twistMatrix.m01 + ring[i].y*twistMatrix.m11 + ring[i].z*twistMatrix.m21,
                             ring[i].x*twistMatrix.m02 + ring[i].y*twistMatrix.m12 + ring[i].z*twistMatrix.m22);
     }
   }
   //------------------------------------------------------------------------------------------------void displace()
   public void displace(float transX, float transZ){
     for(int i = 0; i < meshCount; i++){
       ring[i] = new PVector(ring[i].x+transX, ring[i].y, ring[i].z+transZ);
     }
   }
   //---------------------------------------------------------------------------------------------void renderPoint()
   public void renderPoint(int _j, PGraphics _pg){
     _pg.stroke(255,0,0);
     _pg.strokeWeight(5);
     _pg.point(ring[_j].x,ring[_j].y,ring[_j].z);
   }
}

