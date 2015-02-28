
class splineFollower{
  import toxi.geom.*;
  
  float speed = 0;
  float t = 0;
  Vec2D location = new Vec2D(0,0);
  splinePath path;
  
  splineFollower(splinePath p, float s)
  {
    path = p;
    speed = s;
  }
  
  void draw()
  {
  speed = (5.0f/(width - path.splineSegments.get(path.splineSegments.size()-1).x ))*(mouseX - path.splineSegments.get(path.splineSegments.size()-1).x);
  //Speed = mouseX from last segment point (+ and -);
  t += speed;
  
  //This is "meant" to interpolate between the points  
  float a0 = 0;
  float a1 = 0;
  Vec2D t0 = new Vec2D(0,0);
  Vec2D t1 = new Vec2D(0,0);
  float a = a0 + t;
  
    for(int i = 0; i < path.splineSegments.size()-1; i++){
    if(i < t){
      a0 = i;
      t0 = path.splineSegments.get(i);}
    if(i > t && i < t + 1){
      a1 = i;
      t1 = path.splineSegments.get(i);}
    }
    
  float tX = t0.x + ((a - a0) / (a1 - a0)) * (t1.x - t0.x);
  float tY = t0.y + ((a - a0) / (a1 - a0)) * (t1.y - t0.y); 
  
  DecimalFormat df = new DecimalFormat("#.000");
  textAlign(LEFT);
  text("speed: " + df.format(speed), path.splineSegments.get(path.splineSegments.size()-1).x+10,path.splineSegments.get(path.splineSegments.size()-1).y);
  fill(255,75);
  
  ellipse(tX, tY, 20, 20);
  }
}

