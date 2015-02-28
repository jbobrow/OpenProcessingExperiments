
class vAgentPredator extends vAgent{
   
 vAgentPredator(     
     Vec3D _pos, 
     Vec3D _vec, 
     float _maxVel,
     float _maxForce){
       
  super(
     _pos, 
     _vec, 
     _maxVel,
     _maxForce);
     
     drawColor = 0;
     agentType = "vAgentPredator";
     
     vel = new Vec3D(0,0,0);    
  }
 
  void step(vWorld world){ 
    updatePop(world.population);
    vel.addSelf(acc);
    vel.limit(maxVel);  
    pos.addSelf(vel);
    acc = new Vec3D(0,0,0);  // reset acc to 0 each iteration
    borders(envSize);
    render();
 }
 
  void updatePop(ArrayList pop){  
    
   // seek pray
   // find closest agent
   float closestDist = envSize*envSize;
   int closestAgent = 0;
   for(int i = 0; i<pop.size(); i++){
     vAgent other = (vAgent) pop.get(i);
     if(other.agentType == "vAgentPrey"){
       float dist = pos.distanceTo(other.pos);
       if(i > 0){
         if(dist < closestDist){
           closestDist = dist;
           closestAgent = i;
         }
           
       }else{
         closestDist = dist;
         closestAgent = 0;
       }
     }
   }
    
    // seek closest agent
    vAgent other = (vAgent) pop.get(closestAgent);
    Vec3D target = other.pos.copy();
    
    this.seek(target, 300);
  } 
 
 
  void render() {
    strokeWeight(2);
    stroke(0);
    Line3D l = new Line3D(pos,pos.add(vel.normalize().scale(10)));
    gfx.line(l);
    stroke(255,0,0);
    point(pos.x,pos.y,pos.z);
  }
  
}

