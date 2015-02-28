
class Axis3D{
  Point3D orig;
  Cylinder xaxis;
  Cylinder yaxis;
  Cylinder zaxis;
  Cone xtop;
  Cone ytop;
  Cone ztop;
  color yClr;
  color zClr;
  color xClr;
  int alen;
  
  
  Axis3D(Point3D o,int l,color xc,color yc,color zc){
    orig = o;
    xClr = xc;
    yClr = yc;
    zClr = zc;
    alen = l;
    xaxis = new Cylinder(orig,2,alen,12);
    xtop = new Cone(new Point3D(orig.x,orig.y+alen/2,orig.z),5,15,12);
    yaxis = new Cylinder(orig,2,alen,12);
    ytop = new Cone(new Point3D(orig.x,orig.y+alen/2,orig.z),5,15,12);
    zaxis = new Cylinder(orig,2,alen,12);
    ztop = new Cone(new Point3D(orig.x,orig.y+alen/2,orig.z),5,15,12);
    pushMatrix();
    xaxis.rotatez(-HALF_PI,orig);
    xtop.rotatez(-HALF_PI,orig);
    zaxis.rotatex(-HALF_PI,orig);
    ztop.rotatex(-HALF_PI,orig);
    zaxis.rotatey(-HALF_PI,orig);
    ztop.rotatey(-HALF_PI,orig);
    popMatrix();
  }
  
  void scale (float sx, float sy, float sz, Point3D ref) {
    xaxis.scale(sx,sy,sz,ref);
    xtop.scale(sx,sy,sz,ref);
    yaxis.scale(sx,sy,sz,ref);
    ytop.scale(sx,sy,sz,ref);
    zaxis.scale(sx,sy,sz,ref);
    ztop.scale(sx,sy,sz,ref);
  }
  
  void rotatex (float angle, Point3D ref) {
    xaxis.rotatex(angle,ref);
    xtop.rotatex(angle,ref);
    yaxis.rotatex(angle,ref);
    ytop.rotatex(angle,ref);
    zaxis.rotatex(angle,ref);
    ztop.rotatex(angle,ref);
  }
  
  void rotatey (float angle, Point3D ref) {
    xaxis.rotatey(angle,ref);
    xtop.rotatey(angle,ref);
    yaxis.rotatey(angle,ref);
    ytop.rotatey(angle,ref);
    zaxis.rotatey(angle,ref);
    ztop.rotatey(angle,ref);
  }
  
  void rotatez (float angle, Point3D ref) {
    xaxis.rotatez(angle,ref);
    xtop.rotatez(angle,ref);
    yaxis.rotatez(angle,ref);
    ytop.rotatez(angle,ref);
    zaxis.rotatez(angle,ref);
    ztop.rotatez(angle,ref);
  }
  
  void display(){
    pushStyle();
    fill(xClr);
    xaxis.display();
    xtop.display();
    fill(yClr);
    yaxis.display();
    ytop.display();
    fill(zClr);
    zaxis.display();
    ztop.display();
    popStyle();
  }
}

