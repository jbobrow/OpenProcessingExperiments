
//Microphone required

import toxi.geom.*; 
import ddf.minim.*;
import ddf.minim.analysis.*;
import peasy.*;
import processing.opengl.*;

FFT fft;
Minim minim;
AudioInput audioIn;
//PeasyCam cam; 

//DECLARE
ArrayList ballCollection;

void  setup() {
  size(1200, 800/*, P3D*/);

  /*cam = new PeasyCam(this, 0, 0, 0, 150);
   cam.setMinimumDistance(1300);
   cam.setMaximumDistance(3000);
   cam.setYawRotationMode();*/

  smooth();

  //INITIALISE  
  ballCollection = new ArrayList();

  for (int i = 0; i < 13; i++) {

    Vec3D origin = new Vec3D(random(width), random(200), 0);
    Ball myBall = new Ball(origin);
    ballCollection.add(myBall);
  }
  minim = new Minim(this);
  audioIn = minim.getLineIn(Minim.STEREO, 512);
  fft = new FFT(audioIn.bufferSize(), audioIn.sampleRate());
  fft.forward(audioIn.mix);
}


void draw() {
  background(0);

  fft.forward(audioIn.mix);

//  for (int i = 0; i < fft.specSize(); i++)
//  {
//    line(i, height, i, height - fft.getBand(i)*height/4);
//    box(40, 20, 50);
//  }

  //CALL FUNCTIONALITY  

  for (int i = 0; i < ballCollection.size(); i++) {  
    Ball mb = (Ball) ballCollection.get(i);
    mb.run();
  }
}

class Ball {
  //GLOBAL VARIABLES 

  Vec3D loc = new Vec3D (0, 0, 0);
  Vec3D speed = new Vec3D (random(-2, 2), random(-2, 2), 0);//added every frame to loc vector
  Vec3D acc = new Vec3D();
  Vec3D grav = new Vec3D(0, 0.1, 0);
  
  Vec3D sound = new Vec3D();

  //float hearing;
  //float phearing;
  float masterGain = .78;
  float lineThick = 1.3;
  float ballDiam = 2;

  //CONSTRUCTOR
  Ball(Vec3D _loc) {

    loc = _loc;
  }

  //FUNCTIONS
  void run() {
    display();
    move();
    bounce();
    //gravity();
    lineBetween();
    flock();
    //soundx();
  }

  void soundx() {

    //hearing = (in.right.get(0)+in.left.get(0))*500;//500 = sensitivity

    //float sqrthearing = sqrt(hearing);
    //float phearing = pow(sqrthearing,2);

    //float phearing = norm(hearing, -5, 10);

    //println(hearing);
    
    //
  }


  void flock() {

    separate(5);//corresponds to magnitude
    cohesion(0.00000000001); //opposite to cohesion 
    align(0.1);
  }


  void align(float magnitude) {

    Vec3D steer = new Vec3D();//empty vector called steer
    int count = 0;// count starting at zero

    for (int i = 0; i < ballCollection.size(); i++) {//for loop to go through all the balls
      Ball other = (Ball) ballCollection.get(i);

      float distance = loc.distanceTo(other.loc);//distnace between one ball and another (sub)
      if (distance > 0 && distance < ballDiam*2) {

        steer.addSelf(other.speed);
        count++;
      }
    }

    //divides the collection of vectors into the number that've been counted
    if (count > 0) {
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }



  void cohesion(float magnitude) {

    Vec3D sum = new Vec3D();
    int count = 0;

    for (int i = 0; i < ballCollection.size(); i++) {
      Ball other = (Ball) ballCollection.get(i);

      float distance = loc.distanceTo(other.loc);
      if (distance > 0 && distance < ballDiam*7) {   

        sum.addSelf(other.loc);//average the position of many balls
        count++;//nothing to do with the count inside the separate function (below)
      }
    }

    if (count > 0) {

      sum.scaleSelf(1.0/count);//get the average position of where the nearby (defined by distance) balls are
    }

    Vec3D steer = sum.sub(loc);
    steer.scaleSelf(magnitude);

    acc.addSelf(steer);
  }

  void separate(float magnitude) {

    Vec3D steer = new Vec3D();
    int count = 0;

    for (int i = 0; i < ballCollection.size(); i++) {
      Ball other = (Ball) ballCollection.get(i);//

      float distance = loc.distanceTo(other.loc);//others refers to above other and access any variables of that class
      if (distance > 0 && distance < ballDiam*1.5) {

        Vec3D diff = loc.sub(other.loc);//line between one ball and another (sub)
        diff.normalizeTo(1.0/distance);//controls vector strength based on distance - without it, less smooth
        steer.addSelf(diff);//add diff to steer (each frame)
        count++;//add one unit to the count; (if the if statement is met)
      }
    }

    if (count > 0) {
      steer.scaleSelf(1.0/count);
    }

    steer.scaleSelf(magnitude);//allows for tuning
    acc.addSelf(steer);
  }

  void lineBetween() {

    //below will get information from  ballCollection:

    println(audioIn.mix.level()*315*masterGain);

    for (int i = 0; i < ballCollection.size(); i++) {
      Ball other = (Ball) ballCollection.get(i);
      float distance = loc.distanceTo(other.loc);//others refers to above other and access any variables of that class

      //if (distance > 0 && distance < 300+(audioIn.mix.level()*1900*masterGain)/*hearing*/) {

      if (distance > 0 && distance < 300*(audioIn.mix.level()*13*masterGain + 1)) {

        //(100*(audioIn.mix.level()*26*masterGain + 1))
        //float ndistance = norm(distance, distance, distance);  

        //stroke(255, distance*masterGain);
        //stroke(255, (distance*(audioIn.mix.level()*1600*masterGain)));
        stroke(255, ((distance/1.2)*(audioIn.mix.level()*1600*masterGain)));

        //stroke(255, ((distance/1.2)*(100*(audioIn.mix.level()*26*masterGain + 1))));

        //stroke(255, 255, 255, (ndistance*100));
        //strokeWeight(1.2);
        strokeWeight(lineThick * (audioIn.mix.level()*6.5*masterGain + 1) );
        line(loc.x, loc.y, other.loc.x, other.loc.y);
      }
    }
  }

  void display() {
    noStroke();//stroke(0);
    fill(lineThick * (audioIn.mix.level()*6.5*masterGain + 1));
    ellipse(loc.x, loc.y, ballDiam, ballDiam);
  }


  void move() {

    speed.addSelf(acc); //every frame will add to itself the vector of acc
      speed.limit(1.6);//limits max velocity
    loc.addSelf(speed);
    acc.clear();
  }

  void bounce() {
    if (loc.x > width) {
      speed.x = speed.x*-1;
    }
    if (loc.x < 0) {
      speed.x = speed.x*-1;
    }
    if (loc.y > height) {
      speed.y = speed.y*-1;
    }
    if (loc.y < 0) {
      speed.y = speed.y*-1;
    }
  }


  void gravity() {
    speed.addSelf(grav);
  }
}


