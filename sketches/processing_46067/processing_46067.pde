


class Ball {
  //---------------------------------------GLOBAL VARIABLES 
  Vec3D loc = new Vec3D (0, 0, 0);
  Vec3D speed = new Vec3D (random(-.5, .5), random(-.5, .5), 0);

  Vec3D acc = new Vec3D();

  Vec3D grav = new Vec3D(0, 0.2, 0);
  
  float r = (0);
  float g = (0);
  float b = (0);

  //----------------------------------------CONSTRUCTOR
  Ball(Vec3D _loc) {

    loc = _loc;
  }


  //-----------------------------------------FUNCTIONS/METHODS

  void run() {
    display();
    move();
    bounce();
    //gravity();

    lineBetween();

    flock();
  }

  void flock() {

    separate(40);
    cohesion(0.009);
    align(0.2);
  }




  void align(float magnitude) {


    Vec3D steer = new Vec3D();
    int count = 0;


    for (int i=0; i < ballCollection.size(); i++) {
      Ball other = (Ball) ballCollection.get(i);

      float distance = loc.distanceTo(other.loc);

      if (distance > 0 && distance < 100) {
        
        steer.addSelf(other.speed);
        count++;
        
      }
        
        
      }
      
      if(count >0) {
        
        steer.scaleSelf(1.0/count);
      }
      
      steer.scaleSelf(magnitude);
      
      acc.addSelf(steer);

  }

      void cohesion(float magnitude) {

        Vec3D sum = new Vec3D();
        int count = 0;

        for (int i=0; i < ballCollection.size(); i++) {
          Ball other = (Ball) ballCollection.get(i);

          float distance = loc.distanceTo(other.loc);

          if (distance > 0 && distance < 60) {

            sum.addSelf(other.loc);
            count++;
          }
        }

        if (count > 0) {
          sum.scaleSelf(1.0/count);
        }

        Vec3D steer = sum.sub(loc);
        steer.scaleSelf(magnitude);

        acc.addSelf(steer);
      }



      void separate(float magnitude) {

        Vec3D steer = new Vec3D();
        int count = 0;


        for (int i=0; i < ballCollection.size(); i++) {
          Ball other = (Ball) ballCollection.get(i);

          float distance = loc.distanceTo(other.loc);

          if (distance > 0 && distance < 60) {

            Vec3D diff = loc.sub(other.loc);
            diff.normalizeTo(1.0/distance);

            steer.addSelf(diff);
            count++;
          }
        }

        if (count > 0) {
          steer.scaleSelf(1.0/count);
        }

        steer.scaleSelf(magnitude);
        acc.addSelf(steer);
      }






      void lineBetween() {

          for (int i=0; i < ballCollection.size(); i++) {

          Ball other = (Ball) ballCollection.get(i);

          float distance =loc.distanceTo(other.loc);

          if (distance > 0 && distance < 50) {

            stroke(r,g,b,30);
            strokeWeight(0.5);
            line(loc.x, loc.y, other.loc.x, other.loc.y);
          }
        }
      }

      void gravity() {

        speed.addSelf(grav);
      }


      void bounce() {
        if (loc.x > width) {
          speed.x = speed.x * -1;
        }
        if (loc.x < 0) {
          speed.x = speed.x * -1;
        }
        if (loc.y < width) {
          speed.y = speed.y * -1;
        }
        if (loc.y > 0) {
          speed.y = speed.y * -1;
        }
      }


      void move() {

        speed.addSelf(acc);

        speed.limit(1.5);  //control speed of agents here.

        loc.addSelf(speed);

        acc.clear();
      }


      void display() {
        fill(255,255,255,2);
        rect(loc.x, loc.y, 50, 50);
      }
    }


