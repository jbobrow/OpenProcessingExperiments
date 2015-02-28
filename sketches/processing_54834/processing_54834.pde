
// THEBIRDS class a class that creates and handles the birds
// it is designed to receive the position of the bird and its type.
// PVectors are used to calculate the motion/ behaviour of each bird.
// each bird can have a different type, a different color, a different size, and a different flapping speed.
// they are created whenever there is a blob with a sound (clap of hands) to the position of the clap
// they initially fly around for a moment and then they go to their target (on the tree) by selecting a PVector (target) from the array of PVectors that
/// stores the possitions that are allowed to sit. an array of booleans makes sure that each bird sits on different place on the tree
boolean [] keepintrack;//arrayofbooleans keepintrack is created so that
//weknow where our birds sit. there is a specific place for them to sit, but
//in order to know if that place is occupied by another bird we created this boolean
int numberofbirds;
boolean killthebird=false;
class THEBIRDS {
  float xmous=0,ymous=height/2;///replacement for mouse 
  float dir=-1;

  PVector mouseXsin;
  boolean foundplace;////when this bool is on the bird searches for a place to sit
  PVector sithere;///this PVector is the place were our bird is going to sit
  int randomnumbertosit;//this number is the number from the array of Pvectors that holds the pos for the birds to sit
  boolean followmouse = false;///follow the mouse when true
  boolean reset=false;//when true reset everything and bird looks for new place to sit 
  int birdframe;///the frame of the animation
  int totalbirdframes;//the "framerate"(total number of frames per loop)
  int randomframe;//this gives the position of the sitting bird. its changes every now and then.
  float dtarg=11;////Distance between targetbranch and bird; 
  int SIT;///the state of my bird ( if sit = 1 the bird is sitting on a brench if 0 then it is flying.
  color c1;//the color of the bird(new for each bird)
  PVector target;///the target of the bird (where our birds is going)
  PVector birdpos;//where our bird is right now
  PVector bird_vel;//the speed that our bird moves
  PVector bird_accel;//the accelaration of our bird
  PVector delta;//the distance between target and birdpos
  PVector slow_down;//slow down when close to target
  PVector sprint;//sprint when away
  PVector deathpos;///the place were our bird goes when dead
  float r;//the size of our bird(tis is not the actual size but a mathematical size to calculate rotation on bird 1)
  float scl;//the size of our bird
  //floats and bool to create randomness in the motion of the birds:
  float maxforce;    
  float maxspeed;   
  float proximity;
  float mass;
  float timer;///
  boolean gototree;//when true go to tree
  float timegototree;
  float life;  
  float angle;
  float angleSpeed;
  float anglebirld;
  boolean approaching;//bird close to target (i used this to remove rotation and allign the frames)
  int type;//the type of our bird
  float timetogotoanotherbrench;//does what it says.
  int idofthisbird;///The id (the number) of this bird each bird has a number.

THEBIRDS(float x, float y, float p ,float t, int id) {  ////my THEBIRDS/birds constructor
    //pass values to public vars:
    idofthisbird =id;
    foundplace = false;
    randomnumbertosit = int(random(numberofplaces));///number of places is the number of places for the bird to sit
    c1 = color(int(random(255,50)),0,0);
    type = int(t);
    if (type==1){birdframe = int(random(9)); totalbirdframes =10;}
    if (type==2){birdframe = int(random(19)); totalbirdframes =22;}
    if (type==3){birdframe = int(random(12)); totalbirdframes =14;}   
    if (type==4){birdframe = int(random(11)); totalbirdframes =11;}
    SIT=0;
    randomframe = int(random(14));
    scl = random(0.7,1);
    bird_accel = new PVector(0, 0);
    bird_vel = new PVector(random(-1, 1), random(-1, 1));
    birdpos = new PVector(x, y);
    delta = new PVector(10,10);
    deathpos = new PVector(random(height,height+100),random(-100,-34));
    sprint = new PVector(.009,.009);
    slow_down = new PVector (5.49,5.49);
    target = new PVector(random(400,width),random(400,height));
    r = 10;
    timegototree = random(0,100);
    maxspeed = 1;
    maxforce = 0.005;
    proximity = p;
    angleSpeed = random(1,2);
    mass = 5;
    timetogotoanotherbrench = random(200,4000);
  }

  void run(ArrayList<THEBIRDS> THEBIRDSs) {
    flock(THEBIRDSs);
    update();
    //borders();
    render();
    motionmous();
    if(timegototree<50){
    timetodie();}
  }

void motionmous(){
 xmous+=dir;
 if(xmous>500||xmous<-500)dir*=-1;
//println(xmous);
}
  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    force.div(mass);
    bird_accel.add(force);
  }

void timetodie(){
  if(idofthisbird>10){
  if (idofthisbird==numberofbirds-1){
  target = deathpos;
  float death = PVector.dist(birdpos, deathpos);

  if(death<50)killthebird=true;
  }}
}

  // We accumulate a new bird_accel each time based on three rules
  void flock(ArrayList<THEBIRDS> THEBIRDSs) {
   PVector sep = separation(THEBIRDSs);   // Separation
    PVector ali = align(THEBIRDSs);      // Alignment
   PVector coh = cohesion(THEBIRDSs);   // Cohesion
    // Arbitrarily weight these forces
   sep.mult(0.1);
    ali.mult(0.1);
    coh.mult(0.1);
    // Add the force vectors to bird_accel
   applyForce(sep);
   applyForce(ali);
   applyForce(coh);
/////THE FOLLOWING algorythm sets the sensitivity of the mouse - bird relationship
//// the bigger the number d the larger the distance that the mouse affects the bird.
      PVector blob1 = new PVector(xmous, ymous, 0);
      float d = PVector.dist(blob1, birdpos);
      //println(timegototree);
      if(d<80)reset=true;
     if(d<30){followmouse=true; timer=0;timegototree = 220;};///time to go to tree is the time the bird will fly away from the tree
     if(timer<240){timer++;}///the timer is the time that the bird will follow your mouse
     if(timer>230)followmouse=false;
     if(timegototree>0)timegototree--;
     if(timegototree<30)gototree=true;
  if(gototree){
    if(timegototree>159){
  delta.x = xmous+random(100) - birdpos.x;
  delta.y = ymous+random(100) - birdpos.y;
    //slow_down.x=.99; slow_down.y=.99;

}
 if(reset){///reset is a procedure to put the bird into a new place whenever it is called true;
   foundplace =false;
   keepintrack[randomnumbertosit]=false;
  reset=false;  
  }
  if(timegototree<30){
  delta.x = target.x - birdpos.x;
  delta.y = target.y - birdpos.y;
  }
 
 /* 
  delta.mult(sprint);
  birdpos.add(delta);
  delta.mult(sprint);
  birdpos.add(delta);
  println(dtarg);
*/
 
  delta.mult(sprint);//differend motion to the tree
  bird_accel.add(delta);
  birdpos.add(bird_accel);
  bird_accel.mult(slow_down);
  dtarg = PVector.dist(target, birdpos);
  if(dtarg<1){SIT=1;}if(dtarg>10)SIT=0;

  }
  
  if (followmouse) {
     
      float weight = map(d, 0, 200, 5, 0);
      weight = constrain(weight, 0, 5);

      PVector ste = seek(blob1);
      ste.mult(weight);
      if (d>proximity)
        applyForce(ste);
  
      PVector blob2 = new PVector(xmous, ymous, 0);
         fill(0);
      stroke(10);  
      //rect(width-mouseXsin, mouseXsin, 11, 11);
           fill(255);
      stroke(100); 
       
     

      d = PVector.dist(blob2, birdpos);
      weight = map(d, 0, 200, 5, 0);
      weight = constrain(weight, 0, 15);

      ste = seek(blob2);
      ste.mult(weight);
      if (d>proximity)
        applyForce(ste);
    }

    //blob.set(width-mouseXsin, mouseXsin, 0);
  }

  // Method to update birdpos
  void update() {
    
     if(timetogotoanotherbrench>0){
   timetogotoanotherbrench--;    
  }
  if(timetogotoanotherbrench<(10)){
  reset=true;
  timetogotoanotherbrench=random(300,1000);
  }
    
    //find a place to sit:
    
    
    if(!foundplace){
    if(!keepintrack[randomnumbertosit]){
     target.x = placestosit[randomnumbertosit].x;
     target.y = placestosit[randomnumbertosit].y;
    keepintrack[randomnumbertosit]=true;
    foundplace=true;
    }
    if(keepintrack[randomnumbertosit]){
     randomnumbertosit = int(random(numberofplaces));   
    }
    }
       
    
    // Update bird_vel
    birdframe = (birdframe+1)% totalbirdframes;
    bird_accel.limit(bird_vel.mag()*0.3);
    bird_vel.add(bird_accel);
    // Limit speed
    bird_vel.limit(maxspeed);
//    bird_vel.mult(random(1,1.5));
    
    birdpos.add(bird_vel);
    // Reset accelertion to 0 each cycle
    bird_accel.mult(0);
  }
  


  // A method that calculates and applies a steering force towards a target
  //STEER = DESIRED MINUS bird_vel
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, birdpos);  // A vector pointing from the birdpos to the target
    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.mult(maxspeed);
    // Steering = Desired minus bird_vel
    PVector steer = PVector.sub(desired, bird_vel);
    steer.limit(maxforce);  // Limit to maximum steering force
    return steer;
  }

  void render() {
    //this is rotation for bird one( the bird that has not upper or lower body differences)
    
    angle = angle+angleSpeed;
    float offsetHead;
    float offsetTail;
    
    offsetHead = sin(angle*0.2+PI)*0;
    offsetTail = sin(angle*0.2+PI/2)*1;
    float theta=30;
    if(dtarg>10){theta = bird_vel.heading2D() + radians(90);}//if bird away from target spin its head to the target(bird_vel points to that)
    fill(c1);
   // println(theta);
   // noStroke();
   stroke(random(100),random(100),random(100));
    pushMatrix();
    translate(birdpos.x, birdpos.y);
    if(type==1&&SIT==0)rotate(theta);
    if(type==2)//rotate(theta);
    if(type==3)rotate(theta);
    //if(type==4)rotate(theta);
scale(0.7);
    scale(scl);
    bird(type,birdframe,SIT,randomframe);

    popMatrix();
   
  }

  void borders() {///make sure that the birds stay inside our sketch.
    if (birdpos.x < -r) bird_vel.x = -bird_vel.x;
    if (birdpos.y < -r) bird_vel.y = -bird_vel.y;
    if (birdpos.x > width+r) bird_vel.x = -bird_vel.x;
    if (birdpos.y > height+r) bird_vel.y = -bird_vel.y;
  }

 
  // separation checks for nearby THEBIRDSs and steers away
  // this part of the code is borrowed by daniel Shifman's example
  /// it is basically the motion of the birds when they are a flock.
  /// in the final sketch the time the birds spend in this part of the code is very limited.
  PVector separation (ArrayList<THEBIRDS> THEBIRDSs) {
    float desiredseparation = 25.0f;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    // For every THEBIRDS in the system, check if it's too close
    for (THEBIRDS other : THEBIRDSs) {
      float d = PVector.dist(birdpos, other.birdpos);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(birdpos, other.birdpos);
        diff.normalize();
        diff.div(d);        // Weight by distance
        steer.mult(diff);////make this .add to reduce the space.
        count++;  
///println(count);        // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      steer.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // Implement Reynolds: Steering = Desired - bird_vel
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(bird_vel);
      steer.limit(maxforce);
    }
    return steer;
  }

  // Alignment
  // For every nearby THEBIRDS in the system, calculate the average bird_vel
  PVector align (ArrayList<THEBIRDS> THEBIRDSs) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (THEBIRDS other : THEBIRDSs) {
      float d = PVector.dist(birdpos, other.birdpos);

      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.bird_vel);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum, bird_vel);
      steer.limit(maxforce);
      return steer;
    } 
    else {
      return new PVector(0, 0);
    }
  }

  // Cohesion
  // For the average birdpos (i.e. center) of all nearby THEBIRDSs, calculate steering vector towards that birdpos
  PVector cohesion (ArrayList<THEBIRDS> THEBIRDSs) {
    float neighbordist = 150;
    PVector sum = new PVector(0, 0);   // Start with empty vector to accumulate all birdposs
    int count = 0;
    for (THEBIRDS other : THEBIRDSs) {
      float d = PVector.dist(birdpos, other.birdpos);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.birdpos); // Add birdpos
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);  // Steer towards the birdpos
    } 
    else {
      return new PVector(0, 0);
    }
  }
}


