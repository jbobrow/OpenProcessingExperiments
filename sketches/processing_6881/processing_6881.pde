
class Bisector{
  Line l;
  Bisector(Point $p1,Point $p2){
    Point midpoint = new Point(($p1.x+$p2.x)/2,($p1.y+$p2.y)/2,($p1.z+$p2.z)/2);
    Point p3 = new Point(midpoint.x-($p2.y-$p1.y),midpoint.y+($p2.x-$p1.x),0);
    Point p4 = new Point(midpoint.x+($p2.y-$p1.y),midpoint.y-($p2.x-$p1.x),0);
    l = new Line(p3,p4);
  }
}

