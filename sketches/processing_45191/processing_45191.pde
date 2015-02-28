
class Cube {
  float w=0, h=0, d=0;
  float tw=0, th=0, td=0;
  float x=0, y=0, z=0;
  
  PVector p1=new PVector(), p2=new PVector(), p3=new PVector(), p4=new PVector(), p5=new PVector(), p6=new PVector(), p7=new PVector(), p8=new PVector();
  PVector points[] = {p1,p2,p3,p4,p5,p6,p7,p8};
  
  Cube(float x, float y,float z, float w, float h, float d) {
    //println("Cube > .");
    
    this.tw = w;
    this.th = h;
    this.td = d;

    this.x = x;
    this.y = y;
    this.z = z;

    computeVertex();
  }

  void computeVertex() {
    //upper
    p1.x = x;
    p1.y = y;
    p1.z = z;

    p2.x = x+w;
    p2.y = y;
    p2.z = z;
    
    p3.x = x+w;
    p3.y = y;
    p3.z = z+d;

    p4.x = x;
    p4.y = y;
    p4.z = z+d;

    // lower
    p5.x = x;
    p5.y = y+h;
    p5.z = z;

    p6.x = x+w;
    p6.y = y+h;
    p6.z = z;

    p7.x = x+w;
    p7.y = y+h;
    p7.z = z+d;

    p8.x = x;
    p8.y = y+h;
    p8.z = z+d;
  }

  void draw() {        
    beginShape(QUADS);
    vertex(p1.x, p1.y, p1.z);
    vertex(p2.x, p2.y, p2.z);
    vertex(p3.x, p3.y, p3.z);
    vertex(p4.x, p4.y, p4.z);
    endShape();
    
    beginShape(QUADS);
    vertex(p5.x, p5.y, p5.z);
    vertex(p6.x, p6.y, p6.z);
    vertex(p7.x, p7.y, p7.z);
    vertex(p8.x, p8.y, p8.z);
    endShape();
    
    beginShape(QUADS);
    vertex(p1.x, p1.y, p1.z);
    vertex(p4.x, p4.y, p4.z);
    vertex(p8.x, p8.y, p8.z);
    vertex(p5.x, p5.y, p5.z);
    endShape();
    
    beginShape(QUADS);
    vertex(p1.x, p1.y, p1.z);
    vertex(p5.x, p5.y, p5.z);
    vertex(p6.x, p6.y, p6.z);
    vertex(p2.x, p2.y, p2.z);
    endShape();
    
    beginShape(QUADS);
    vertex(p2.x, p2.y, p2.z);
    vertex(p3.x, p3.y, p3.z);
    vertex(p7.x, p7.y, p7.z);
    vertex(p6.x, p6.y, p6.z);
    endShape();
    
    beginShape(QUADS);
    vertex(p4.x, p4.y, p4.z);
    vertex(p3.x, p3.y, p3.z);
    vertex(p7.x, p7.y, p7.z);
    vertex(p8.x, p8.y, p8.z);
    endShape();
  }

  boolean update(float x, float y, float z) {
    boolean flag = true;
    float delta;
    
    this.x = x;
    this.y = y;
    this.z = z;
    //println(this.y);

    // easing!
    delta = tw - w;
    if (abs(delta)>0.1) {
      w += delta*easing;
      flag = flag&&false;
    } 

    delta = th-h;
    if (abs(delta)>0.1) {
      h += delta*easing;
      flag = flag&&false;
    }

    delta = td-d;
    if (abs(delta)>0.01) {
      d += delta*easing;
      flag = flag&&false;
    }
    
    computeVertex();

    return flag;
  }
}


