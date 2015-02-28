
//------ ARROW ------//
//arrows are mostly used for rendering vectors and things in 3d :: they're not very effecient for every-frame rendering
class Arrow extends Segment{
  Point p3,p4,p5,p6;
  float arrow_size = 10;
  Arrow(Point $p1,Point $p2){
    super($p1,$p2);
    p3 = new Point(p1.x+l-arrow_size,p1.y+arrow_size/2,p1.z);
    p4 = new Point(p1.x+l-arrow_size,p1.y-arrow_size/2,p1.z);
    p5 = new Point(p1.x+l-arrow_size,p1.y,p1.z+arrow_size/2);
    p6 = new Point(p1.x+l-arrow_size,p1.y,p1.z-arrow_size/2);
    step();
  }
  void step(){
    l = get_length();
    float rz = atan2(p2.y-p1.y,p2.x-p1.x);
    Point temp = new Point(0,0,0);
    temp.match(p2);
    temp.rotate(cos(-rz),sin(-rz),"z",p1.x,p1.y,p1.z);
    float azi = atan2(temp.z-p1.z,temp.x-p1.x);
    float cosa1 = cos(azi);
    float sina1 = sin(azi);
    float cosa2 = cos(rz);
    float sina2 = sin(rz);
    p3.move_to(p1.x+l-arrow_size,p1.y+arrow_size/2,p1.z);
    p3.rotate(cosa1,sina1,"y",p1.x,p1.y,p1.z);
    p3.rotate(cosa2,sina2,"z",p1.x,p1.y,p1.z);
    p4.move_to(p1.x+l-arrow_size,p1.y-arrow_size/2,p1.z);
    p4.rotate(cosa1,sina1,"y",p1.x,p1.y,p1.z);
    p4.rotate(cosa2,sina2,"z",p1.x,p1.y,p1.z);
    p5.move_to(p1.x+l-arrow_size,p1.y,p1.z+arrow_size/2);
    p5.rotate(cosa1,sina1,"y",p1.x,p1.y,p1.z);
    p5.rotate(cosa2,sina2,"z",p1.x,p1.y,p1.z);
    p6.move_to(p1.x+l-arrow_size,p1.y,p1.z-arrow_size/2);
    p6.rotate(cosa1,sina1,"y",p1.x,p1.y,p1.z);
    p6.rotate(cosa2,sina2,"z",p1.x,p1.y,p1.z);
  }
  void render(){
    super.render();
    pg.beginShape(TRIANGLE_STRIP);
    pg.vertex(p3.x,p3.y,p3.z);
    pg.vertex(p2.x,p2.y,p2.z);
    pg.vertex(p5.x,p5.y,p5.z);
    pg.vertex(p2.x,p2.y,p2.z);
    pg.vertex(p4.x,p4.y,p4.z);
    pg.vertex(p2.x,p2.y,p2.z);
    pg.vertex(p6.x,p6.y,p6.z);
    pg.vertex(p2.x,p2.y,p2.z);
    pg.vertex(p3.x,p3.y,p3.z);
    pg.endShape();
    pg.beginShape();
    pg.vertex(p3.x,p3.y,p3.z);
    pg.vertex(p5.x,p5.y,p5.z);
    pg.vertex(p4.x,p4.y,p4.z);
    pg.vertex(p6.x,p6.y,p6.z);
    pg.endShape(CLOSE);
  }
}

