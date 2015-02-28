
class kAgent{ 
 
  // variable or states 
  kVec acc; // temporary vector calculated each step 
  kVec vel; // speed and direction it is currently heading 
  kVec pos; // where the agent is 
  kVec nextpos; 
  kVec hitpos;
  float maxForce; // how fast the agent can turn 
  float maxVel;   // how fast the agent can move  
  float rangeOfVision = 50; 
  int fillColor; 

  // constructor 
  kAgent(kVec _pos, kVec _vel, float _maxForce, float _maxVel){ 
    pos = _pos; 
    vel = _vel; 
    maxForce = _maxForce; 
    maxVel = _maxVel; 
    acc = new kVec(0,0); 
 
    //fillColor = int(random(255)); 
    fillColor = 255; 
    //println(fillColor); 
    //fillColor = color(int(random(255)), int(random(255)), int(random(255))); 
  } 
  
   // behaviors 
 
  // update - adds together all the vectors and moves the agent 
void update(kWorld world){
    world1.addTrail(new kTrail( kVec.clone(pos) )); 
    kVec attMove = attractorMove(world.attractors);
    kVec att1Move = attractor1Move(world.attractors1);
    kVec att2Move = attractor2Move(world.attractors2);
    kVec att3Move = attractor3Move(world.attractors3);
    kVec att4Move = attractor4Move(world.attractors4);
    kVec att5Move = attractor5Move(world.attractors5);
    kVec att6Move = attractor6Move(world.attractors6);
 // We accumulate a new acceleration each time based on three rules    
    kVec sep = seperate(world.population); 
    kVec ali = align(world.population); 
    kVec coh = cohesion(world.population);  
  
    // weight - scale  
    sep.scale(30.0); 
    ali.scale(0.5); 
    coh.scale(1.0); 
    
    attMove.scale(10.0); 
    att1Move.scale(10.0); 
    att2Move.scale(10.0);
    att3Move.scale(10.0); 
    att4Move.scale(10.0); 
    att5Move.scale(10.0);
    att6Move.scale(10.0);
    
    // add to acc 
    acc.plus(sep); 
    acc.plus(ali); 
    acc.plus(coh); 
    acc.plus(attMove); 
    acc.plus(att1Move);
    acc.plus(att2Move);
    acc.plus(att3Move); 
    acc.plus(att4Move);
    acc.plus(att5Move);    
    acc.plus(att6Move); 
    
    // add acc to vel 
    vel.plus(acc); 
    // limit to maxVel 
    vel.limit(maxVel); 
    // add vel to pos 
    pos.plus(vel); 
    // reset the acc to 0 
    acc = new kVec(0,0);
    //LEER COLOR MAR
    borders(); 
    noSea();
    }
    
  //kVecATTRACTORMOVE 
  kVec attractorMove(ArrayList attractors){ 
 
    kVec dir = new kVec(0,0,0); 
    float closeAttDist = 999999999; 
    int closestAtt = 0; 
    float closestRange = 100; 
 
    // loop through all the attractors 
    for(int i = 0; i < attractors.size(); i++){ 
      kAttractor att = (kAttractor) attractors.get(i); 
      kVec attPosition = kVec.clone(att.pos); 
      float attDist = attPosition.distance(pos); 
    if(attDist < closeAttDist){ 
        closeAttDist = attDist; 
        closestAtt = i; 
        closestRange = att.range; 
      } 
    } 
    // do something - move 
    if(closeAttDist < closestRange){ 
      // modify direction - vector to move away from the attractor 
      kAttractor att = (kAttractor) attractors.get(closestAtt); 
      //get vector 
      kVec attTarget =  kVec.clone(att.pos); 
      attTarget.minus(pos); 
      attTarget.limit(maxVel); 
      //attTarget.invert(); 
      stroke(170, 139, 123); 
      line( pos.x, pos.y,att.pos.x, att.pos.y); 
      dir = kVec.clone(attTarget); 
    }
   
    return dir; 
  }
  
   //kVecATTRACTOR1MOVE
   kVec attractor1Move(ArrayList attractors1){ 
 
    kVec dir = new kVec(0,0,0); 
    float closeAttDist = 999999999; 
    int closestAtt = 0; 
    float closestRange = 100; 
 
    // loop through all the attractors1 
    for(int i = 0; i < attractors1.size(); i++){ 
      kAttractor1 att = (kAttractor1) attractors1.get(i); 
      kVec attPosition = kVec.clone(att.pos); 
      float attDist = attPosition.distance(pos); 
    if(attDist < closeAttDist){ 
      closeAttDist = attDist; 
      closestAtt = i; 
      closestRange = att.range; 
      } 
    } 
    // do something - move 
   if(closeAttDist < closestRange){ 
      // modify direction - vector to move away from the attractor 
      kAttractor1 att = (kAttractor1) attractors1.get(closestAtt); 
      //get vector 
      kVec attTarget =  kVec.clone(att.pos); 
      attTarget.minus(pos); 
      attTarget.limit(maxVel); 
      //attTarget.invert(); 
      stroke(170,151,120); 
      line( pos.x, pos.y,att.pos.x, att.pos.y); 
      dir = kVec.clone(attTarget); 
   } 
    return dir; 
}

   
   //kVecATTRACTOR2MOVE
   kVec attractor2Move(ArrayList attractors2){ 
 
    kVec dir = new kVec(0,0,0); 
    float closeAttDist = 999999999; 
    int closestAtt = 0; 
    float closestRange = 100; 
 
    // loop through all the attractors2 
    for(int i = 0; i < attractors2.size(); i++){ 
      kAttractor2 att = (kAttractor2) attractors2.get(i); 
      kVec attPosition = kVec.clone(att.pos); 
      float attDist = attPosition.distance(pos); 
    if(attDist < closeAttDist){ 
      closeAttDist = attDist; 
      closestAtt = i; 
      closestRange = att.range; 
      } 
    } 
    // do something - move 
   if(closeAttDist < closestRange){ 
      // modify direction - vector to move away from the attractor 
      kAttractor2 att = (kAttractor2) attractors2.get(closestAtt); 
      //get vector 
      kVec attTarget =  kVec.clone(att.pos); 
      attTarget.minus(pos); 
      attTarget.limit(maxVel); 
      //attTarget.invert(); 
      stroke(170,159,131); 
      line( pos.x, pos.y,att.pos.x, att.pos.y); 
      dir = kVec.clone(attTarget); 
   } 
    return dir; 
}

   //kVecATTRACTOR3MOVE
   kVec attractor3Move(ArrayList attractors3){ 
 
    kVec dir = new kVec(0,0,0); 
    float closeAttDist = 999999999; 
    int closestAtt = 0; 
    float closestRange = 100; 
 
    // loop through all the attractors3 
    for(int i = 0; i < attractors3.size(); i++){ 
      kAttractor3 att = (kAttractor3) attractors3.get(i); 
      kVec attPosition = kVec.clone(att.pos); 
      float attDist = attPosition.distance(pos); 
    if(attDist < closeAttDist){ 
      closeAttDist = attDist; 
      closestAtt = i; 
      closestRange = att.range; 
      } 
    } 
    // do something - move 
   if(closeAttDist < closestRange){ 
      // modify direction - vector to move away from the attractor 
      kAttractor3 att = (kAttractor3) attractors3.get(closestAtt); 
      //get vector 
      kVec attTarget =  kVec.clone(att.pos); 
      attTarget.minus(pos); 
      attTarget.limit(maxVel); 
      //attTarget.invert(); 
      stroke(170,165,142); 
      line( pos.x, pos.y,att.pos.x, att.pos.y); 
      dir = kVec.clone(attTarget); 
   } 
    return dir; 
}

   //kVecATTRACTOR4MOVE
   kVec attractor4Move(ArrayList attractors4){ 
 
    kVec dir = new kVec(0,0,0); 
    float closeAttDist = 999999999; 
    int closestAtt = 0; 
    float closestRange = 100; 
 
    // loop through all the attractors4 
    for(int i = 0; i < attractors4.size(); i++){ 
      kAttractor4 att = (kAttractor4) attractors4.get(i); 
      kVec attPosition = kVec.clone(att.pos); 
      float attDist = attPosition.distance(pos); 
    if(attDist < closeAttDist){ 
      closeAttDist = attDist; 
      closestAtt = i; 
      closestRange = att.range; 
      } 
    } 
    // do something - move 
   if(closeAttDist < closestRange){ 
      // modify direction - vector to move away from the attractor 
      kAttractor4 att = (kAttractor4) attractors4.get(closestAtt); 
      //get vector 
      kVec attTarget =  kVec.clone(att.pos); 
      attTarget.minus(pos); 
      attTarget.limit(maxVel); 
      //attTarget.invert(); 
      stroke(170,164,152); 
      line( pos.x, pos.y,att.pos.x, att.pos.y); 
      dir = kVec.clone(attTarget); 
   } 
    return dir; 
}

   //kVecATTRACTOR5MOVE
   kVec attractor5Move(ArrayList attractors5){ 
 
    kVec dir = new kVec(0,0,0); 
    float closeAttDist = 999999999; 
    int closestAtt = 0; 
    float closestRange = 100; 
 
    // loop through all the attractors5 
    for(int i = 0; i < attractors5.size(); i++){ 
      kAttractor5 att = (kAttractor5) attractors5.get(i); 
      kVec attPosition = kVec.clone(att.pos); 
      float attDist = attPosition.distance(pos); 
    if(attDist < closeAttDist){ 
      closeAttDist = attDist; 
      closestAtt = i; 
      closestRange = att.range; 
      } 
    } 
    // do something - move 
   if(closeAttDist < closestRange){ 
      // modify direction - vector to move away from the attractor 
      kAttractor5 att = (kAttractor5) attractors5.get(closestAtt); 
      //get vector 
      kVec attTarget =  kVec.clone(att.pos); 
      attTarget.minus(pos); 
      attTarget.limit(maxVel); 
      //attTarget.invert(); 
      stroke(170,166,164); 
      line( pos.x, pos.y,att.pos.x, att.pos.y); 
      dir = kVec.clone(attTarget); 
   } 
    return dir; 
}

   //kVecATTRACTOR6MOVE
   kVec attractor6Move(ArrayList attractors6){ 
 
    kVec dir = new kVec(0,0,0); 
    float closeAttDist = 999999999; 
    int closestAtt = 0; 
    float closestRange = 100; 
 
    // loop through all the attractors6 
    for(int i = 0; i < attractors6.size(); i++){ 
      kAttractor6 att = (kAttractor6) attractors6.get(i); 
      kVec attPosition = kVec.clone(att.pos); 
      float attDist = attPosition.distance(pos); 
    if(attDist < closeAttDist){ 
      closeAttDist = attDist; 
      closestAtt = i; 
      closestRange = att.range; 
      } 
    } 
    // do something - move 
   if(closeAttDist < closestRange){ 
      // modify direction - vector to move away from the attractor 
      kAttractor6 att = (kAttractor6) attractors6.get(closestAtt); 
      //get vector 
      kVec attTarget =  kVec.clone(att.pos); 
      attTarget.minus(pos); 
      attTarget.limit(maxVel); 
      //attTarget.invert(); 
      stroke(170,173,160); 
      line( pos.x, pos.y,att.pos.x, att.pos.y); 
      dir = kVec.clone(attTarget); 
   } 
    return dir; 
}

    // function needs to input the population 
void changeColor(ArrayList pop){ 
      int sumColor = 0; 
      int count = 0; 
 
    // loop through all the agents 
    for(int i = 0; i < pop.size(); i++){   
      
      kAgent other = (kAgent) pop.get(i); 
      float dist = pos.distance(other.pos); 
  }   
}

  //kVecSEPERATE
  kVec seperate(ArrayList pop){ 
    //float desiredseparation = 100.0f;
    kVec sum = new kVec(0,0,0); // makes a blank vector  
    int count = 0; 
 
    // loop through the population of agents 
    for(int i = 0; i < pop.size(); i++){    
    kAgent other = (kAgent) pop.get(i); 
 
    // get distance from current agent to each agent 
    float dist = pos.distance(other.pos); 
 
    // if distance is within a certain range - steer away from it 
    if ( (dist > 0.3) && (dist < rangeOfVision/4) ){ 
        kVec diff = kVec.clone(pos); 
        diff.minus(other.pos); 
        diff.normalize(); 
        diff.scale(1/dist); 
        sum.plus(diff); 
        count++; // count = count + 1 
        // find the vector between current and other agent - add to a sum vector 
      } 
    } 
 
    if(count > 0){ 
        sum.scale(10/(float)count); 
    } 
 
    // return the sum vector 
    return sum; 
}  

  // kVecALLIGN 
  kVec align(ArrayList pop){ 
      kVec sum = new kVec(0,0,0); 
      int count = 0; 
 
    for(int i = 0; i < pop.size(); i++ ){ 
      kAgent other = (kAgent) pop.get(i); 
      float dist = pos.distance(other.pos); 
 
    if ( (dist>0) && (dist < rangeOfVision)  ){ 
      sum.plus(other.vel); 
      count++;       
    } 
  } 
 
    if (count > 0){ 
      sum.scale(1/(float)count); 
      sum.limit(maxForce); 
    } 
 
    return sum; 
}

  // kVecCOHESION
  kVec cohesion(ArrayList pop){ 
      kVec sum = new kVec(0,0,0); 
      int count = 0; 
 
    for(int i = 0; i < pop.size(); i++ ){ 
      kAgent other = (kAgent) pop.get(i); 
      float dist = pos.distance(other.pos); 
 
    if ( (dist>0) && (dist < rangeOfVision)  ){   
      sum.plus(other.pos); 
      count++; 
    } 
  }  
    if (count >0){ 
      sum.scale(1/(float)count); // found the midpoint of all the surrounding agents 
      return steer(sum); // steer towards that point 
    } 
 
    return sum; 
}     

  // STEER - returns a vector to steer towards something 
  kVec steer(kVec target){ 
    // get a vector between the agents position and the target 
    kVec steer; 
    target.minus(pos); // vector between agent and target 
 
    // get the distance between agent and target        
    float distance = target.length();     
 
    // if distance is greater than 0 - calculate steer vector 
    if(distance > 0){ 
      target.normalize(); // makes the vector a length of 1 
      target.scale(maxVel); 
      target.minus(vel); 
      target.limit(maxForce); 
      steer = kVec.clone(target); 
    } 
    else{ 
      steer = new kVec(0,0); 
    } 
    return steer; 
 
}

  // SEEK 
  void seek(kVec target){ 
    // calls steer function and adds the resultant vector to acc 
    acc.plus(steer(target)); 
  } 
 
  // RENDER
  void render(){ 
    noFill(); 
    kVec nextpos = new kVec(1,1); 
   nextpos.plus(pos); 
    vel.scale(5.0); 
    float angle = 0.5; 
    nextpos.plus(vel); 
    stroke(50); 
    //line(pos.x, pos.y, nextpos.x, nextpos.y); 
    noStroke(); 
    fill(50,50,50,100); 
    //rect(nextpos.x, nextpos.y, 5, 8);  
  }
  
  // borders - torus space
  void borders(){
    kVec left = new kVec(3,0);
    kVec right = new kVec(-3,0);
    kVec top = new kVec(0,3);
    kVec button = new kVec(0,-3);

    if(pos.x < 0) {
      pos.x = width;
      //vel.plus(left);
    }
    if(pos.y < 0) {
      pos.y = 0;
      vel.plus(top);
    }
    if(pos.x > width) {
      pos.x = 0;
      //vel.plus(right);
    }
    if(pos.y > height) {
      pos.y = height;
      vel.plus(button);
    }
  }
  
  void noSea(){
    kVec hitpos = new kVec(0,0);
    hitpos.plus(pos);
    hitpos.plus(vel);
    color crh = get(int(hitpos.x),int(hitpos.y));
    if ( crh == color(206,210,215)){
       vel.invert();
      //vel.scale(0.01);
      //vel = new kVec(int(random(-0.2,0.2)),int(random(-0.2,0.2)));
    }
    
  }
  
}
    

