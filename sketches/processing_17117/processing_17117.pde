
class Popups extends ArrayList{
  
}
class Popup{
  Point3f origin;
  float width;
  float height;
  
  Point3f aP, bP, cP, dP, eP;
  float distAB, distDB, distCB;
  
  
  Popup(Point3f origin){
    this.origin = origin;
    this.width = cardWidth*4/3;
    this.height = cardHeight*2/3;
    
    //float vAngle = HALF_PI*5/6; //75 degree //map(origin.y, -cardHeight/2, cardHeight/2, HALF_PI/2, HALF_PI-SMALL_MARGIN);
    float y_displace = this.width/2*cosLUT(HALF_PI*5/6); //*cosLUT[(int)(75*SC_INV_PREC) % SC_PERIOD]; //*cos(vAngle); //map(origin.y, 0, cardHeight, width/2, SMALL_MARGIN);
    float x_displace = this.width/2*sinLUT(HALF_PI*5/6); //*sinLUT[(int)(75*SC_INV_PREC) % SC_PERIOD]; //*sin(vAngle); //sqrt(width*width/4 - y_displace*y_displace);
    
    aP = new Point3f(origin); //fixed
    bP = new Point3f(origin); 
    bP.z += this.height;
    cP = new Point3f(origin); //fixed
    cP.x += x_displace;
    cP.y -= y_displace;
    dP = new Point3f(origin); //fixed
    dP.x -= x_displace;
    dP.y -= y_displace;
    
    distAB = dist(aP, bP); //constant
    distDB = dist(dP, bP); //constant
    distCB = dist(cP, bP); //constant
  }
}

/*
  switch(mode){
    case SINGLE_SLIT:
      //Single-slit
      //     A
      //    /|\
      //   / | \
      //  /  |  \
      //D/___|___\ C
      //    B,E
      aP = new Point3f(            0, -cardHeight*.6/2, 0); //fixed
      bP = new Point3f(            0,  cardHeight*.6/2, 0);
      cP = new Point3f( cardWidth*.6,  cardHeight*.6/2, 0); //fixed
      dP = new Point3f(-cardWidth*.6,  cardHeight*.6/2, 0); //fixed
      eP = new Point3f(            0,  cardHeight*.6/2, 0);
      break;
  
    case V_FOLD:
      //V-fold (D,A,C cannot be colinear and B is not on the same plane with others.)
      //  ___B___
      // |   |   |
      // |   |   |
      // |   |   |
      //D|___|___| C
      //     A
      aP = new Point3f(            0, 20,   0); //fixed
      bP = new Point3f(            0, 20, 100);
      cP = new Point3f( cardWidth*.6,  0,   0); //fixed
      dP = new Point3f(-cardWidth*.6,  0,   0); //fixed
      break;
  
  }
  
  distAB = dist(aP, bP); //constant
  distDB = dist(dP, bP); //constant
  distCB = dist(cP, bP); //constant
*/

class Strokes extends ArrayList{
  
  Stroke getStroke(int i){
    return (Stroke) get(i);
  }
  
  void draw(){
    for(int i = 0; i < this.size(); i++){
      this.getStroke(i).draw();
    }
  }
  
}
class Stroke extends ArrayList{
  float length;
  
  Stroke(){
    length = 0.0;
  }
  
  Stroke clone(){
    Stroke s = new Stroke();
    for(int i = 0; i < this.size(); i++){
      s.add(this.getPoint(i));
    }
    return s;
  }
  
  void add(float x, float y){
    add(new Point2f(x, y));
  }
  void add(Point2f p){
    super.add(p);
    
    if(this.size() > 1){
      length += dist(this.getPoint(this.size()-2), this.getLastPt());
    }
  }
  
  Point2f getPoint(int i){
    return (Point2f) get(i);
  }
  Point2f getFirstPt(){
    return getPoint(0);
  }
  Point2f getLastPt(){
    return getPoint(this.size()-1);
  }
  
  void copyStroke(Stroke s, int startIndex, int endIndex){
    length -= dist(this.getPoint(startIndex-1), this.getPoint(startIndex));
    
    for(int i = startIndex; i <= endIndex; i++){
      length -= dist(this.getPoint(startIndex), this.getPoint(startIndex+1));
      this.remove(startIndex);
    }
    this.addAll(startIndex, s);
    //for(int i = 0; i < s.size(); i++){
    //  this.add(startIndex + i, s.getPoint(i));
    //}
    
    length += s.length + dist(this.getPoint(startIndex-1), s.getFirstPt()) + dist(this.getPoint(endIndex+1), s.getLastPt());
  }
  
  void draw(){
    stroke(255, 0, 0);
    fill(255, 0, 0);
    
    if(size() > 1){
      Point2f p = this.getPoint(0);
      Point2f q;
      
      for(int j = 1; j < this.size(); j++){
        q = this.getPoint(j);
        ellipse(p.x, p.y, 5, 5);
        line(p.x, p.y, q.x, q.y);
        p = q;
      }
    }
  }
  
}

