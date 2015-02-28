
class Pt {
  UVec3 pos;
  
  // reference to nearest neigbhor object
  Pt neighbor;
  float rad,neighborDist;
  int col,id;
  boolean valid;
  
  Pt(float x,float y) {
    id=ptn;
    pos=new UVec3(x,y);    
    col=UColorTool.interpolate(random(1),"000000","CCFFFF");
    if(random(100)>90) col=color(255,0,random(100,200));
    
    // the valid flag indicates whether this Pt instance
    // was successfully placed
    valid=true;
    neighborDist=10000;
    
    // first point is max size and always valid
    if(pt.size()==0) {
      rad=maxRad*2;
      return;
    }
    
    // check point against existing ones
    for(Pt pp : pt) {
      float d=pp.pos.distanceTo(pos);

      // too close to other object?
      if(d<pp.rad/2) {
        valid=false;
        return;
      }
      
      // save data about neighboring point
      if(d-pp.rad/2<neighborDist) {
//        println(d+" "+neighborDist);
        neighborDist=d-pp.rad/2;
        neighbor=pp;
        rad=(neighborDist)*2;//-pp.rad/2;
      }
    }
    
    // if radius not in minRad...maxRad range this is a fail
    if(id>0 && (rad<minRad/2 || rad>maxRad/2)) {
//      println("Fail: rad too small or too large: "+rad);
      valid=false;
    }
    
    // if any part of circle will be off screen
    if(pos.x+rad/2>width || pos.x-rad/2<0 ||
      pos.y+rad/2>height || pos.y-rad/2<0) {
//        println("Fail: off screen "+rad);
        valid=false;
      }
      
//    println(pos.toString()+" "+rad+" "+valid);
  }
  
  void draw() {
    noStroke();
    fill(col);
    ellipse(pos.x,pos.y, rad,rad);
    
    // draw connection to neighbor
    stroke(255,150);
    if(neighbor!=null) 
      line(pos.x,pos.y, neighbor.pos.x,neighbor.pos.y);
  }
}

