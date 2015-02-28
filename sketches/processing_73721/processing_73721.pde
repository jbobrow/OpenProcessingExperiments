

class Ball {

  float tx, ty, nx, ny, rad, b, nox, noy, mouseNoisyX, mouseNoisyY, vx, vy, globalAngle;
  Ball[] others;
  int id = 0;


  //translate x, translate y, noise x, noise y, offset x, noy, radius
  Ball(float mytx, float myty, float mynox, float mynoy, float myrad, int myid, Ball[] myothers) {

    tx = mytx;
    ty = myty;
    rad = myrad;
    nox = mynox;
    noy = mynoy;
    b=0; //b is the offset multiplier of the noise - so "noise(b)" and is fed a value in 'display' (maybe not the best place?)
    others = myothers;
    id = myid;
  }

  void noisinator(float x, float y) {//this multiplies the amount of noise being applied

    //this part takes the distance from the mouse and makes it more noisy
    float distance = constrain((dist(mouseX, mouseY, tx, ty)), 1, 100);
    float mapDistance = map(distance, 1, 100, 150, 1);
    float mouseAmount = dist(mouseX, mouseY, pmouseX, pmouseY)/10;


    mouseNoisyX += mapDistance*mouseAmount/2;
    mouseNoisyY += mapDistance*mouseAmount/2;

    nx=x+mouseNoisyX;
    ny=y+mouseNoisyY;

    if (mouseNoisyX>0) {
      mouseNoisyX-=10;
      mouseNoisyY-=10;
    }
    if (mouseNoisyX<0) {
      mouseNoisyX=0;
      mouseNoisyY=0;
    }
  }


  void display(float myb) {

    float ntx = (noise(b+nox)-.5); //ntx - noise translate x - sets the value of the perlin noise + predefined offset - an overall offset
    float nty = (noise(b+noy)-.5);
    b+=myb; // myb determines the speed of the noise

    //   for (int i=0;i<5;i++) {
    //    noStroke();
    //    fill(255*q, 0, 0);
    pushMatrix();
    translate(tx+(nx*ntx), ty+(ny*nty));
    rotate ((dist(tx+(nx*ntx), ty+(ny*nty), 0, 0))/10);
   // ellipse(0,0,rad);
    thing(0, 0, rad, noise(id));
    popMatrix();
    // (q);
    //    q-=.2;
    //   }
  }

  void collide() {
    for (int i = id +1; i < numBalls; i++) {

      //defiing dx and dy for the first time, (distance x and y)
      // in this case (confusing) .x and .y is the others x subtract this x and y
      float dx = others[i].tx - tx;
      float dy = others[i].ty - ty;

      //this is a slightly more efficient way of doing "dist"
      float distance = sqrt(dx*dx + dy*dy);

      //the minimum distance is this diameter *s the others diameter
      float minDist = others[i].rad/2 + rad/2;

      if (distance < minDist) { 

        //ok... must get to understand a tan better - I guess this makes an angle from
        //two spots on the grid
        float angle = atan2(dy, dx);
        globalAngle = angle;

        //defining new float target x goes in the right direction
        float targetX = tx + cos(angle) * minDist;
        float targetY = ty + sin(angle) * minDist;

        //defining new float ax and ay as ... *.1 is the damping amount
        float ax = (targetX - others[i].tx)*.1;
        float ay = (targetY - others[i].ty)*.1;


        vx -= ax;
        vy -= ay;


        others[i].vx += ax;
        others[i].vy += ay;

        //  vx = 0;
        // vy = 0;
      }
    }
  }

  void move() {
    tx+=vx;
    ty+=vy;
    vx*=.9;
    vy*=.9;
    if (tx>width||tx<0) {
      tx=0;
    }
    if (ty>height||ty<0) {
      ty=0;
    }
  }
}



