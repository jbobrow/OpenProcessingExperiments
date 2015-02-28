
//------ ARROW ------//
//arrows are mostly used for rendering vectors and things in 3d :: they're not very effecient for every-frame rendering
class Arrow extends Segment{
  Point p3,p4,p5,p6;
  float arrow_size = 10;
  Arrow(Point $p1,Point $p2){
    super($p1,$p2);
    p3 = new Point(p1.pos.x+l-arrow_size,p1.pos.y+arrow_size/2,p1.pos.z);
    p4 = new Point(p1.pos.x+l-arrow_size,p1.pos.y-arrow_size/2,p1.pos.z);
    p5 = new Point(p1.pos.x+l-arrow_size,p1.pos.y,p1.pos.z+arrow_size/2);
    p6 = new Point(p1.pos.x+l-arrow_size,p1.pos.y,p1.pos.z-arrow_size/2);
    step();
  }
  void step(){
    l = get_length();
    float rz = atan2(p2.pos.y-p1.pos.y,p2.pos.x-p1.pos.x);
    Point temp = new Point(0,0,0);
    temp.match(p2);
    temp.rotate(cos(-rz),sin(-rz),"z",p1.pos);
    float azi = atan2(temp.pos.z-p1.pos.z,temp.pos.x-p1.pos.x);
    float cosa1 = cos(azi);
    float sina1 = sin(azi);
    float cosa2 = cos(rz);
    float sina2 = sin(rz);
    p3.move_to(new PVector(p1.pos.x+l-arrow_size,p1.pos.y+arrow_size/2,p1.pos.z));
    p3.rotate(cosa1,sina1,"y",p1.pos);
    p3.rotate(cosa2,sina2,"z",p1.pos);
    p4.move_to(new PVector(p1.pos.x+l-arrow_size,p1.pos.y-arrow_size/2,p1.pos.z));
    p4.rotate(cosa1,sina1,"y",p1.pos);
    p4.rotate(cosa2,sina2,"z",p1.pos);
    p5.move_to(new PVector(p1.pos.x+l-arrow_size,p1.pos.y,p1.pos.z+arrow_size/2));
    p5.rotate(cosa1,sina1,"y",p1.pos);
    p5.rotate(cosa2,sina2,"z",p1.pos);
    p6.move_to(new PVector(p1.pos.x+l-arrow_size,p1.pos.y,p1.pos.z-arrow_size/2));
    p6.rotate(cosa1,sina1,"y",p1.pos);
    p6.rotate(cosa2,sina2,"z",p1.pos);
  }
  void render(PGraphics $pg){
    super.render($pg);
    $pg.beginShape(TRIANGLE_STRIP);
    $pg.vertex(p3.pos.x,p3.pos.y,p3.pos.z);
    $pg.vertex(p2.pos.x,p2.pos.y,p2.pos.z);
    $pg.vertex(p5.pos.x,p5.pos.y,p5.pos.z);
    $pg.vertex(p2.pos.x,p2.pos.y,p2.pos.z);
    $pg.vertex(p4.pos.x,p4.pos.y,p4.pos.z);
    $pg.vertex(p2.pos.x,p2.pos.y,p2.pos.z);
    $pg.vertex(p6.pos.x,p6.pos.y,p6.pos.z);
    $pg.vertex(p2.pos.x,p2.pos.y,p2.pos.z);
    $pg.vertex(p3.pos.x,p3.pos.y,p3.pos.z);
    $pg.endShape();
    $pg.beginShape();
    $pg.vertex(p3.pos.x,p3.pos.y,p3.pos.z);
    $pg.vertex(p5.pos.x,p5.pos.y,p5.pos.z);
    $pg.vertex(p4.pos.x,p4.pos.y,p4.pos.z);
    $pg.vertex(p6.pos.x,p6.pos.y,p6.pos.z);
    $pg.endShape(CLOSE);
  }
}

