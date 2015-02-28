
class Cell {
  
  //-------------------------------------------------------Properties
  VerletParticle[] pts = new VerletParticle[0];
  VerletSpring[] springs = new VerletSpring[0];
  Vec3D origin;
  CellShape geo;
  
  //-------------------------------------------------------Constructor
  Cell(){
    float dim = random(30)-15;
    origin = new Vec3D(random(width),random(height),0);
    Vec3D p = new Vec3D(dim,dim,0);
    VerletParticle centreP = new VerletParticle(origin);
    physics.addBehavior(new AttractionBehavior(centreP, dim*3, -1f, 0));
    physics.addParticle(centreP);
    
    pts = (VerletParticle[]) append(pts, new VerletParticle(p.x+origin.x, p.y+origin.y, p.z+origin.z));
    pts = (VerletParticle[]) append(pts, new VerletParticle((-p.x)+origin.x, p.y+origin.y, p.z+origin.z));
    pts = (VerletParticle[]) append(pts, new VerletParticle((-p.x)+origin.x, (-p.y)+origin.y, p.z+origin.z));
    pts = (VerletParticle[]) append(pts, new VerletParticle(p.x+origin.x, (-p.y)+origin.y, p.z+origin.z));

    //test springs
    
    for (int i = 0; i<pts.length; i++){
        if (i==0){
           springs = (VerletSpring[]) append(springs, new VerletSpring(centreP,pts[0],centreP.distanceTo(pts[0]),0.01));
           springs = (VerletSpring[]) append(springs, new VerletSpring(pts[pts.length-1],pts[0],pts[pts.length-1].distanceTo(pts[i]),0.01));
        } else{
          springs = (VerletSpring[]) append(springs, new VerletSpring(centreP,pts[i],centreP.distanceTo(pts[i]),0.01));
          springs = (VerletSpring[]) append(springs, new VerletSpring(pts[i-1],pts[i],pts[i-1].distanceTo(pts[i]),0.01));
        }
    }
    
    init();
    
  }
  //-------------------------------------------------------Run
  void run(){
    geo = new CellShape(pts,new Vec3D(0,0,40),0.5);
    geo.render();
    render();
  }
  //-------------------------------------------------------Methods
  
  //draw
  void render(){
    for(VerletSpring s:springs){
      beginShape();
      vertex(s.a.x,s.a.y,s.a.z);
      vertex(s.b.x,s.b.y,s.b.z);
      endShape();
    }
  }
  
  //add to engine
  void init(){
    for (VerletParticle p:pts){
      physics.addParticle(p);
    }
    for(VerletSpring s:springs){
      physics.addSpring(s);
    }
  }
}

