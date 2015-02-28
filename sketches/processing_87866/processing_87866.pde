
// The Boid class

class Boid {

    int tailLength = 20;////////stuff for the lead synth boid
    int tailMakeInterval = 30;
    int tailCounter = 0;
    int tailMakeCounter = 0;
    
    float[] tailX = new float[tailLength];
    float[] tailY = new float[tailLength];
    float[] tailZ = new float[tailLength];
    
    float[] tailOpacity = new float[tailLength];
  
  
  int headingAvgr = 400;//average the last n velocities!
  PVector[] prevHeadings = new PVector[headingAvgr];//an array to hold them
  int prevHeadingsIndex = 0;//an index to read prevHeadings
  PVector heading = new PVector();//the averaged prevHeadings
  
  
  PVector Vy;//the vector of Gravity
  PVector Vv;//the vector of the heading minus Vy
  PVector Vperp;//the Vector perpendicular to the heading!  the banking happens on this vector
  float ay;// vertical component of acceleration
  float av;// plane component in velocity direction
  float aperp;// the banking component
  float banking;// the inverse tangent of the move
  PVector bankingVector;
  
  PVector loc;
  PVector vel;
  PVector acc;
  float r; //size
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  
  char type; ///the type of boid
  
  
  float desiredseparation;//the threshold for attraction and avoidance.
  float neighbordist;
  
  int triggeredTime;//when triggered this time is updated --- drawing operations are measured from the triggered time
  int triggeredAmount;
  int reaction; // the trigger type for boids with multiple beats
  
  /////////////////////////////////////////////////////////////////////
  int bColorR = (int)random(255);//randomy modifiers when the birds sound
  int bColorG = (int)random(255);
  int bColorB = (int)random(255);
      
  int bRad1 = (int)random(50);
  int bRad2 =  (int)random(50);
  int bRad3 =  (int)random(50);
  int bRad4 =  (int)random(50);
  /////////////////////////////////////////////////////////////////////
  
    Boid(char t, PVector l) /// will make other species as I get done reviewing
    {
      type = t;
      /*
      typez:
      s = snare**
      k = kick**
      h = hat
      c = conga**
      o = bamboo------
      
      b = bass synth
      l = lead synth------
      
      p = ploink
      d = wub
      w = wooh 
      */
      
      
      
      acc = new PVector(0,0,0);
      vel = new PVector(random(-1,1),random(-1,1),random(-1,1));//start movin'
      for(int h = 0; h < headingAvgr; h++)//fill the prevHeadings
      {
        prevHeadings[h] = vel;
      }
      Vy = new PVector(0,1,0);/////////the math for banking
      Vv = new PVector();//////////////
      Vperp = new PVector();///////////
      Vv.sub(Vy,heading,Vv);///////////the heading without the gravitational component
      Vv.normalize();//////////////////
      Vperp.cross(Vy,Vv,Vperp);//the banking plane
      Vperp.normalize();
      ay = acc.dot(Vy);//the acceleration in the vertical dimension
      av = acc.dot(Vv);//acc in the heading dirrection
      aperp = acc.dot(Vperp);
      banking = atan(aperp/(ay - 1));
      bankingVector = new PVector();
      bankingVector.mult(Vperp,banking,bankingVector);
      loc = l.get();
      
      /*
      typez:
      s = snare
      k = kick
      h = hat
      c = conga
      o = bamboo
      
      
      b = bass synth
      l = lead synth
      
      p = ploink
      d = wub
      w = wooh 
      */
      
      switch(type)//a switch case for size and speed parameters
      {
        case 's':
          r = 2.0;
          maxspeed = 12.0;
          maxforce = 0.9;
          break;
        case 'k':
          r = 95.0;
          maxspeed = 9.0;
          maxforce = 0.9;
          break;
        case 'h':
          r = 5.0;
          maxspeed = 12.0;
          maxforce = 1.3;
          break;
        case 'c':
          r = 10.0;
          maxspeed = 8.0;
          maxforce = 1.9;
          break;
        case 'o':
          r = 27.0;
          maxspeed = 25.0;
          maxforce = 30.0;
          break;
        case 'b':
          r = 28.0;
          maxspeed = 2.0;
          maxforce = 3.0;
          break;
        case 'l':
          r = 37.0;
          maxspeed = 15.0;
          maxforce = 1.0;
          
          break;
        case 'p':
          r = 7.0;
          maxspeed = 10.0;
          maxforce = 0.9;
          break;
        case 'd':
          r = 7.0;
          maxspeed = 9.0;
          maxforce = 0.5;
          break;
        case 'w':
          r = 7.0;
          maxspeed = 19.0;
          maxforce = 5.0;
          break;  
        default:
          break;  
      }
      
      
    }

 void run(ArrayList boids, boolean sounding) {
    flock(boids);//look at all the boids!
    update();//move
    render(sounding);//drawr
  }

    // We accumulate a new acceleration each time based on three rules
    void flock(ArrayList boids) 
    {
      PVector sep = separate(boids);   // Separation
      PVector ali = align(boids);      // Alignment
      PVector coh = cohesion(boids);   // Cohesion
      
      /*
      // Arbitrarily weight these forces//////DOING THIS WITHIN THE SEPARATE, ALIGN AND COHESION METHODS NOW
      sep.mult(2.5);
      ali.mult(0.3);
      coh.mult(0.2);
      */
      switch(type)
            {
              case 's':
                  sep.mult(6.5+(triggeredAmount/300));
                  ali.mult(0.7);
                  coh.mult(0.5 - (triggeredAmount/600));
              break;
              case 'k':
                  sep.mult(2.5);
                  ali.mult(0.3 );
                  coh.mult(0.2);
              case 'h':
          
              break;
              case 'c':
              
                  sep.mult(9);
                  ali.mult(0.03);
                  coh.mult(1+ triggeredAmount);
                  
                  if(reaction == 2)
                  {
                    sep.add(0,-2,0);
                    ali.add(0,-2,0);
                    coh.add(0,-2,0);
                  }
                  if(reaction==3)
                  {
                    sep.add(0,2,0);
                    ali.add(0,2,0);
                    coh.add(0,2,0);
                  }
         
              break;
              case 'o':
                  sep.mult(0.8);
                  ali.mult(0.3);
                  coh.mult(0.60);
          
              break;
              case 'b':
          
              break;
              case 'l':
                 sep.mult(6.5+(triggeredAmount/100));
                 ali.mult(0.2);
                 coh.mult(0.5 - (triggeredAmount/400));
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            }
      // Add the force vectors to acceleration  
      acc.add(sep);
      acc.add(ali);
      acc.add(coh);
    }

  // Method to update location
  void update() 
  {
           
        
    
    
            switch(type)
            {
              case 's':
                triggeredAmount = constrain( ((triggeredTime+1000)-millis()), 0, 1000);//update the triggered amount              
                vel.add(acc);//we combined the forces in flock(), now integrate
                vel.limit(maxspeed+(triggeredAmount/40));
                // Update velocity
                
                // Limit speed
              
              break;
              case 'k':
                triggeredAmount = constrain( ((triggeredTime+200)-millis()), 0, 7000);
              
                
                acc.mult(triggeredAmount);
                vel.add(acc);
                vel.limit(maxspeed+(triggeredAmount/50));
                // Update velocity
                // Limit speed
               
              break;  
              case 'h':
          
              break;
              case 'c':
                triggeredAmount = constrain( ((triggeredTime+300)-millis()), 0, 1000);//update the triggered amount              
                
                vel.add(acc);//we combined the forces in flock(), now integrate
                // Limit speed
                vel.limit(maxspeed+(triggeredAmount/30));
                // Update velocity
               
              break;
              case 'o':
                triggeredAmount = constrain( ((triggeredTime+800)-millis()), 0, 1000);//update the triggered amount              
                vel.add(acc);//we combined the forces in flock(), now integrate
                vel.limit(maxspeed+(triggeredAmount/10));
              break;
              case 'b':
          
              break;
              case 'l':
         
                triggeredAmount = constrain( ((triggeredTime+3000)-millis()), 0, 7000);
              
                
                acc.mult(triggeredAmount*0.0001);
                vel.add(acc);
                vel.limit(maxspeed+(triggeredAmount*0.003));
                // Update velocity
                // Limit speed
                
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
            
    
    loc.add(vel);
    // Reset accelertion to 0 each cycle
    borders();
    acc.mult(0);
  }

  void seek(PVector target) 
  {
    acc.add(steer(target,false));
  }

  void arrive(PVector target) 
  {
    acc.add(steer(target,true));
  }

  // A method that calculates a steering vector towards a target
  // Takes a second argument, if true, it slows down as it approaches the target
  PVector steer(PVector target, boolean slowdown) 
  {
    PVector steer;  // The steering vector
    PVector desired = target.sub(target,loc);  // A vector pointing from the location to the target
    float d = desired.mag(); // Distance from the target is the magnitude of the vector
    // If the distance is greater than 0, calc steering (otherwise return zero vector)
    if (d > 0) {
      // Normalize desired
      desired.normalize();
      // Two options for desired vector magnitude (1 -- based on distance, 2 -- maxspeed)
      if ((slowdown) && (d < 100.0))
      { 
        desired.mult(maxspeed*(d/100.0)); // This damping is somewhat arbitrary
      }  
      else 
      {
        desired.mult(maxspeed);
      }
      // Steering = Desired minus Velocity
      steer = target.sub(desired,vel);
      steer.limit(maxforce);  // Limit to maximum steering force
    } 
    else 
    {
      steer = new PVector(0,0,0);
    }
    return steer;
  }

  void render(boolean birdsSounding)/////////////////print in here to see if boids are escaping 
  {
    // Draw rotated in the direction of velocity
   
    if(birdsSounding)
    {
      bColorR =  (int)random(255);
      bColorG =  (int)random(255);
      bColorB =  (int)random(255);
      
      bRad1 =  (int)random(50);
      bRad2 =  (int)random(50);
      bRad3 =  (int)random(50);
      bRad4 =  (int)random(50);
    }//////////////////////the randomized effect for when the birds are playing
    if(!birdsSounding)
    {
      bColorR = 0;
      bColorG = 0;
      bColorB = 0;
      
      bRad1 = 0;
      bRad2 = 0;
      bRad3 = 0;
      bRad4 = 0;
    }/////////////////////keep cool
   
    prevHeadings[prevHeadingsIndex] = vel;
    prevHeadingsIndex++;
    prevHeadingsIndex %= headingAvgr;
    for(int i = 0; i < headingAvgr; i++)
    {
      heading.add(prevHeadings[i]);
    }
    
    Vv.sub(Vy,heading,Vv);//extract the heading components from gravity
    Vv.normalize();
    Vperp.cross(Vy,Vv,Vperp);//find the component to bank on
    Vperp.normalize();
    ay = acc.dot(Vy);
    av = acc.dot(Vv);
    aperp = acc.dot(Vperp);
    banking = atan(aperp/(ay - 1));
    bankingVector.mult(Vperp,banking,bankingVector);
    heading.div(headingAvgr);
    heading.normalize();
    heading.add(bankingVector);//combine the heading and banking?!?!?!?!?!?!?!? hshgl;gaagf;lk

    pushMatrix();
    translate(loc.x,loc.y,loc.z);
    heading.mult(90);
    rotateX(radians(heading.x));
    rotateY(radians(heading.y));
    rotateZ(radians(heading.z));
    
       
    switch(type)//draw by type
      {
        case 's':
          fill(200+bColorR,200+bColorG,0+bColorB,200);
          beginShape(TRIANGLE_STRIP);
            vertex(-r*10+bRad1,0,0);//vertex 1
            vertex(0,r*10+bRad2,0); //vertex 2
            vertex(r*10+bRad3,0,0); //vertex 3
      
            vertex(0,0,-r*5+bRad4); //vertex 4
            vertex(-r*10+bRad1,0,0);//vertex 1
      
            vertex(0,r*10+bRad2,0); //vertex 2
            vertex(0,0,-r*5+bRad1); //vertex 4
      
            vertex(r*10+bRad4,0,0); //vertex 3
            vertex(0,r*10+bRad1,0); //vertex 2
          endShape(CLOSE); 
          break;
        case 'k':
          fill(200+bColorR, 0+bColorG, 180+bColorB);
          box(r+bRad1+(triggeredAmount/2));
          break;
        case 'h':
          
          break;
        case 'c':
        noStroke();
        fill(170+bColorR, 130+bColorG, 50+bColorB);
        
         cylinder(80+bRad1, 130+bRad2, 7);
          break;
        case 'o':
          fill(55+bColorR, 55+bColorG, 55+bColorB);
          beginShape();
          vertex(triggeredAmount/400,-r,triggeredAmount/50);
          vertex(r+bRad1, r+bRad2, r+bRad3);
          vertex(0, 0+bRad3, r+bRad4);
          endShape(CLOSE);
          fill(75+bColorR, 55+bColorG, 55+bColorB, triggeredAmount/20);
          sphere(r);
          if(reaction == 4)
          {
            box(r+triggeredAmount/200);
          }
          break;
        case 'b':
          
          break;
        case 'l':
         
          
         
         
         tailMakeCounter++;////////////////////////functions to update the tail states
         tailMakeCounter %= tailMakeInterval;
         if(tailMakeCounter == 0)
         {
           for(int t = tailLength-1; t >= 0; t--)
           {
             if(t > 0)
             {
               //print("t is " + t);
               tailX[t] = (tailX[t-1]);
               tailY[t] = (tailY[t-1]);
               tailZ[t] = (tailZ[t-1]);
               
               tailOpacity[t] = tailOpacity[t-1];
             }
             if(t == 0)
             {
               tailX[t] = (this.loc.x);
               tailY[t] = (this.loc.y);
               tailZ[t] = (this.loc.z);
               tailOpacity[t] = this.triggeredAmount*0.01;
             }
           }
         }
         
         /*for(int q = 0; q < tailLength-1; q++)//length - 1 because we draw from one point to the next
         {
           stroke(0+bColorR, 220+bColorG, 200+bColorB, tailOpacity[q]);
           println("    tailOpacity is " + tailOpacity[q]);
           line(tailY[q], tailY[q+1], tailZ[q], tailZ[q+1], tailX[q], tailX[q+1]);
         }*/
         
         fill(0+bColorR,220+bColorG,200+bColorB, 255-triggeredAmount/10);
          beginShape(TRIANGLE_STRIP);
            vertex(-r*10+bRad1,0,0);//vertex 1
            vertex(0,r*10+bRad2,0); //vertex 2
            vertex(r*10+bRad3,0,0); //vertex 3
      
            vertex(0,0,-r*5+bRad4); //vertex 4
            vertex(-r*10+bRad1,0,0);//vertex 1
      
            vertex(0,r*10+bRad2,0); //vertex 2
            vertex(0,0,-r*5+bRad1); //vertex 4
      
            vertex(r*10+bRad4,0,0); //vertex 3
            vertex(0,r*10+bRad1,0); //vertex 2
          endShape(CLOSE); 
         
         
         
          break;
        case 'p':
          
          break;
        case 'd':
          
          break;
        case 'w':
          
          break;  
        default:
          break;  
      }
     
    
    popMatrix();
  }

  

  // Separation
  // Method checks for nearby boids and steers away
  PVector separate (ArrayList boids) 
  {
    //println("sep");
    //////!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!float desiredseparation = 80.0;
    PVector steer = new PVector(0,0,0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (int i = 0 ; i < boids.size(); i++) 
    {
      Boid other = (Boid) boids.get(i);
      switch(this.type)//repel by type
      {
        case 's'://this is a snare boid
          switch(other.type)
            {
              case 's':
                desiredseparation = 80.0;
              break;
              case 'k':
                desiredseparation = 200.0+(400.0*other.triggeredAmount);
 //println(other.triggeredAmount + " is the triggered amount of the kick");                
              case 'h':
                desiredseparation = 400.0;
              break;
              case 'c':
                desiredseparation = 800.0-other.triggeredAmount;
              break;
              case 'o':
                desiredseparation = 150.0;
              break;
              case 'b':
                desiredseparation = 300.0;
              break;
              case 'l':
                desiredseparation = 90.0-other.triggeredAmount*0.01;
              break;
              case 'p':
                desiredseparation = 400.0;
              break;
              case 'd':
                desiredseparation = 400.0;
              break;
              case 'w':
                desiredseparation = 80.0;
              break;  
              default:
              break;  
            } 
          break;
        case 'k':
        switch(other.type)
            {
              case 's':
                desiredseparation = 80.0+triggeredAmount;
              break;
              case 'k':
                desiredseparation = 100.0;
              case 'h':
                desiredseparation = 300.0;
              break;
              case 'c':
                desiredseparation = 300.0;
              break;
              case 'o':
                desiredseparation = 300.0;
              break;
              case 'b':
                desiredseparation = 80.0;
              break;
              case 'l':
                desiredseparation = 400.0+triggeredAmount;
              break;
              case 'p':
                desiredseparation = 80.0;
              break;
              case 'd':
                desiredseparation = 80.0;
              break;
              case 'w':
                desiredseparation = 80.0;
              break;  
              default:
              break;  
            } 
         
        case 'h':
        switch(other.type)
            {
              case 's':
                 desiredseparation = 40.0;
              break;
              case 'k':
                 desiredseparation = 80.0;
              case 'h':
          
              break;
              case 'c':
         
              break;
              case 'o':
          
              break;
              case 'b':
          
              break;
              case 'l':
         
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
          
          break;
        case 'c':
        switch(other.type)
            {
              case 's':
                 desiredseparation = 100 + this.triggeredAmount;
              break;
              case 'k':
                 desiredseparation = 400 + other.triggeredAmount;
              case 'h':
          
              break;
              case 'c':
                 desiredseparation = 100;
              break;
              case 'o':
                 desiredseparation = 600;
              break;
              case 'b':
          
              break;
              case 'l':
                 desiredseparation = 200 - other.triggeredAmount*0.01;
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
         
          break;
        case 'o':
        switch(other.type)
            {
              case 's':
                 desiredseparation = 600;
              break;
              case 'k':
                 desiredseparation = 600-other.triggeredAmount;
              case 'h':
              
              break;
              case 'c':
                 desiredseparation = 600+this.triggeredAmount;
              break;
              case 'o':
              
              
                desiredseparation = 100+this.triggeredAmount;
              break;
              case 'b':
          
              break;
              case 'l':
                desiredseparation = 40;
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
          
          break;
        case 'b':
        switch(other.type)
            {
              case 's':
           
              break;
              case 'k':
         
              case 'h':
          
              break;
              case 'c':
         
              break;
              case 'o':
          
              break;
              case 'b':
          
              break;
              case 'l':
         
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
          
          break;
        case 'l':
        switch(other.type)
            {
              case 's':
                 desiredseparation = 300+other.triggeredAmount;
              break;
              case 'k':
                 desiredseparation = 30+other.triggeredAmount;
              case 'h':
          
              break;
              case 'c':
                 desiredseparation = 200+other.triggeredAmount;
              break;
              case 'o':
          
              break;
              case 'b':
          
              break;
              case 'l':
                 desiredseparation = 0;
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
         
          break;
        case 'p':
        switch(other.type)
            {
              case 's':
           
              break;
              case 'k':
         
              case 'h':
          
              break;
              case 'c':
         
              break;
              case 'o':
          
              break;
              case 'b':
          
              break;
              case 'l':
         
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
          
          break;
        case 'd':
        switch(other.type)
            {
              case 's':
           
              break;
              case 'k':
         
              case 'h':
          
              break;
              case 'c':
         
              break;
              case 'o':
          
              break;
              case 'b':
          
              break;
              case 'l':
         
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
          
          break;
        case 'w':
        switch(other.type)
            {
              case 's':
           
              break;
              case 'k':
         
              case 'h':
          
              break;
              case 'c':
         
              break;
              case 'o':
          
              break;
              case 'b':
          
              break;
              case 'l':
         
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
          
          break;  
        default:
          break;  
      }
      
      
      
      //other.type//make a switch case for this!!
      float d = PVector.dist(loc,other.loc);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(loc,other.loc);
        diff.normalize();
        diff.div(d);///other.triggeredAmount);        // Weight by distance
        steer.add(diff);
        count++;            // Keep track of how many
    }
  }
  // Average -- divide by how many
  
  
  if (count > 0) 
  {
    steer.div((float)count);
  }

  // As long as the vector is greater than 0
  if (steer.mag() > 0) 
  {
  // Implement Reynolds: Steering = Desired - Velocity
    steer.normalize();
    steer.mult(maxspeed+(triggeredAmount/1000.));
    steer.sub(vel);
    steer.limit(maxforce+(triggeredAmount/100.));
  }
    return steer;
  }

  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  PVector align (ArrayList boids) 
  {
    //println("ali");
    //////////////!!!!!!!!!!!!!!!!!!!!!float neighbordist = 250.0;
    PVector steer = new PVector(0,0,0);
    int count = 0;
    for (int i = 0 ; i < boids.size(); i++) {
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(loc,other.loc);
      switch(this.type)//repel by type
      {
        case 's':
          switch(other.type)
            {
              case 's':
                 neighbordist = 350.0;
              break;
              case 'k':
                 neighbordist = 550.0;
              case 'h':
          
              break;
              case 'c':
                 neighbordist = 100.0 + triggeredAmount;
              break;
              case 'o':
                neighbordist = 2;
              break;
              case 'b':
          
              break;
              case 'l':
                 neighbordist = 200;
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
          break;
        case 'k':
        switch(other.type)
            {
              case 's':
                neighbordist = 250.0;
              break;
              case 'k':
                neighbordist = 150.0;
              case 'h':
          
              break;
              case 'c':
                neighbordist = 100.0;
              break;
              case 'o':
                neighbordist = 3;
              break;
              case 'b':
          
              break;
              case 'l':
               neighbordist = 3;
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
         
        case 'h':
        switch(other.type)
            {
              case 's':
           
              break;
              case 'k':
         
              case 'h':
          
              break;
              case 'c':
         
              break;
              case 'o':
          
              break;
              case 'b':
          
              break;
              case 'l':
         
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
          
          break;
        case 'c':
        switch(other.type)
            {
              case 's':
                 neighbordist = 500.0;
              break;
              case 'k':
                 neighbordist = 100.0;
              case 'h':
          
              break;
              case 'c':
                 neighbordist = 100.0;
              break;
              case 'o':
                neighbordist = 3;
              break;
              case 'b':
                neighbordist = 3;
              break;
              case 'l':
               neighbordist = 600-triggeredAmount;
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
         
          break;
        case 'o':
        switch(other.type)
            {
              case 's':
               neighbordist = other.triggeredAmount;
              break;
              case 'k':
                neighbordist = other.triggeredAmount;
              case 'h':
          
              break;
              case 'c':
                  neighbordist = other.triggeredAmount;
              break;
              case 'o':
                 neighbordist = other.triggeredAmount;
              break;
              case 'b':
          
              break;
              case 'l':
                  neighbordist = other.triggeredAmount;                 
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
          
          break;
        case 'b':
        switch(other.type)
            {
              case 's':
           
              break;
              case 'k':
         
              case 'h':
          
              break;
              case 'c':
         
              break;
              case 'o':
          
              break;
              case 'b':
          
              break;
              case 'l':
         
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
          
          break;
        case 'l':
        switch(other.type)
            {
              case 's':
              neighbordist = other.triggeredAmount;

              break;
              case 'k':
                  neighbordist = other.triggeredAmount;
     
              case 'h':
          
              break;
              case 'c':
              neighbordist = other.triggeredAmount;
         
              break;
              case 'o':
              neighbordist = other.triggeredAmount;
          
              break;
              case 'b':
          
              break;
              case 'l':
              neighbordist = other.triggeredAmount;
         
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
         
          break;
        case 'p':
        switch(other.type)
            {
              case 's':
           
              break;
              case 'k':
         
              case 'h':
          
              break;
              case 'c':
         
              break;
              case 'o':
          
              break;
              case 'b':
          
              break;
              case 'l':
         
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
          
          break;
        case 'd':
        switch(other.type)
            {
              case 's':
           
              break;
              case 'k':
         
              case 'h':
          
              break;
              case 'c':
         
              break;
              case 'o':
          
              break;
              case 'b':
          
              break;
              case 'l':
         
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
          
          break;
        case 'w':
        switch(other.type)
            {
              case 's':
           
              break;
              case 'k':
         
              case 'h':
          
              break;
              case 'c':
         
              break;
              case 'o':
          
              break;
              case 'b':
          
              break;
              case 'l':
         
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
          
          break;  
        default:
          break;  
      }
      if ((d > 0) && (d < neighbordist)) {
        steer.add(other.vel);
        count++;
      }
    }
    if (count > 0) {
      steer.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(vel);
      steer.limit(maxforce);
    }
    return steer;
  }

  // Cohesion
  // For the average location (i.e. center) of all nearby boids, calculate steering vector towards that location
  PVector cohesion (ArrayList boids) {
    //println("coh");
    //////////////////////////float neighbordist = 200.0;
    PVector sum = new PVector(0,0,0);   // Start with empty vector to accumulate all locations
    int count = 0;
    for (int i = 0 ; i < boids.size(); i++) {
      Boid other = (Boid) boids.get(i);
      float d = loc.dist(other.loc);
      switch(this.type)//repel by type
      {
        case 's':
          switch(other.type)
            {
              case 's':
                neighbordist = 200.0;
              break;
              case 'k':
                neighbordist = 500.0;
              case 'h':
          
              break;
              case 'c':
                neighbordist = 1000.0;
              break;
              case 'o':
                neighbordist = other.triggeredAmount;
              break;
              case 'b':
          
              break;
              case 'l':
                neighbordist = other.triggeredAmount;

              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
          break;
        case 'k':
        switch(other.type)
            {
              case 's':
                neighbordist = 700.0;
              break;
              case 'k':
                neighbordist = 200.0;
              case 'h':
          
              break;
              case 'c':
                neighbordist = 100.0;
              break;
              case 'o':
                neighbordist = 2;
              break;
              case 'b':
          
              break;
              case 'l':
                neighbordist = other.triggeredAmount;
       
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
         
        case 'h':
        switch(other.type)
            {
              case 's':
           
              break;
              case 'k':
         
              case 'h':
          
              break;
              case 'c':
         
              break;
              case 'o':
          
              break;
              case 'b':
          
              break;
              case 'l':
         
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
          
          break;
        case 'c':
        switch(other.type)
            {
              case 's':
                 neighbordist = 700.0;
              break;
              case 'k':
                 neighbordist = 200;
              case 'h':
          
              break;
              case 'c':
                 neighbordist = 100;
              break;
              case 'o':
                 neighbordist = other.triggeredAmount;
              break;
              case 'b':
          
              break;
              case 'l':
                neighbordist = other.triggeredAmount;
       
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
         
          break;
        case 'o':
        switch(other.type)
            {
              case 's':
                 neighbordist = 2;
              break;
              case 'k':
                 neighbordist = 2;
              case 'h':
          
              break;
              case 'c':
                 neighbordist = 2+other.triggeredAmount;
              break;
              case 'o':
                 neighbordist = 2000;
              break;
              case 'b':
          
              break;
              case 'l':
                neighbordist = other.triggeredAmount;
       
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
          
          break;
        case 'b':
        switch(other.type)
            {
              case 's':
           
              break;
              case 'k':
         
              case 'h':
          
              break;
              case 'c':
         
              break;
              case 'o':
          
              break;
              case 'b':
          
              break;
              case 'l':
         
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
          
          break;
        case 'l':
        switch(other.type)
            {
              case 's':
                 neighbordist = other.triggeredAmount;
        
              break;
              case 'k':
              neighbordist = other.triggeredAmount;
         
              case 'h':
          
              break;
              case 'c':
              neighbordist = other.triggeredAmount;
         
              break;
              case 'o':
              neighbordist = other.triggeredAmount;
          
              break;
              case 'b':
          
              break;
              case 'l':
              neighbordist = other.triggeredAmount;
         
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
         
          break;
        case 'p':
        switch(other.type)
            {
              case 's':
           
              break;
              case 'k':
         
              case 'h':
          
              break;
              case 'c':
         
              break;
              case 'o':
          
              break;
              case 'b':
          
              break;
              case 'l':
         
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
          
          break;
        case 'd':
        switch(other.type)
            {
              case 's':
           
              break;
              case 'k':
         
              case 'h':
          
              break;
              case 'c':
         
              break;
              case 'o':
          
              break;
              case 'b':
          
              break;
              case 'l':
         
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
          
          break;
        case 'w':
        switch(other.type)
            {
              case 's':
           
              break;
              case 'k':
         
              case 'h':
          
              break;
              case 'c':
         
              break;
              case 'o':
          
              break;
              case 'b':
          
              break;
              case 'l':
         
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
          
          break;  
        default:
          break;  
      }
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.loc); // Add location
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      return steer(sum,false);  // Steer towards the location
    }
    return sum;
  }
  
  
  void trigger(int trigType)
  {
    //println("Trigger!!! @" + millis());
    triggeredTime = millis();
    reaction = trigType;
  }
  
  // force from the walls
  void borders() 
  {
    
    if(this.loc.x < -1000)
    { //println(this.loc);
      this.loc.x = -998;
      //println("resetting the x pos to " + this.loc); 
    }//replace boid inside bounds
    
    if(this.loc.x < -800)
    {
      vel.x += abs((5.0/((-1000.0-this.loc.x)*(-1000.0-this.loc.x))));
    }
    
    if(this.loc.x > 1000)
    { //println(this.loc);
      this.loc.x = 998;
      //println("resetting the x pos to " + this.loc); 
    }
    
    if(this.loc.x > 800)
    {
      vel.x -= abs((5.0/((1000.0-this.loc.x)*(1000.0-this.loc.x))));
    }
    
    if(this.loc.y < -800)
    { //println(this.loc);
      this.loc.y = -798;
      //println("resetting the y pos to " + this.loc); 
    }
    
    if(this.loc.y < -700)
    {
      vel.y += abs((5/((-800.0-this.loc.y)*(-800.0-this.loc.y))));
    }
    
    if(this.loc.y > 800)
    { //println(this.loc);
      this.loc.y = 798;
      //println("resetting the y pos to " + this.loc); 
    }
    
    if(this.loc.y > 700)
    {
      vel.y -= abs((5/((800.0-this.loc.y)*(800.0-this.loc.y))));
    }
    
    if(this.loc.z < -800)
    { //println(this.loc);
      this.loc.z = -798;
      //println("resetting the z pos to " + this.loc); 
    }
    
    if(this.loc.z < -700)
    {
      vel.z += abs((5/((-800.0-this.loc.z)*(-800.0-this.loc.z))));
    }
    
    if(this.loc.z > 800)
    { //println(this.loc);
    //println("x is " + loc.x);
    //println("y is " + loc.y);
    //println("z is " + loc.z);
      this.loc.z = 798;
      //println("resetting the z pos to " + this.loc); 
    }
    
     if(this.loc.z > 700)
    {
      vel.z -= abs((5/((800.0-this.loc.z)*(800.0-this.loc.z))));
    }
    
   
  }
}

/*
switch(this.type)//repel by type
      {
        case 's':
          switch(other.type)
            {
              case 's':
           
              break;
              case 'k':
         
              case 'h':
          
              break;
              case 'c':
         
              break;
              case 'o':
          
              break;
              case 'b':
          
              break;
              case 'l':
         
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
          break;
        case 'k':
        switch(other.type)
            {
              case 's':
           
              break;
              case 'k':
         
              case 'h':
          
              break;
              case 'c':
         
              break;
              case 'o':
          
              break;
              case 'b':
          
              break;
              case 'l':
         
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
         
        case 'h':
        switch(other.type)
            {
              case 's':
           
              break;
              case 'k':
         
              case 'h':
          
              break;
              case 'c':
         
              break;
              case 'o':
          
              break;
              case 'b':
          
              break;
              case 'l':
         
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
          
          break;
        case 'c':
        switch(other.type)
            {
              case 's':
           
              break;
              case 'k':
         
              case 'h':
          
              break;
              case 'c':
         
              break;
              case 'o':
          
              break;
              case 'b':
          
              break;
              case 'l':
         
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
         
          break;
        case 'o':
        switch(other.type)
            {
              case 's':
           
              break;
              case 'k':
         
              case 'h':
          
              break;
              case 'c':
         
              break;
              case 'o':
          
              break;
              case 'b':
          
              break;
              case 'l':
         
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
          
          break;
        case 'b':
        switch(other.type)
            {
              case 's':
           
              break;
              case 'k':
         
              case 'h':
          
              break;
              case 'c':
         
              break;
              case 'o':
          
              break;
              case 'b':
          
              break;
              case 'l':
         
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
          
          break;
        case 'l':
        switch(other.type)
            {
              case 's':
           
              break;
              case 'k':
         
              case 'h':
          
              break;
              case 'c':
         
              break;
              case 'o':
          
              break;
              case 'b':
          
              break;
              case 'l':
         
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
         
          break;
        case 'p':
        switch(other.type)
            {
              case 's':
           
              break;
              case 'k':
         
              case 'h':
          
              break;
              case 'c':
         
              break;
              case 'o':
          
              break;
              case 'b':
          
              break;
              case 'l':
         
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
          
          break;
        case 'd':
        switch(other.type)
            {
              case 's':
           
              break;
              case 'k':
         
              case 'h':
          
              break;
              case 'c':
         
              break;
              case 'o':
          
              break;
              case 'b':
          
              break;
              case 'l':
         
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
          
          break;
        case 'w':
        switch(other.type)
            {
              case 's':
           
              break;
              case 'k':
         
              case 'h':
          
              break;
              case 'c':
         
              break;
              case 'o':
          
              break;
              case 'b':
          
              break;
              case 'l':
         
              break;
              case 'p':
          
              break;
              case 'd':
          
              break;
              case 'w':
          
              break;  
              default:
              break;  
            } 
          
          break;  
        default:
          break;  
      }
      */
      
      
 
void cylinder(float w, float h, int sides)//cylinder function for conga!!
{
  float angle;
  float[] x = new float[sides+1];
  float[] z = new float[sides+1];
 
  //get the x and z position on a circle for all the sides
  for(int i=0; i < x.length; i++){
    angle = TWO_PI / (sides) * i;
    x[i] = sin(angle) * w;
    z[i] = cos(angle) * w;
  }
 
  //draw the top of the cylinder
  beginShape(TRIANGLE_FAN);
 
  vertex(0,   -h/2,    0);
 
  for(int i=0; i < x.length; i++){
    vertex(x[i], -h/2, z[i]);
  }
 
  endShape();
 
  //draw the center of the cylinder
  beginShape(QUAD_STRIP); 
 
  for(int i=0; i < x.length; i++){
    vertex(x[i], -h/2, z[i]);
    vertex(x[i], h/2, z[i]);
  }
 
  endShape();
 
  //draw the bottom of the cylinder
  beginShape(TRIANGLE_FAN); 
 
  vertex(0,   h/2,    0);
 
  for(int i=0; i < x.length; i++){
    vertex(x[i], h/2, z[i]);
  }
 
  endShape();
}
 

