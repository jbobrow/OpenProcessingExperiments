
class CircleTangent {
  Circle c=new Circle(width/2, height/2, height/20);
  PVector circlePoint;

  CircleTangent(float startX, float startY, Boolean isLeap) {
    circlePoint = new PVector(startX, startY);
  }

  void updateCircleTangent(float startX, float startY, Boolean isLeap) {
    noFill();
    smooth();
    stroke(255, 30);
    strokeWeight(1);
    circlePoint = new PVector(startX, startY);
    
    if(isLeap == false){
      Vec2D p=new Vec2D(circlePoint.x, circlePoint.y);
      if (mousePressed) {
        c.setRadius(p.distanceTo(c));
      }
      Line2D l=new Line2D(p, c);
      fill(255, 20);
      gfx.ellipse(c);
      gfx.line(p, c);
  
      Vec2D[] isec=c.getTangentPoints(p);
      if (isec!=null) {
        for (int i=0; i<2; i++) {
          gfx.ellipse(new Circle(isec[i], 5));
          gfx.ray(new Ray2D(p, isec[i].sub(p)), 2000);
          gfx.line(c, isec[i]);
        }
  
        gfx.ellipse(new Circle(l.getMidPoint(), l.getLength()/2));
      }
    }
    
    Vec2D m=new Vec2D(circlePoint.x, circlePoint.y);
    Vec2D o=new Vec2D(width/2,height/2);
    Vec2D n=m.sub(o).perpendicular().normalizeTo(100);
    Triangle2D t = new Triangle2D(o.sub(n),m,o.add(n));
    stroke(255, 30);
    gfx.triangle(t, true);
    
    noFill();
   
   if(isLeap == true){
     //gfx.ellipse(t.getCircumCircle());
   }
  }
}


