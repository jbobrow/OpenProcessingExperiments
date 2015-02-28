
class CurveCircle {
  
  PVector pts[] = new PVector[BEZIER_NUM];
  ParticleSystem ps = new ParticleSystem(0.0, 0.05);
  Particle fixed_pts[] = new Particle[BEZIER_NUM];
  Particle flow_pts[] = new Particle[BEZIER_NUM];

  int rot_dir;
  int col;
  CurveCircle (float rad, int _col) {
    
    rot_dir=int(random(2));
    col = _col;
    
    pts[0]= new PVector(rad*cos(0), rad*sin(0));
    pts[1]= new PVector(rad*cos(0), rad*sin(HALF_PI));
    pts[2]= new PVector(rad*cos(HALF_PI), rad*sin(HALF_PI));
    pts[3]= new PVector(rad*cos(PI), rad*sin(HALF_PI));
    pts[4]= new PVector(rad*cos(PI), rad*sin(PI));
    pts[5]= new PVector(rad*cos(PI), rad*sin(HALF_PI*3));
    pts[6]= new PVector(rad*cos(HALF_PI*3), rad*sin(HALF_PI*3));
    pts[7]= new PVector(rad*cos(TWO_PI), rad*sin(HALF_PI*3));  
  
    for (int i=0; i<BEZIER_NUM; i++) {
      fixed_pts[i] = ps.makeParticle(1.0, pts[i].x, pts[i].y, 0);
      fixed_pts[i].makeFixed();
      flow_pts[i] = ps.makeParticle(1.0, pts[i].x, pts[i].y, 0);    
      ps.makeSpring(flow_pts[i], fixed_pts[i], 0.1, 0.4, 0.0);
    }
  }
  
  void update() {
      if (int(random(5))==0) {
    //    int cur_pts = int(random(4))*2+1;
        PVector vels[] = new PVector[BEZIER_NUM];
        int cur_pts = int(random(BEZIER_NUM));
        PVector vel = new PVector (random(-WIND_POWER, WIND_POWER), random(-WIND_POWER, WIND_POWER));
        for (int i=0; i<BEZIER_NUM; i++)
          vels[i]= new PVector(0,0);
        for (int i=1; i<NEIGHBOURGS_PTS+1; i++)
          vels[(cur_pts+i)%BEZIER_NUM]=PVector.mult(vel,DUMPING_COEFF/i);
        for (int i=-1; i>-NEIGHBOURGS_PTS-1; i--) {
          int cur_ptsi = cur_pts+i;
          vels[cur_ptsi<0 ? cur_ptsi+BEZIER_NUM : cur_ptsi]=PVector.mult(vel,DUMPING_COEFF/abs(i));      
        }
    
        for (int i=0; i<BEZIER_NUM; i++)
          flow_pts[i].velocity().add(vels[i].x, vels[i].y, 0);
    
     }
     ps.tick();
  }

  void display() {
    pushMatrix();
    translate(width/2, height/2);
    fill(col);
    if(rot_dir>0)    
      rotate(radians(frameCount % 360));
    else
      rotate(radians(-frameCount % 360));    
      
    beginShape();
    vertex(flow_pts[0].position().x() , flow_pts[0].position().y());
  
    bezierVertex(flow_pts[1].position().x() , flow_pts[1].position().y(), 
                 flow_pts[2].position().x() , flow_pts[2].position().y(), 
                 flow_pts[2].position().x() , flow_pts[2].position().y());
                 
    bezierVertex(flow_pts[3].position().x() , flow_pts[3].position().y(), 
       flow_pts[4].position().x() , flow_pts[4].position().y(), 
       flow_pts[4].position().x() , flow_pts[4].position().y());     
       
    bezierVertex(flow_pts[5].position().x() , flow_pts[5].position().y(), 
       flow_pts[6].position().x() , flow_pts[6].position().y(), 
       flow_pts[6].position().x() , flow_pts[6].position().y());     
  
    bezierVertex(flow_pts[7].position().x() , flow_pts[7].position().y(), 
       flow_pts[0].position().x() , flow_pts[0].position().y(), 
       flow_pts[0].position().x() , flow_pts[0].position().y());            
       
  //  bezierVertex(-50, 60, -50, 120, 0, 120);
    endShape(CLOSE);
    popMatrix();
  }
}

