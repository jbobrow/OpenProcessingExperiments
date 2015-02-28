


class bat {
  //------------------------------------GLOBAL VARIABLES
  Vec3D loc = new Vec3D(0, 0, 0);
  Vec3D speed = new Vec3D(0, 0, 0);
  Vec3D acc = new Vec3D(0, 0, 0);
  float Size = 10;
  float rad = 0;
  float luma = 0;
  float luMax = 125;
  float maxSize = 30;
  float speedLimit = 2;






  //-----------------------------------------CONSTRUCTOR
  bat(Vec3D _loc) {
    loc = _loc;
  }


  //-------------------------------------------FUNCTIONS
  //-------------------------------------------------RUN
  void run() {

    display();
    //photophobia();
    flock();
    move();
    mcfly();
    resize();
  }
  //----------------------------------------------RESIZE 
  void resize() {
    //Get the colour for the actual position
    int pixelX = (int)(loc.x);
    int pixelY = (int)(loc.y);
    color pixelC = get(pixelX, pixelY);
    
    //Calculate luma factor for the actual position
    luma = (0.3 * red(pixelC) + 0.59 * green(pixelC) + 0.11 * blue(pixelC))*multi;
    //If luma is high but bellow the limit, grow.
    if (luma >= luMax && rad < maxSize-3) {
      rad=rad+2;
    }
    //If luma is too low, shrink
    if (luma < luMax && rad > 4) {
      rad=rad-4;
    }
    //Be sure to exist
    if (rad <= 0) {
      rad = 3;
    }
  }



    //-----------------------------------------------MCFLY 
    void mcfly() {
      //Every time a cell reaches the border, gets to the other side
       
       if (loc.x > width) {
       loc.x = 0;
       }
       if (loc.x < 0) {
       loc.x = width;
       }
       if (loc.y > height) {
       loc.y = 0;
       }
       if (loc.y < 0) {
       loc.y = height;
       }
       }
       
      //Every time a cell reaches the border, bounces
/*
      if (loc.x > width) {
        speed.x = speed.x*(-1);
        acc.x = acc.x*(-1);
      }
      if (loc.x < 0) {
        speed.x = speed.x*(-1);
        acc.x = acc.x*(-1);
      }
      if (loc.y > height) {
        speed.y = speed.y*(-1);
        acc.y = acc.y*(-1);
      }
      if (loc.y < 0) {
        speed.y = speed.y*(-1);
        acc.y = acc.y*(-1);
      }
      
      
    } 
*/


    //-----------------------------------------------FLOCK  
    void flock() {
      separate(100);
      cohesion(0.001);
      align(0.1);
    }

    //-----------------------------------------align
    void align(float magnitude) {

      Vec3D steer = new Vec3D();
      int count = 0;

      for (int i = 0; i < batCollection.size();i++) {
        bat other = (bat) batCollection.get(i);

        float distance = loc.distanceTo(other.loc);

        if (distance > 0 && distance < rad*1.5) {

          steer.addSelf(other.speed);
          count++;
        }
      }

      if (count > 0) {
        steer.scaleSelf(1.0/count);
      }

      steer.scaleSelf(magnitude);

      acc.addSelf(steer);
    }


    //-----------------------------------------cohesion
    void cohesion(float magnitude) {

      Vec3D sum = new Vec3D();
      int count = 0;

      for (int i = 0; i < batCollection.size();i++) {
        bat other = (bat) batCollection.get(i);

        float distance = loc.distanceTo(other.loc);

        if (distance > 0 && distance < rad*3) {

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
    //-----------------------------------------separate
    void separate(float magnitude) {

      Vec3D steer = new Vec3D();
      int count = 0;

      for (int i = 0; i < batCollection.size();i++) {
        bat other = (bat) batCollection.get(i);

        float distance = loc.distanceTo(other.loc);

        if (distance > 0 && distance < rad*1) {

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



    //------------------------------------------------MOVE
    void move() {

      //Get the colour for the actual position
      int pixelX = byte(loc.x);
      int pixelY = byte(loc.y);
      color pixelC = get(pixelX, pixelY);
      //Calculate luma factor for the actual position
      luma = (0.3 * red(pixelC) + 0.59 * green(pixelC) + 0.11 * blue(pixelC))*multi;

      //If luma is too high, accelerate
      if (luma > luMax) {
        acc.x = acc.x*1.5;
        acc.y = acc.y*1.5;
      }

      //If luma is too low, slow
      if (luma < luMax*.1) {
        acc.x = acc.x*0.5;
        acc.y = acc.y*0.5;
      }
      //Move by adding the acceleration to the speed vector and then that to the position
      speed.addSelf(acc);

      speed.limit(speedLimit);

      loc.addSelf(speed);

      acc.clear();
    }


    //---------------------------------------------DISPLAY
    void display() {
      noFill();
      //strokeWeight(2);
      //Get the colour for the actual position
      // first convert the float vector coordinates to integers
      int pixelX = (int)loc.x;
      int pixelY = (int)loc.y;
      color pixelC = get(pixelX, pixelY);
      //Set the colour to use in the shape as a proportion of the radius defined
      stroke(rad*255/maxSize, 0, 0);
      translate(0,0,5*rad);
      ellipse(loc.x, loc.y, rad, rad);
      translate(0,0,-5*rad);
    }
        
  }


