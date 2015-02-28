
class agent {
  // params
  Vec3D pos;
  Vec3D vel;
  float rangeOfVis;    //how far it can see
  float maxVel;        //how fast it can go
  float maxForce;      //how quickly it can turn
  int maxGroupSize;    //how large the group can get
  int groupSize;       //how large the group actually is

  int sz;              //how large the boid is
  int clashSize;       //how big the base clash is

  color seedColor;     //seed color that drives the rules
  color displayColor;  
  color invertColor;   //
  int opacity;

  float redWeight;
  float blueWeight;
  float greenWeight;

  // constructor 
  agent(Vec3D p, Vec3D v, int s, color col) {
    pos = p.copy();
    vel = v.copy();
    seedColor = col;   
    sz = int(map(brightness(seedColor), 0, 255, s*1.25, s*.75)); 

    //variables
    rangeOfVis = 50;   
    maxVel = map(brightness(seedColor), 0, 255, 1, 3);         
    maxForce = 0.05;    
    maxGroupSize = 25;
    opacity = 10;
    invertColor = color(seedColor, opacity/4);
    boidColor = color(seedColor, opacity);

    redWeight = map(red(seedColor), 0, 255, .1, 2);
    greenWeight = map(green(seedColor), 0, 255, .1, 2);
    blueWeight = map(blue(seedColor), 0, 255, .1, 2);

    displayColor = color(seedColor, opacity);
  }

  // behavior
  void update() {

    Vec3D acc = new Vec3D();

    //call the vector functions
    Vec3D ali = alignment(agentPopulation, rangeOfVis);
    Vec3D sep = separation(agentPopulation, rangeOfVis/2);
    Vec3D coh = cohesion(agentPopulation, rangeOfVis*2);

    //call the invert function
    groupSize = invert(agentPopulation, rangeOfVis, maxGroupSize);

    //scale the vectors
    ali.scaleSelf(redWeight);
    sep.scaleSelf(greenWeight);
    coh.scaleSelf(blueWeight);

    //add the vectors to acc
    acc.addSelf(ali);
    acc.addSelf(sep);
    acc.addSelf(coh);

    //add acc to vel
    vel.addSelf(acc);

    //limit vel
    vel.limit(maxVel);

    if (groupSize != 0) vel.invert();

    pos.addSelf(vel);

    if (pos.x > width) pos.x = 0;
    if (pos.y > height) pos.y = 0;
    if (pos.x < 0) pos.x = width;
    if (pos.y < 0) pos.y = height;
  }


  Vec3D alignment(ArrayList pop, float range) {      //starts with Vec3D means it will return a vec3d

    Vec3D sum = new Vec3D();
    int count = 0;
    for (int i = 0; i < pop.size(); i++) {
      agent a = (agent) pop.get(i);
      float d = pos.distanceTo(a.pos);      //distance to squared(much faster calculation)

      if ((d < range)&&(a!= this)) {
        sum.addSelf(a.vel);
        line(pos.x, pos.y, a.pos.x, a.pos.y);
        count++;
      }
    }


    if (count > 0) {
      sum.scaleSelf(1/(float)count);
      sum.limit(maxForce);
    }
    return sum;
  }




  Vec3D separation (ArrayList pop, float range) {  
    //vectors from the other agents to self agent, add them together
    //give inverse relationship to distance, closer is stronger.
    //multiply by 1/d (basically)
    Vec3D sum = new Vec3D();
    int count = 0;

    for (int i = 0; i < pop.size(); i++) {
      agent a = (agent) pop.get(i); 
      float d = pos.distanceTo(a.pos);

      if ((d < range)&&(a != this)) {
        Vec3D vec = pos.sub(a.pos);
        //scale the vectors
        vec.scaleSelf(1/d);
        //sum the vectors
        sum.addSelf(vec);
        count++;
      }
    }
    //find average velocity
    if (count >0) {
      sum.scaleSelf(1/(float)count);
      sum.limit(maxForce);
    }
    return sum;
  }

  Vec3D cohesion (ArrayList pop, float range) {
    //container for the average position
    Vec3D avg = new Vec3D();
    Vec3D traj = new Vec3D();
    int count = 0;

    for (int i = 0; i < pop.size(); i++) {
      agent a = (agent) pop.get(i);
      float d = pos.distanceTo(a.pos);

      if ((d < range)&&(a != this)) {
        avg.addSelf(a.pos);
        count++;
      }
    }
    if (count > 0) {
      avg.scaleSelf(1/(float)count);
      traj = avg.sub(pos);
      traj.limit(maxForce);
    }
    return traj;
  }


  //constrains the group size, when a certain group size is met, function returns a boolean
  int invert (ArrayList pop, float range, float b) {
    int clusterSize;
    int count = 0;
    for (int i = 0; i < pop.size(); i++) {

      agent a = (agent) pop.get(i);
      float d = pos.distanceTo(a.pos);

      if ((d < range)&&(a != this)) {
        count++;
      }
    }
    if (count >= b) {
      clusterSize = count;
    }
    else {
      clusterSize = 0;
    }

    return clusterSize;
  }

  int[] getNeighbors(ArrayList pop, float range) {
    int neighbors[] = new int[num];
    int counter = 0;

    for (int i =0; i < pop.size(); i++) {
      agent a = (agent) pop.get(i);
      float d = pos.distanceTo(a.pos);

      if (( d < range)&&(a != this)) {
        neighbors[counter] = i;
        counter++;
      }
    }
    return neighbors;
  }



  // ArrayList getNeighbors(ArrayList pop, float range) {
  //  ArrayList neighbors = new ArrayList();
  //  int counter = 0;
  //
  //  for (int i =0; i < pop.size(); i++) {
  //    agent a = (agent) pop.get(i);
  //    float d = pos.distanceTo(a.pos);
  //
  //    if (( d < range)&&(a != this)) {
  //      neighbors.add(a);
  //      counter++;
  //    }
  //  }
  //  return neighbors;
  //}

  void render() {
    //     HACK FOR DRAWING LINES
//    for (int i = 0; i < agentPopulation.size();i++) {
//      agent a = (agent) agentPopulation.get(i);
//      float d = pos.distanceTo(a.pos);
//      if (( d < rangeOfVis)&&(a != this)) {
//        stroke(invertColor);
//        line(pos.x, pos.y, a.pos.x, a.pos.y);
//      }
//    }

    //NOT WORKING
    //int[] neighborList = (int[]) getNeighbors(agentPopulation, rangeOfVis);
    //
    //for(int i = 0; i < neighborList.length; i++){
    //  int neighborIndex = neighborList[i];
    //  agent a = (agent) agentPopulation.get(neighborIndex);
    //  stroke(invertColor);
    //  line(pos.x, pos.y, a.pos.x, a.pos.y);
    //}

    //draw boids
    fill(displayColor);
    ellipse(pos.x, pos.y, sz, sz);

    //draw collisions
    if (groupSize != 0) {
      fill(invertColor);
      //ellipse(pos.x, pos.y, sz*1.5 + groupSize, sz*1.5 + groupSize);
      groupSize = 0;
    }
  }
}

//this week - write cohesion function, and create torus space


