
//Name of the objet to be defined
class cell{
  //------------------------------------GLOBAL VARIABLES
  /*
  Those variables and settings that will be resent all over the definition:
  a radius(rad), randomly generated to increase interest; a location 
  vector(loc) to fill with the object position, a speed vector(speed) to 
  store the speed of the objects on scene, an acceleration vector (acc) 
  that will be used to affect the speed of the objects, and a mouse vector (mouse)
  to store the mouse position
  */
  float rad = random(5, 10);
  
  Vec3D loc = new Vec3D (0, 0, 0);
  
  Vec3D speed = new Vec3D (random(-2,2), random(-2,2), 0);
  
  Vec3D acc = new Vec3D ();
  
  Vec3D mouse = new Vec3D();
  
  Vec3D len = new Vec3D();
  
  //The definition of the object-s location
  cell(Vec3D _loc){
    
    loc = _loc;
  }
 
  /*---------------------------------------------------------------------FUNCTIONS
  A collection of functions to be implemented as modules                        */
  //-----------------------------------------------------------------------------/
  //===========================================================================RUN
  /* The run function will run throught every other function that's called       /
     Here we can set if a particullar section of the code will be called or not  /
     We'll use 3 movement calculation functions. Flock will manage the           /
     interaction of the objects one by one, move will implement the flocking     /
     starting at the object-s initial state and bounce will keep the objects from/
     escapingout of the screen                                                  */
     
  void run(){
    display();
    move();
    bounce();
    flock();
  }
  
  //==========================================================================FLOCK
  /*A collection of functions to be implemented as modules.                       /
  Separate will prevent objects from each other, cohesion will keep objects within/
  a certain radius, align will transfer the direction from one to each other and  /
  mesmerize will create an atraction on the mouse pointer                         /
  //-----------------------------------------------------------------------------*/
  void flock(){
  
    separate(30);
    cohesion(0.0001);
    align(0.1);
    repele(1750);
  }
  //------------------------------------------------------------------ALIGN
  
  void align(float magnitude){
    //clear vector 'steer' (which also defines it) and start a counter
    Vec3D steer= new Vec3D();
    int count = 0;
    
    // Loop to calculate distance between cells
    for(int i=0; i < cellCollection.size(); i++){
      cell other = (cell) cellCollection.get(i);
      float distance = loc.distanceTo(other.loc);
      
      //Generate an influence area and restrict to it
      if(distance>0 && distance <80){
       
        //feed the vector steer with the evaluated speed
        steer.addSelf(other.speed);
        
      }
      
    }
     //avoiding zero division, modulate the steer vector 
     //according to the total number of cells
     if(count>0) {
      steer.normalizeTo(20.0/count);
     }
    //Scale the steer vector with an imput on the RUN area
    //Modify the acceleration with the steer vector and ad 1 to the counter
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
    count++;
}

//--------------------------------------------------------------SEPARATE
void separate(float magnitude){
  //clear vector steer and start counting
  Vec3D steer= new Vec3D();
  int count = 0;
  
  //Evaluate the distances to produce an effect area
  for(int i=0; i < cellCollection.size(); i++){
      cell other = (cell) cellCollection.get(i);
      float distance = loc.distanceTo(other.loc);
      if(distance>0 && distance <50){
        
        //Feed steer vector with the distance between concurrent cells
        //and modulate that
        Vec3D diff = loc.sub(other.loc);
        diff.normalizeTo(1.0/distance);
        
        steer.addSelf(diff);
        count++;
        
      }
    }
    //Distribute the effect 
    if(count>0){
      steer.scaleSelf(1.0/count);
    }
    
    //Scale with the multiplier and modify acceleration
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
    
}

//---------------------------------------------------------------COHESION
void cohesion(float magnitude){
  //same as before
  Vec3D sum= new Vec3D();
  int count = 0;
    
  for(int i=0; i < cellCollection.size(); i++){
      
      cell other = (cell) cellCollection.get(i);
      
      float distance = loc.distanceTo(other.loc);
      
      if(distance>0 && distance <50){
        
        //Cohesion adds both vectors
        sum.addSelf(other.loc);
        count++;
      }
  }
  //Scale the effect within the population
  if(count>0){
    sum.scaleSelf(1.0/count);
  }
  
  //Scale with multiplier and affect acceleration
  Vec3D steer = sum.sub(loc);
  steer.scaleSelf(magnitude);
  acc.addSelf(steer);
}


//--------------------------------------------------------------REPELE MOUSE
void repele(float magnitude){
  //Same as before but also add a vector to store the mouse position
  Vec3D rep= new Vec3D();
  int count = 0;
  mouse = new Vec3D(mouseX, mouseY, 0);
  
  for(int i=0; i < cellCollection.size(); i++){
      
    //find the distance from the mouse pointer to every cell
      float distance = loc.distanceTo(mouse);
      //define influence area
      if(distance>0 && distance <80){        
        
        rep = mouse.sub(loc);
        rep.normalizeTo(1.00/distance);
        
        
      }
    }
    //Scale with every other
    if(count>0){
      rep.scaleSelf(1.0/count);
      count++;
    }
    
    //Scale to multiplier and affect acceleration
    rep.scaleSelf(magnitude);
    acc.subSelf(rep);
    
}


//===========================================================================BOUNCE
  void bounce(){
    //Every time a cell reaches the border, invert its movement
    
    if(loc.x > width){
     speed.x=-1*speed.x;
    }
    if(loc.x < 0){
     speed.x=-1*speed.x;
    }
    if(loc.y > width){
     speed.y=-1*speed.y;
    }
    if(loc.y < 0){
     speed.y=-1*speed.y;
    }
  }

//=============================================================================MOVE
  void move(){
    //Calculate the effect of acceleration over speed 
    //and of speed over the cell position
    
    speed.addSelf(acc);
    
    speed.limit(3);
    
    loc.addSelf(speed);
    
    acc.clear();
    
  }
  
  //========================================================================DISPLAY
  void display(){
    //make some shapes that will resemble the cells
    fill(50, 50, 255, 127);
    noStroke();
    ellipse( loc.x, loc.y, rad, rad);
    ellipse( loc.x, loc.y, rad*2, rad*2);
    fill(255, 50, 50, 20);
    ellipse( loc.x, loc.y, rad*3, rad*3);
    fill(255, 50, 50, 20);
    ellipse( loc.x, loc.y, rad*5, rad*5);
    stroke(50, 50, 255, 127);
    len = speed;
    len.normalize();
    len.scaleSelf(50);
    len = loc.sub(len);
    line(loc.x, loc.y, len.x, len.y);
    noStroke();
    fill(50, 50, 255, 127);
    ellipse(len.x, len.y, rad, rad);
    //There are some glitches after a while
    //Not sure why the counter position works outside or inside 
    //    the visibility brackets. Got there by pure empiria.
  }
  
}

