
class Men {

 Vec3D loc = new Vec3D(0, 0, 0);
 Vec3D speed = new Vec3D(random(-2, 2), random(-2, 2), 0);
 Vec3D acc = new Vec3D();
 float magnitude;
 float minDist1 = 50;/////////////////////////!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 float minDist2 = 20;
 float ignore1 = 20;//////////////////////////!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 float ignore2 = 20;
 


  Men(Vec3D _loc) {
    loc=_loc;
  }


  void run() {///////////////////////////////////////////////
    bounce();
    //showDirection();
    move();
    display();
    bounceFW();    
    flock();
  }

 
  void bounce() {//////////////////////////////////////////
 
    if ((loc.x>width-10)||(loc.x<10)) {
      speed.x=speed.x*-1;
    }
    if ((loc.y>height-10)||(loc.y<10)) {
      speed.y= speed.y*-1;
    }
  }
  
  void bounceFW() {
    for (int i=0;i<W;i++) {
      Tree = (Trees)TreesList.get(i);
      float distance = loc.distanceTo(Tree.Vobst);      //distance
////////////////////////group 1
      if (Tree.groupp==1){
        if (distance<=minDist1){
        speed.addSelf((((Tree.Vobst).sub(Man.loc)).  sub  ((((Tree.Vobst).sub(Man.loc)).normalize()).scale(minDist1))).scale(1/ignore1));////new vector
        }
      }
////////////////////////group 2
      if (Tree.groupp==2){
        if (distance<=minDist2){
        speed.addSelf((((Tree.Vobst).sub(Man.loc)).  sub  ((((Tree.Vobst).sub(Man.loc)).normalize()).scale(minDist1))).scale(1/ignore2));////new vector
        }
      }
      
    }
   
  }
 
  
  void display() {////////////////////////////////////////

    strokeWeight(2);
    stroke(#fae10d);
    point(loc.x, loc.y);
  }


  void showDirection() {///////////////////////////////////

    Vec3D nextLoc= new Vec3D(speed.scale(8).add(loc));
    strokeWeight(1);
    stroke(0, 230, 255);
    line(loc.x, loc.y, nextLoc.x, nextLoc.y);
  }

  void move() {////////////////////////////////////////////
    speed.addSelf(acc);
    speed.limit(4);
    loc.addSelf(speed);
    acc.clear();
  }


  void flock() {/////////////////////////////////////////
    align(0.1);
    cohesion(0.001);
    separate(5);
  }

  void align (float magnitude) {/////////////////////////
    Vec3D steer = new Vec3D();
    int count = 0;

    for (int i = 0; i<MenList.size();i++) {
      Men other = (Men) MenList.get(i);

      float distance = loc.distanceTo(other.loc);
      if (distance >0 && distance<40) {
        steer.addSelf(other.speed);
        count++;
      }
    }
    if (count>0) {
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }

  void cohesion(float magnitude) {/////////////////////
    Vec3D sum = new Vec3D();
    int count = 0;

    for (int i = 0; i<MenList.size();i++) {
      Men other = (Men) MenList.get(i);

      float distance = loc.distanceTo(other.loc);
      if (distance >0 && distance<60) {
        sum.addSelf(other.loc);
        count++;
      }
    }
    if (count>0) {
      sum.scaleSelf(1.0/count);
    }
    if (sum.magnitude()>0) {
      Vec3D steer = sum.sub(loc);
      steer.scaleSelf(magnitude);
      acc.addSelf(steer);
    }
  }

  void separate(float magnitude) {///////////////////

    Vec3D steer = new Vec3D();
    int count = 0;

    for (int i = 0; i<MenList.size();i++) {
      Men other = (Men)MenList.get(i);

      float distance = loc.distanceTo(other.loc);
      if (distance> 0 && distance < 30) {

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
    acc.addSelf(steer);
  }
}

