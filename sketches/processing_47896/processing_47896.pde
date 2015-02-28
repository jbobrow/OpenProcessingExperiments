
//proximity
//ground coverage
//sun surface
//circulation
//sun relative to ground
//


int lastTimeCheck;
int lastTimeCheck2;
boolean runonce1 = true;
ArrayList<Vec3D> type1;
ArrayList<Vec3D> type2;
String cha;
int timeIntervalFlag = 1;
int timeIntervalFlag1 = 1;

void runBBox() {
  for (int i=0;i<importedCOM.size();i++) {
    importedCOM.get(i).runCOM(int(buildingNum/6));
  }   

  for (int i=0;i<importedGREEN.size();i++) {
    importedGREEN.get(i).runGREEN(0);
  }   

  for (int i=0;i<importedIND.size();i++) {
    importedIND.get(i).runIND(int(buildingNum/8));
  }   

  for (int i=0;i<importedPA.size();i++) {
    importedPA.get(i).runPA(int(buildingNum/8));
  }   

  for (int i=0;i<importedPED.size();i++) {
    importedPED.get(i).runPED(0);
  }   

  for (int i=0;i<importedPUB.size();i++) {
    importedPUB.get(i).runPUB(0);
  }   

  for (int i=0;i<importedRES.size();i++) {
    importedRES.get(i).runRES(int(buildingNum/4));
  }   

  for (int i=0;i<importedROAD.size();i++) {
    importedROAD.get(i).runROAD(0);
  }
  for (int i=0;i<transitList.size();i++) {
    transitList.get(i).runTRANSIT(1);
  }
  for (int i=0;i<carparkList.size();i++) {
    carparkList.get(i).runCARPARK(1);
  }
  for (int i=0;i<playgroundList.size();i++) {
    playgroundList.get(i).runPLAYGROUND(1);
  }
  for (int i=0;i<allotmentList.size();i++) {
    allotmentList.get(i).runALLOTMENT(1);
  }
  for (int i=0;i<treeList.size();i++) {
    treeList.get(i).runTREE(1);
  }
}

class AgentQ {
  // GLOBAL VARIABLES
  Vec3D loc = new Vec3D (0, 0, 0);
  //Vec3D speed = new Vec3D(random(-0.1, 0.1), random(-0.1, 0.1), random(-0.1, 0.1));
  Vec3D speed = new Vec3D(0, 0, 0);
  Vec3D acc = new Vec3D(0, 0, 0);
  color colour;

  float ht = 300;
  boolean perchBool;
  float repeldist;
  float drag;



  float x;
  float y;


  float multiplier = 1;
  float maxDis;
  int seekStop = 0;
  int timeIntervalFlag = 30;
  BoundingBox parent;

  //CONSTRUCTOR
  AgentQ(Vec3D _loc, color _colour) {
    loc = _loc;
    colour = _colour;
  }

  AgentQ(Vec3D _loc, color _colour, float _maxDis) {
    loc = _loc;
    colour = _colour;
  }


  AgentQ(Vec3D _loc, color _colour, BoundingBox _parent, float _x, float _y) {
    loc = _loc;
    colour = _colour;
    parent = _parent;
    x = _x;
    y = _y;
  }

  void runRoomRES(BoundingBox _parent, String chastring) {
    parent = _parent;
    //speed = speed.addSelf(parent.pos());
    cha = chastring;
    display();
    maxheight(buildingNum/4);
    // seperate(world, 0.1, 5);
    seperateBB(importedROAD, 15, 22);
    //  seperateBB(importedGREEN, 10, 10);
    seperateBB(importedIND, 10, 25);
    seperateBB(importedPUB, 10, 15);
    seperateBB(importedGREEN, 5, 15);
    moveBoxUp(world, 5*buildingSize, 3);                              ///(ArrayList type, float maxdist, float maxheight)
    //borderParent(0.05, 150);
    friction(0.95);
    ground();
    //  moveBoxDown(world, 5, 3);                                    //(ArrayList type,float maxdist, float maxheight)
    boxs(5*buildingSize, 5*buildingSize, 3, 3, color(0, 0, 255, 65));                                      // (float x, float y, float z, float maxheight)
    //  calcSun(world);
    greensun(importedGREEN);
    sunwall(world);
    groundcoverage(world, 5*buildingSize, 3);
    boxgravity();
    tree(world, treeList);
    allotment(world, allotmentList);
    sunblock(world);

    // smallcluster(world);
    //  gravity();
    move();
  }

  void runRoomIND(BoundingBox _parent, String chastring) {
    parent = _parent;
    //speed = speed.addSelf(parent.pos());
    cha = chastring;
    display();
    maxheight(buildingNum/9);  
    //   seperatecluster(world, 0.0001, 70);
    //smallcluster(world, 0.03);
    seperate(world, 0.3, 5);
    seperateBB(importedROAD, 12, 15);
    seperateBB(importedRES, 15, 50);
    // seperateBB(importedPUB, 500,150);
    moveBoxUp(world, 7*buildingSize, 4);                                ///(ArrayList type, float maxdist, float maxheight)
    borderParent(0.1, 500);
    friction(0.95);
    ground();
    moveBoxDown(world, 7, 4);                                    //(ArrayList type,float maxdist, float maxheight)
    boxs(7*buildingSize, 7*buildingSize, 4, 4, color(127, 0, 255, 65));                                         // (float x, float y, float z, float maxheight)
    //boxgravity();
    move();
  }

  void runRoomCOM(BoundingBox _parent, String chastring) {
    /*
    parent = _parent;
     //speed = speed.addSelf(parent.pos());
     cha = chastring;
     display();
     maxheight(7);
     
     seperate(world, 0.1, 15);
     seperateBB(importedROAD, 15, 50);
     seperateBB(importedIND, -1, 35);
     //seperateBB(importedRES, 500,150);
     moveBoxUp(world, 5, 3);                              ///(ArrayList type, float maxdist, float maxheight)
     borderParent(0.1, 35);
     friction(0.95);
     ground();
     moveBoxDown(world, 5, 3);                                    //(ArrayList type,float maxdist, float maxheight)
     boxs(5, 5, 3, 3, color(255, 50, 0));                                      // (float x, float y, float z, float maxheight)
     boxgravity();
     move();
     */
    parent = _parent;

    cha = chastring;
    display();
    maxheight(buildingNum/10.5);

    seperateBB(importedROAD, 15, 22);

    seperateBB(importedIND, 10, 25);
    seperateBB(importedPUB, 10, 15);
    moveBoxUp(world, 6*buildingSize, 3.5);                              ///(ArrayList type, float maxdist, float maxheight)

    friction(0.95);
    ground();
    //(ArrayList type,float maxdist, float maxheight)
    boxs(6*buildingSize, 6*buildingSize, 3.5, 3.5, color(255, 50, 0, 65));                                    // (float x, float y, float z, float maxheight)
    groundcoverage(world, 6*buildingSize, 3.5);
    boxgravity();
    move();
  }

  void runRoomPA(BoundingBox _parent, String chastring) {
    /*
    parent = _parent;
     cha = chastring;
     display();
     maxheight(10);
     seperatecluster(world, 0.0001, 100);
     smallcluster(world, 0.05);
     seperateBB(importedROAD, 4, 30);
     seperateBB(importedRES, -5, 30);
     seperateBB(importedIND, 4, 30);
     moveBoxUp(world, 5, 3);                              ///(ArrayList type, float maxdist, float maxheight)
     borderParent(0.01, 35);
     friction(0.95);
     ground();
     moveBoxDown(world, 5, 3);                                    //(ArrayList type,float maxdist, float maxheight)
     boxs(5, 5, 3, 3, color(0, 127, 255));                                      // (float x, float y, float z, float maxheight)
     boxgravity();
     move();
     */
    parent = _parent;

    cha = chastring;
    display();
    maxheight(buildingNum/7.5);

    seperateBB(importedROAD, 15, 22);

    seperateBB(importedIND, 10, 25);
    seperateBB(importedPUB, 10, 15);
    moveBoxUp(world, 5*buildingSize, 3);                              ///(ArrayList type, float maxdist, float maxheight)

    friction(0.95);
    ground();
    //(ArrayList type,float maxdist, float maxheight)
    boxs(5*buildingSize, 5*buildingSize, 3, 3, color(0, 127, 255, 65));                                    // (float x, float y, float z, float maxheight)
    groundcoverage(world, 5*buildingSize, 3);
    boxgravity();
    move();
  }



  Vec3D pos() {
    return  loc;
  }

  void boxgravity () {
    if (loc.z > 0) {
      acc.addSelf(0, 0, -0.05);
    }
  }

  void tree(ArrayList type1, ArrayList type2) {

    int count1 =0;
    int count2 =0;

    if (cha == "RES") {
      for (int i = 0; i < type1.size(); i++) {
        AgentQ other = (AgentQ)type1.get(i);
        float distance = sqrt((sq(other.loc.x-loc.x)) + (sq(other.loc.y - loc.y)));

        if (distance > 0 && distance < 20) {
          count1++;
        }
      }
    }
    for (int i = 0; i < type2.size(); i++) {
      BoundingBox other = (BoundingBox)type2.get(i);
      float distance = sqrt((sq(other.pos.x-loc.x)) + (sq(other.pos.y - loc.y)));

      if (distance > 0 && distance < 13) {
        count2++;
      }
    }
    if ( count1>1 && count2 <2 ) { 
      treeList.add(new BoundingBox(new Vec3D(loc.x+random(-35, 35), loc.y+random(-35, 35), 0), 0.15, 10));
    }
  }

  void allotment(ArrayList type1, ArrayList type2) {              

    int count1 =0;
    int count2 =0;
    Vec3D steer = new Vec3D(speed);

    if (cha == "RES") {
      for (int i = 0; i < type1.size(); i++) {
        AgentQ other = (AgentQ)type1.get(i);
        // float distance = sqrt((sq(other.loc.x-loc.x)) + (sq(other.loc.y - loc.y)));
        float distance = loc.distanceTo(other.loc);
        if (distance > 0 && distance < 60) {
          count1++;
        }
      }
    }

    for (int i = 0; i < type2.size(); i++) {
      BoundingBox other = (BoundingBox)type2.get(i);
      float distance = sqrt((sq(other.pos.x-loc.x)) + (sq(other.pos.y - loc.y)));

      if (distance > 0 && distance < 60) {
        count2++;
      }
    }
    if (millis() > lastTimeCheck2 + timeIntervalFlag1) {
      lastTimeCheck2 = millis ();
      if (frameCount>100) { 
        //(world,allotmentList);
        if (count1>1 && count2 <20  && steer.x > -0.001   && steer.x < 0.001  && steer.y >  -0.001 && steer.y < 0.001 ) { 
          allotmentList.add(new BoundingBox(new Vec3D(loc.x+random(-0.1, 0.1), loc.y+random(-0.1, 0.1), loc.z), 0.15, 10));
        }
      }
    }
  }

  void smallcluster(ArrayList type, float magnitude) {
    int count =0;
    Vec3D steer = new Vec3D();
    Vec3D direction = new Vec3D();   
    if (loc.z ==0) {

      for (int i =0; i < type.size(); i++) {
        AgentQ other = (AgentQ)type.get(i);
        float diff = loc.distanceTo(other.loc);
        if (diff > 0 && diff < 3) {
          count++;
        }
      }
      int count2 =0;
      if (count==0) {
        fill(255, 0, 0);
        ellipse(loc.x, loc.y, 5, 5);
        for (int i =0; i < type.size(); i++) {
          AgentQ other = (AgentQ)type.get(i);
          float diff2 = loc.distanceTo(other.loc);
          if (diff2 >= 0 && diff2 < 7) {
            direction = other.loc.sub(loc);
            if (count2 <3) {

              direction.normalizeTo(1.0);
              direction.scaleSelf(magnitude);
              steer.addSelf(direction); 
              //   println(steer);
              //   stroke(255);
              //    line(loc.x, loc.y, direction.x+loc.x, direction.y + loc.y);
              count2++;
            }
          }
        }
      }

      int count3 =0;
      if (count<4) {
        for (int i =0; i < type.size(); i++) {
          AgentQ other = (AgentQ)type.get(i);
          float diff2 = loc.distanceTo(other.loc);
          if (diff2 >= 7 && diff2 < 20) {
            direction.scaleSelf(50);
            direction = other.loc.sub(loc);
            if (count3 <1) {
              direction.normalizeTo(1.0);
              direction.scaleSelf(magnitude*0.6);
              steer.addSelf(direction);
            }
          }
        }
      }
      acc.addSelf(steer);
    }
  }

  void seperatecluster(ArrayList type, float magnitude, float maxdist) {
    Vec3D steer = new Vec3D();
    int count = 0;
    for (int i = 0; i < type.size(); i++) {
      AgentQ other = (AgentQ)type.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance >0 && distance < maxdist) {
        Vec3D diff = loc.sub(other.loc);
        diff.normalizeTo(1.0/distance);
        steer.addSelf(diff);
        count++;
      }
    }
    if (count >0) {
      steer.scaleSelf(count/5);
    }
    steer.scaleSelf(magnitude);
    acc.addSelf(steer.x, steer.y, 0);
  }

  void groundcoverage(ArrayList type, float maxdist, float maxheight) {
    int count =0;
    Vec3D steer = new Vec3D();
    for (int i =0; i < type.size(); i++) {

      AgentQ other = (AgentQ)type.get(i);

      float distance = sqrt((sq(other.loc.x-loc.x)) + (sq(other.loc.y - loc.y)));
      float distancez = loc.z - other.loc.z;
      if (distancez == 0  && distance <maxdist*2 ) {
        count++;
        //   steer.addSelf(
      }
    }
    if ( count > 5) {
      loc.x = loc.x+random(-12, 12);
      loc.y = loc.y+random(-12, 12);
    }
  }

  void maxheight(float magnitude) {
    if (loc.z>magnitude) {
      loc.z = 0;
      loc.x = loc.x + random(-5, 5);
      loc.y = loc.y + random(-5, 5);
    }
  }

  void sunwall(ArrayList type) {
    int count = 0;
    int count2 = 0;
    Vec3D steer = new Vec3D();
    Vec3D north = new Vec3D(0, -1, 0);  
    Vec3D diffAngle = new Vec3D();   

    for (int i = 0; i < type.size();i++) {
      AgentQ other = (AgentQ)type.get(i);
      float diff = loc.distanceTo(other.loc);

      if (diff >0 && diff < 20) {
        diffAngle = loc.sub(other.loc);
        float diffAngleSun = north.angleBetween(diffAngle);
        if (diffAngleSun >0 && diffAngleSun < PI*52/180) {
          count++;
        }
      }
      if (count>3) {
        if (diff > 7.5 && diff<3*12.5 ) {

          diffAngle = loc.sub(other.loc);
          float diffAngleSun = north.angleBetween(diffAngle);
          if (diffAngleSun >0 && diffAngleSun < PI*30.5/180) {

            count2++;
          }
        }
      }
      if (count2>1) {
        steer.add(0, 100, 0);
      }
    }

    acc.addSelf(steer);
  }

  void greensun(ArrayList type) {
    int count =0;
    noFill();

    Vec3D newloc = loc.add(0, 4, -loc.z);

    if (loc.z >= 0 && loc.z < 6  ) {
      for (int i = 0; i < type.size();i++) {
        BoundingBox other = (BoundingBox)type.get(i);
        float diff = newloc.distanceTo(other.pos());
        if (diff >0 && diff < 7) {
          count++;
        }
      }
      if ( count > 0) {
        loc.y = loc.y -4;
      }
    }
    if (loc.z >= 6 && loc.z < 9  ) {
      for (int i = 0; i < type.size();i++) {
        BoundingBox other = (BoundingBox)type.get(i);
        float diff = newloc.distanceTo(other.pos());
        if (diff >0 && diff < 7) {
          count++;
        }
      }
      if ( count > 0) {
        loc.y = loc.y -9;
      }
    }
    if (loc.z >=9 && loc.z < 12  ) {
      for (int i = 0; i < type.size();i++) {
        BoundingBox other = (BoundingBox)type.get(i);
        float diff = newloc.distanceTo(other.pos());
        if (diff >0 && diff < 7) {
          count++;
        }
      }
      if ( count > 0) {
        loc.y = loc.y -12;
        stroke(255);
        //   line(loc.x, loc.y, loc.z, loc.x, loc.y, loc.z+60);
      }
    }
    if (loc.z >=12 && loc.z < 15  ) {
      for (int i = 0; i < type.size();i++) {
        BoundingBox other = (BoundingBox)type.get(i);
        float diff = newloc.distanceTo(other.pos());
        if (diff >0 && diff < 7) {
          count++;
        }
      }
      if ( count > 0) {
        loc.y = loc.y -15;
      }
    }
    if (loc.z >=15 && loc.z < 18  ) {
      for (int i = 0; i < type.size();i++) {
        BoundingBox other = (BoundingBox)type.get(i);
        float diff = newloc.distanceTo(other.pos());
        if (diff >0 && diff < 7) {
          count++;
        }
      }
      if ( count > 0) {
        loc.y = loc.y -18;
      }
    }
    if (loc.z >=18 && loc.z < 24  ) {
      for (int i = 0; i < type.size();i++) {
        BoundingBox other = (BoundingBox)type.get(i);
        float diff = newloc.distanceTo(other.pos());
        if (diff >0 && diff < 7) {
          count++;
        }
      }
      if ( count > 0) {
        loc.y = loc.y -21;
      }
    }
    if (loc.z >=24 && loc.z < 27  ) {
      for (int i = 0; i < type.size();i++) {
        BoundingBox other = (BoundingBox)type.get(i);
        float diff = newloc.distanceTo(other.pos());
        if (diff >0 && diff < 7) {
          count++;
        }
      }
      if ( count > 0) {
        loc.y = loc.y -27;
      }
    }
    if (loc.z >=27  && loc.z < 30 ) {
      for (int i = 0; i < type.size();i++) {
        BoundingBox other = (BoundingBox)type.get(i);
        float diff = newloc.distanceTo(other.pos());
        if (diff >0 && diff < 7) {
          count++;
        }
      }
      if ( count > 0) {
        loc.y = loc.y -30;
      }
    }
    if (loc.z >=30  && loc.z < 33 ) {
      for (int i = 0; i < type.size();i++) {
        BoundingBox other = (BoundingBox)type.get(i);
        float diff = newloc.distanceTo(other.pos());
        if (diff >0 && diff < 7) {
          count++;
        }
      }
      if ( count > 0) {
        loc.y = loc.y -33;
      }
    }
    if (loc.z >=33  && loc.z < 36 ) {
      for (int i = 0; i < type.size();i++) {
        BoundingBox other = (BoundingBox)type.get(i);
        float diff = newloc.distanceTo(other.pos());
        if (diff >0 && diff < 7) {
          count++;
        }
      }
      if ( count > 0) {
        loc.y = loc.y -36;
      }
    }
    if (loc.z >=36  && loc.z < 39 ) {
      for (int i = 0; i < type.size();i++) {
        BoundingBox other = (BoundingBox)type.get(i);
        float diff = newloc.distanceTo(other.pos());
        if (diff >0 && diff < 7) {
          count++;
        }
      }
      if ( count > 0) {
        loc.y = loc.y -39;
      }
    }
    if (loc.z >=39) {
      for (int i = 0; i < type.size();i++) {
        BoundingBox other = (BoundingBox)type.get(i);
        float diff = newloc.distanceTo(other.pos());
        if (diff >0 && diff < 7) {
          count++;
        }
      }
      if ( count > 0) {
        loc.y = loc.y -42;
      }
    }
  }



  void calcSun(ArrayList type) {
    int count = 0;
    Vec3D north = new Vec3D(0, -1, 0);  
    Vec3D diffAngle = new Vec3D();   

    for (int i = 0; i < type.size();i++) {
      AgentQ other = (AgentQ)type.get(i);
      float diff = loc.distanceTo(other.loc);

      if (diff >0 && diff < 120) {
        diffAngle = loc.sub(other.loc);
        float diffAngleSun = north.angleBetween(diffAngle);
        if (diffAngleSun >0 && diffAngleSun < PI/6) {
          count++;
        }
      }
    }
    if (count>0) {
      Vec3D steer = new Vec3D (0, -count/3, 0);
      steer.scaleSelf(1);
      speed.addSelf(steer);
    }
  }


  void boxs(float x, float y, float z, float maxheight, color c) {
    pushMatrix();
    fill(c);
    noStroke();
    //  noStroke();
    //stroke(0,0,255);
    translate(loc.x, loc.y, loc.z+maxheight/2);
    box(x, y, z);     
    popMatrix();
  }

  void align(ArrayList type, float magnitude, float maxdist) {
    Vec3D front = new Vec3D();
    int count = 0;
    for (int i =0; i < type.size(); i++) {
      AgentQ other = (AgentQ)type.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance > 0 && distance < maxdist ) {
        front.addSelf(other.speed);
        count++;
      }
    }
    if (count>0) {
      front.scaleSelf(1.0/count);
    }
    front.scaleSelf(magnitude);
    acc.addSelf(front);
  }

  void moveBoxUp(ArrayList type, float maxdist, float maxheight) {
    int count =0;
    for (int i =0; i < type.size(); i++) {
      AgentQ other = (AgentQ)type.get(i);
      float distance = sqrt((sq(other.loc.x-loc.x)) + (sq(other.loc.y-loc.y)));
      float distancez = other.loc.z - loc.z;
      if (distance > 0 && distance < maxdist && distancez == 0 ) {
        count++;
      }
      if (loc.z >=0 && loc.z < 3 && count>8) {
        loc.z = loc.z + maxheight;
      }
      if (loc.z >=3 && loc.z < 6 && count>7) {
        loc.z = loc.z + maxheight;
      }

      if (loc.z >=6 && loc.z < 9 && count>6) {
        loc.z = loc.z + maxheight;
      }
      if (loc.z >=9 && loc.z < 12 && count>5) {
        loc.z = loc.z + maxheight;
      }
      if (loc.z >=12 && loc.z < 15 && count>4) {
        loc.z = loc.z + maxheight;
      }



      if (loc.z >=15 && count>3) {
        loc.z = loc.z + maxheight;
      }

      if (distance > 0 && distance < maxdist/2 && distancez <0 && distancez > -maxheight ) {
        loc.z = loc.z + maxheight+distancez;
      }
    }
  }


  void ground() {
    if ( loc.z <0) {
      loc.z = 0;
    }
  }

  void gravity() {
    if (millis() > lastTimeCheck + timeIntervalFlag) {
      lastTimeCheck = millis ();
      if (frameCount>1) {
        loc.z= loc.z -3;

        fill(255, 0, 0);
        ellipse(loc.x, loc.y, 20, 25);
      }
    }
  }

  void moveBoxDown(ArrayList type, float maxdist, float maxheight) {
    int count =0;
    for (int i =0; i < type.size(); i++) {
      AgentQ other = (AgentQ)type.get(i);

      float distance = sqrt((sq(other.loc.x-loc.x)) + (sq(other.loc.y - loc.y)));
      float distancez = loc.z - other.loc.z;
      if (distance <maxdist/3 && distancez >maxheight && distance < maxheight*3) {
        loc.z = loc.z-maxheight;
      }

      //   if (loc.z >0) {
      //    if (distancez <0 || distance > maxdist/3 && distancez >0 && distancez < maxheight || distancez > maxheight) {
      //     count++;
      //    }
      //   }
      //    if ( count == type.size()-1) {
      //     loc.z = 0;
      //    println("done");
      //  }
    }
  }

  /*
  void moveBoxDown(ArrayList type) {
   int count =0;
   ArrayList tempOther = new ArrayList();
   for (int i =0; i < type.size(); i++) {
   AgentQ other = (AgentQ)type.get(i);
   
   float distance = sqrt((sq(other.loc.x-loc.x)) + (sq(other.loc.y - loc.y)));
   float distancez = other.loc.z - loc.z;
   if (distance >= 3) {
   count++;
   }
   if (distance < 3 && distancez > 1) {
   count++;
   }
   if (loc.z >0 && count == type.size()-1) {
   loc.z = loc.z -1;
   }
   }
   } 
   */

  void friction(float magn) {
    speed.scaleSelf(magn);
  }

  void seperate(ArrayList type, float magnitude, float maxdist) {
    Vec3D steer = new Vec3D();
    int count = 0;
    for (int i = 0; i < type.size(); i++) {
      AgentQ other = (AgentQ)type.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance >0 && distance < maxdist) {
        Vec3D diff = loc.sub(other.loc);
        diff.normalizeTo(1.0/distance);
        steer.addSelf(diff);
        count++;
      }
    }
    if (count >0) {
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);
    acc.addSelf(steer.x, steer.y, 0);
  }

  void seperateBB(ArrayList type, float magnitude, float maxdist) {
    Vec3D steer = new Vec3D();
    int count = 0;
    for (int i = 0; i < type.size(); i++) {
      BoundingBox other = (BoundingBox)type.get(i);
      float distance = loc.distanceTo(other.pos());
      if (distance >0 && distance < maxdist) {
        Vec3D diff = loc.sub(other.pos());
        diff.normalizeTo(1.0/(pow(distance, 2)));
        steer.addSelf(diff);
        count++;
      }
    }
    if (count >0) {
      steer.scaleSelf(pow(2.718, (-(pow((count+5), 2)/10000))));
    }
    steer.scaleSelf(magnitude);
    acc.addSelf(steer.x, steer.y, 0);
  }


  void cohesion(ArrayList type, float magnitude, float maxdist) {
    Vec3D steer = new Vec3D();
    int count = 0;
    for (int i = 0; i < type.size();i++) {
      AgentQ other = (AgentQ)type.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance > 0 && distance < maxdist) { 
        steer.addSelf(other.loc.x-loc.x, other.loc.y-loc.y, 0);
        count++;
      }
    }
    if (count > 0 ) {
      steer.scaleSelf(1.0/count);
    }

    steer.normalizeTo(1.0);
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }

  void seek(ArrayList type, float magnitude, float minSeekRange, float seekRange, float seekRangeAngle) {
    Vec3D steer = new Vec3D();
    //println(seekStop);
    Vec3D normaldirection = new Vec3D();
    float seekCount = random(0, 10000); 
    if (seekCount>75 && seekStop==0 ) {


      int count =0;
      for (int i = 0; i < type.size() ; i++) {
        AgentQ other = (AgentQ) type.get(i);
        float distance = loc.distanceTo(other.loc);
        if (distance > minSeekRange && distance < seekRange) {
          Vec3D vector = new Vec3D(   (other.loc.x-loc.x), (other.loc.y-loc.y), 0);
          Vec3D direction = new Vec3D(   (speed.x), (speed.y), 0);

          float lengthDirection = sqrt(direction.x*direction.x+direction.y*direction.y);
          float lengthVector = sqrt(vector.x*vector.x+vector.y*vector.y);

          float dotproduct = (direction.x*vector.x) + (direction.y*vector.y);
          float result = acos(dotproduct / (lengthVector*lengthDirection));
          if (result >= 0 && result < seekRangeAngle) {
            steer.addSelf(vector);
            count++;
          }
        }
      }
      if (count>0) {
        steer.scaleSelf(1.0/count);
      }
      steer.scaleSelf(magnitude);
      acc.addSelf(steer);
    }
    else {
      seekStop++;
      normaldirection.addSelf(-speed.y, speed.x, 0);
      normaldirection.scaleSelf(0.001);
      acc.addSelf(normaldirection);
    }
    if (seekCount>9925) {
      seekStop =0;
    }
  }


  void seekParent(ArrayList<BoundingBox> type, float magnitude, float minSeekRange, float seekRange, float seekRangeAngle) {
    Vec3D steer = new Vec3D();
    //println(seekStop);
    Vec3D normaldirection = new Vec3D();
    float seekCount = random(0, 10000); 
    if (seekCount>75 && seekStop==0 ) {

      int count =0;
      for (int i = 0; i < type.size() ; i++) {
        BoundingBox other = (BoundingBox) type.get(i);
        float distance = loc.distanceTo(other.pos());
        if (distance > minSeekRange && distance < seekRange) {
          Vec3D vector = new Vec3D(   (other.pos().x-loc.x), (other.pos().y-loc.y), 0);
          Vec3D direction = new Vec3D(   (speed.x), (speed.y), 0);

          float lengthDirection = sqrt(direction.x*direction.x+direction.y*direction.y);
          float lengthVector = sqrt(vector.x*vector.x+vector.y*vector.y);

          float dotproduct = (direction.x*vector.x) + (direction.y*vector.y);
          float result = acos(dotproduct / (lengthVector*lengthDirection));
          if (result >= 0 && result < seekRangeAngle) {
            steer.addSelf(vector);
            count++;
          }
        }
      }
      if (count>0) {
        steer.scaleSelf(1.0/count);
      }
      steer.scaleSelf(magnitude);
      acc.addSelf(steer);
    }
    else {
      seekStop++;
      normaldirection.addSelf(-speed.y, speed.x, 0);
      normaldirection.scaleSelf(0.001);
      acc.addSelf(normaldirection);
    }
    if (seekCount>9925) {
      seekStop =0;
    }
  }

  void borderParent(float magnitude, float maxdist) {
    Vec3D toParentLoc = parent.pos();
    Vec3D towards = new Vec3D();
    //line(toParentLoc.x, toParentLoc.y, loc.x, loc.y);
    float distance = toParentLoc.distanceTo(loc);

    if (distance > maxdist) {
      towards.scaleSelf(-1);
      towards = toParentLoc.sub(loc);
      towards.normalizeTo(magnitude);
      // speed = speed.scaleSelf(-1);
    }
    acc.addSelf(towards.x, towards.y, 0);
  }

  Vec3D Pos() {

    Vec3D Pos = new Vec3D(loc.x, loc.y, 0);
    return Pos;
  }

  void moveTo(Vec3D _loc) {
    loc = _loc;
  }

  void reverseSpeed() {
    speed.scaleSelf(-1);
  }

  void bounce(ArrayList type) {
    if (loc.x >
      width) {
      //   speed.x = speed.x  * -1;
      type.remove(this);
    }
    if (loc.x < 
      0) {
      //   speed.x  = speed.x  * -1;
      type.remove(this);
    }
    if (loc.y >
      height) {
      //    speed.y = speed.y * -1;
      type.remove(this);
    }
    if (loc.y < 
      0) {
      type.remove(this);
    }
  }

  void borders() {
    if (loc.x < 0) loc.x = width;
    if (loc.y < 0) loc.y = height;
    if (loc.x > width) loc.x = 0;
    if (loc.y > height) loc.y = 0;
  }

  void move() {
    speed.addSelf(acc);
    speed.limit(2);
    loc.addSelf(speed);
    acc.clear();
  }

  void lineBetween(ArrayList type, float maxdist) {
    int counter = 0;
    for (int i = 0; i < type.size();i++) {
      AgentQ other = (AgentQ) type.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance > 7 && distance < 10) {
        strokeWeight(0.1);
        stroke(0, 255, 0);
        line(loc.x, loc.y, other.loc.x, other.loc.y);
      }
    }
  }

  void display() {

    if (cha == "COM") {
      noFill();
      stroke(0, 255, 255);
      // ellipse(loc.x, loc.y, 1, 1);
      pushMatrix();
      translate(0, 0, loc.z);
      //  rect(loc.x-2.5, loc.y-2.5, 5.1, 5.1);
      popMatrix();
    }
    else if (cha == "GREEN") {
      //noFill();
      stroke(0, 255, 0);
      //   line(loc.x-2.5, loc.y-2.5, loc.z, loc.x+2.5, loc.y+2.5, loc.z);
      //   line(loc.x-2.5, loc.y+2.5, loc.z, loc.x+2.5, loc.y-2.5, loc.z);
    }
    else if (cha == "IND") {
      noFill();
      stroke(127, 0, 255);
      pushMatrix();
      translate(0, 0, loc.z);
      //    rect(loc.x-2.5, loc.y-2.5, 5.05, 5.05);
      popMatrix();
    }
    else if (cha == "PA") {
      noFill();
      stroke(0, 127, 255);
      pushMatrix();
      translate(0, 0, loc.z);
      //     rect(loc.x-2.4, loc.y-2.4, 4.95, 4.95);
      popMatrix();
    }
    else if (cha == "PED") {
      noFill();
      stroke(255, 0, 255);
      //    ellipse(loc.x, loc.y, 2.5, 2.5);
    }
    else if (cha == "PUB") {
      noFill();
      stroke(255, 191, 0);
      //    ellipse(loc.x, loc.y, 2.5, 2.5);
    }
    else if (cha == "RES") {
      noFill();
      stroke(0, 0, 255);

      pushMatrix();
      translate(0, 0, loc.z);
      //      rect(loc.x-2.5, loc.y-2.5, 5, 5);
      popMatrix();
    }
    else if (cha == "ROAD") {
      noFill();
      stroke(255, 0, 0);
      //   ellipse(loc.x, loc.y, 2.5, 2.5);
    }
    else if (cha == "room") {
      noFill();
      stroke(255, 0, 0);
      //   ellipse(loc.x, loc.y, 0.1, 0.1);
    }
  }


  void sunblock(ArrayList type) {
    int count =0;

    Vec3D newloc = loc.add(0, 6, 0);

    if ( cha == "RES") {
      if (loc.z >= 0 && loc.z < 5  ) {
        for (int i = 0; i < type.size();i++) {
          AgentQ other = (AgentQ)type.get(i);
          float diff = newloc.distanceTo(other.loc);

          if (
          loc.z > other.loc.z-1 && loc.z < other.loc.z+1 && 
            diff >0 && diff < 5) {
            count++;
          }
        }
        if ( count > 4) {
          stroke(255);
          loc.y = loc.y -0.5;
        }
      }
    }
  }
}


