
/*
 Interactive metaballs by Tim Ganly 2010
 Based on tutorial at:
 http://www.gamedev.net/reference/programming/features/isometa2d/
 
 Controls:
 
 - Use number keys 1 to 4 to change the display.
 - Click and hold the mouse button amongst the blobs to make them scatter.
*/

final int NUM_BALLS = 6;
PVector[] mbPos = new PVector[NUM_BALLS];
PVector[] mbVel = new PVector[NUM_BALLS];
float[] mbRadius = new float[NUM_BALLS];
float sum = 0.0;
final float FRICTION = 0.999;
final float MOUSE_REPEL = 60;
final float MAX_VEL = 5;
final float COHESION_WEIGHT = 0.05;
final float THRESH_1 = 5; 
final float THRESH_2 = 5.5;
final float THRESH_3 = 6;
final float THRESH_4 = 7;
PVector u = new PVector();
PVector m = new PVector();
PVector c = new PVector();
PVector repel = new PVector();
float mDistance;
PVector centre = new PVector(0,0);

void setup() {
  colorMode(HSB,360,100,100);
  size(400, 400, P2D);
  for(int i=0; i< NUM_BALLS; i++) {
    mbPos[i] = new PVector(random(0,width),random(0,height));
    mbVel[i] = new PVector(random(-1,1),random(-1,1));
    mbRadius[i] = random(90,140);
  }
  frameRate(24);
}

void draw() {
  //println(frameRate);
  centre.set(0,0,0);
  //update meta ball positions
  for(int i=0;i<NUM_BALLS;i++) {
    //mouse?
    if(mousePressed) {
      m.set(mouseX,mouseY,0);
      mDistance = PVector.dist(mbPos[i],m);
      repel = PVector.sub(mbPos[i],m);
      repel.normalize();
      repel.mult(MOUSE_REPEL/(mDistance*mDistance));
      mbVel[i].add(repel);
    }

    centre.add(mbPos[i]);

    mbVel[i].mult(FRICTION);

    mbVel[i].limit(MAX_VEL);
  }

  centre.div(NUM_BALLS);

  for(int i=0;i<NUM_BALLS;i++) {

    //tendancy to go to centre
    c = PVector.sub(centre,mbPos[i]);
    c.normalize();
    c.mult(COHESION_WEIGHT);
    mbVel[i].add(c);

    mbPos[i].add(mbVel[i]);

    //bounce
    if(mbPos[i].x > width) {
      mbPos[i].x = width;
      mbVel[i].x *= -1.0;
    }
    if(mbPos[i].x < 0) {
      mbPos[i].x = 0;
      mbVel[i].x *= -1.0;
    }
    if(mbPos[i].y > height) {
      mbPos[i].y = height;
      mbVel[i].y *= -1.0;
    }
    if(mbPos[i].y < 0) {
      mbPos[i].y = 0;
      mbVel[i].y *= -1.0;
    }
  }
  //draw stuff
  background(0);
  for(int i=0; i<width; i++) {
    for(int j=0; j<height; j++) {
      sum = 0; 
      for(int m=0; m<NUM_BALLS; m++) {
        sum += mbRadius[m] / sqrt(sq(i-mbPos[m].x) + sq(j-mbPos[m].y));
      }
      switch(key) {
      case '4':
        //Irish flag
        if(sum >= THRESH_1 && sum <= THRESH_2) {
          set(i,j,color(155,100,62)); //Green
        }
        else if(sum > THRESH_2 && sum <= THRESH_3) {
          set(i,j,color(0,0,100)); //White
        }
        else if( sum > THRESH_3 && sum <= THRESH_4) {
          set(i,j,color(30,100,96)); //Gold
        }
        break;
      case '3':
        //Psychadelic
        set(i,j,color(sum*sum*sum/2,100,255));
        break;
      case '2':
        //White
        set(i,j,color(0,0,sum*sum*sum/2));
        break;
      case '1':
      default : 
        //Red      
        set(i,j,color(360,100,(sum*sum*sum)/3));
        break;
      }
    }
  }
}


