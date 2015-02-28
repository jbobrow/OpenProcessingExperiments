
class DrawLine {
  float lineAlpha = 40;
  float getDistance;

  DrawLine(float x, float y, float mx, float my){
    strokeWeight(1);
    stroke(200,100,0,150);
    line(x,y,mx,my);
  }

  void update(float x,float y,float mx,float my){
    strokeWeight(int(random(4))+1);
    stroke(100,100,255,150);
    if (mousePressed) {
      int rx = mouseX;  // cursor
      int ry = mouseY;
      float radius = dist(x,y,rx,ry);  // distance from particle to cursor
      getDistance = radius;
      if (radius <= radiusLimit) {  // trigger distance
        strokeWeight(int(random(4))+2);
        stroke(100,100,255,lineAlpha);
        noFill();
        float qAmount = random(20)-10;
        float q = x + random(qAmount);
        float qq = y + random(qAmount);
        float qqq = mx + random(qAmount);
        float qqqq = my + random(qAmount);
        bezier(x,y,q,qq,qqq,qqqq,mx,my);
        strokeWeight(1);
        stroke(255,lineAlpha);
        bezier(x,y,q,qq,qqq,qqqq,mx,my);
      }
    if (radius <= radiusLimit + ((width+height)/2)) { 
      strokeWeight(1);
    stroke(255,random(3,5));
    noFill();
    line(x,y,mx,my);
    }
    }
    if (getDistance <= radiusLimit + ((width+height)/2)) { 
      strokeWeight(int(random(4))+1);
    stroke(100,100,255,random(3,5));
    noFill();
    line(x,y,mx,my);
      }
  }

}





