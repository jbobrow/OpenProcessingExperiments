
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
  float rad = random(1, 10);
  
  PVector loc = new PVector (0, 0, 0);
  
  //really low speed to start
  PVector speed = new PVector (random(-0.0001,0.0001), random(-0.0001,0.0001), 0);
  
  PVector acc = new PVector ();
  
  PVector mouse = new PVector();
  
  PVector len = new PVector();
  
  //The definition of the object's location
  cell(PVector _loc){
    
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
    mcfly();
    flock();
  }
  
  //==========================================================================FLOCK
  /*A collection of functions to be implemented as modules.                       /
  Separate will prevent objects from each other, cohesion will keep objects within/
  a certain radius, align will transfer the direction from one to each other and  /
  mesmerize will create an atraction on the mouse pointer                         /
  //-----------------------------------------------------------------------------*/
  void flock(){
  
    separate(3);
    cohesion(0.0001);
    align(0.1);
    repele(1750);
  }
  //------------------------------------------------------------------ALIGN
  
  void align(float magnitude){
    //clear vector 'steer' (which also defines it) and start a counter
    PVector steer= new PVector();
    int count = 0;
    
    // Loop to calculate distance between cells
    for(int i=0; i < cellCollection.size(); i++){
      cell other = (cell) cellCollection.get(i);
      float distance = dist(loc.x, loc.y, other.loc.x, other.loc.y);
      
      //Generate an influence area and restrict to it
      if(distance>0 && distance <80){
       
        //feed the vector steer with the evaluated speed
        steer.add(other.speed);
        
      }
      
    }
     //avoiding zero division, modulate the steer vector 
     //according to the total number of cells
     if(count>0) {
      steer.normalize();
      steer.mult(20/count);
     }
    //Scale the steer vector with an imput on the RUN area
    //Modify the acceleration with the steer vector and ad 1 to the counter
    steer.mult(magnitude);
    acc.add(steer);
    count++;
}

//--------------------------------------------------------------SEPARATE
void separate(float magnitude){
  //clear vector steer and start counting
  PVector steer= new PVector();
  int count = 0;
  
  //Evaluate the distances to produce an effect area
  for(int i=0; i < cellCollection.size(); i++){
      cell other = (cell) cellCollection.get(i);
      float distance = dist(loc.x, loc.y, other.loc.x, other.loc.y);
      if(distance>0 && distance <50){
        
        //Feed steering vector with the distance between concurrent cells
        //and modulate that
        PVector diff = new PVector (loc.x-other.loc.x, loc.y-other.loc.y);
        diff.normalize();
        diff.mult(1.0/distance);
        
        steer.add(diff);
        count++;
        
      }
    }
    //Distribute the effect 
    if(count>0){
      steer.mult(1.0/count);
    }
    
    //Scale with the multiplier and modify acceleration
    steer.mult(magnitude);
    acc.add(steer);
    
}

//---------------------------------------------------------------COHESION
void cohesion(float magnitude){
  //same as before
  PVector sum= new PVector();
  int count = 0;
    
  for(int i=0; i < cellCollection.size(); i++){
      
      cell other = (cell) cellCollection.get(i);
      
      float distance = dist(loc.x, loc.y, other.loc.x, other.loc.y);
      
      if(distance>0 && distance <50){
        
        //Cohesion adds both vectors
        sum.add(other.loc);
        count++;
      }
  }
  //Scale the effect within the population
  if(count>0){
    sum.mult(1.0/count);
  }
  
  //Scale with multiplier and affect acceleration
  PVector steer = sum;
  sum.sub(loc);
  steer.mult(magnitude);
  acc.add(steer);
}


//--------------------------------------------------------------REPELE MOUSE
void repele(float magnitude){
  //Same as before but also add a vector to store the mouse position
  PVector rep= new PVector();
  int count = 0;
  mouse = new PVector(mouseX, mouseY, 0);
  
  for(int i=0; i < cellCollection.size(); i++){
      
    //find the distance from the mouse pointer to every cell
      float distance = dist(loc.x, loc.y, mouse.x, mouse.y);
      //define influence area
      if(distance>0 && distance <80){        
        
        mouse.sub(loc);
        rep = mouse;
        rep.normalize();
        rep.mult(1.0/distance);
        
        
      }
    }
    //Scale with every other
    if(count>0){
      rep.mult(1.0/count);
      count++;
    }
    
    //Scale to multiplier and affect acceleration
    rep.mult(magnitude);
    acc.sub(rep);
    
}


//===========================================================================McFLY
  void mcfly(){
    //Every time a cell reaches the border, gets to the other side
    
    if(loc.x > width){
     loc.x = 0;
    }
    if(loc.x < 0){
     loc.x = width;
    }
    if(loc.y > height){
     loc.y = 0;
    }
    if(loc.y < 0){
     loc.y = height;
    }
  }

//=============================================================================MOVE
  void move(){
    //Calculate the effect of acceleration over speed 
    //and of speed over the cell position
    
    speed.add(acc);
    //reducing speed to absurd
    speed.mult(0.00000000001);
    
    loc.add(speed);
    
    //limiting speed to a tiny little small number
    speed.limit(0.0001);
    
    acc.sub(acc);
    
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
    len.mult(50);
    //len = loc.sub(len);
    PVector aux = new PVector ();
    aux = loc;
    aux.sub(len);
    len = aux;
    line(loc.x, loc.y, len.x, len.y);
    noStroke();
    fill(50, 50, 255, 127);
    ellipse(len.x, len.y, rad, rad);
    //The cells keep moving too fast, even if I try to modify their speed
  }
  
}

