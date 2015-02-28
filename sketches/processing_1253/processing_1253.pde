
int num=5; // number of robots
robot[] robots = new robot[num]; //robots array holds each robot


void setup() {
  ellipseMode(CENTER);
  colorMode(HSB,255);
  strokeWeight(2);
  size(750,600,P3D);
  rectMode(CORNERS);

  for(int i=0; i<num;i++){
    robots[i]=new robot();
  }


}

void draw() {
  background(255);
  translate(width/2,height/2,-500);

  rotateX(-0.2*PI);
  rotateY(mouseX*1.0/width*TWO_PI+PI);

  for(int i=0; i<num;i++){
    robots[i].move();
  }

}


class robot {
  float xloc;
  float zloc;
  float angle;

  float legheight;
  float bodyheight;
  float bodywidth;
  float headsize;

  float legwave; //where in position legs/head are
  float legspeed; // freq in hz for how fast legs shuffle

  float turnspeed; //rotation in hz for robot's heading
  float shade; // color of robot

  robot() {
    angle=(random(100)/100)*TWO_PI;
    xloc=random(800)-400;
    zloc=random(800)-400;
    legheight=70;
    bodyheight=100;
    bodywidth=90;
    headsize=80;
    legspeed=random(200)/100+0.2;
    turnspeed=random(50)/100-.25;
    shade=random(255);

  }

  void move() {

    legwave=waveinc(legwave,legspeed);
    angle=waveinc(angle,turnspeed);


    fill(shade,100,200);
    pushMatrix();

    //locate and turn grid for this specific robot
    translate(xloc,0,zloc);
    rotateY(angle);
    
    
// build the robot out of two legs
    pushMatrix();
    translate(-20,-legheight/2,bodywidth/2.2*sin(legwave));
    box(15,legheight,15);
    popMatrix();

    pushMatrix();
    translate(20,-legheight/2,bodywidth/2.2*sin(legwave+PI));
    box(15,legheight,15);
    popMatrix();

//one body piece
    pushMatrix();
    translate(0,-legheight-bodyheight/2,0);
    box(bodywidth,bodyheight,bodywidth);
    //  line(0,0,100,0,0,0);
    popMatrix();
    
    //a head
    pushMatrix();
    rotateY(0.15*PI*sin(legwave+PI));
    translate(0,-legheight-bodyheight-headsize/2-5,0);
    box(headsize,headsize,headsize/1.5);
    translate(0,0,headsize/3+10);
    fill(255);
    //two circles for eyes
    ellipse(-headsize/3,0,headsize/3,headsize/3);
    ellipse(headsize/3,0,headsize/3,headsize/3);
    popMatrix();   


    popMatrix();
    
    //change out x and z locations on the grid based on angle and speed of leg motion
    xloc=xloc+3*legspeed*sin(angle);
    zloc=zloc+3*legspeed*cos(angle);

  }


}

void mousePressed(){
  setup(); 
}


// wave in increments a variable based on specified freq
float waveinc(float wave, float freq) {
  if (wave+hz(freq)>2*PI) { //if the new wave will be over 2PI ...
    return((wave+hz(freq)-2*PI)); //then roll it over 
  } 
  else {
    return(wave+hz(freq)); //otherwise just add the increment to wave
  }
}

// hz() returns an increment value that will make variable go from 0-1 for given frequency, frame rate independent

float hz(float x) { //take in our desired freq as X
  return((2*PI*x)/frameRate); //2PI is one complete cycle, so multiply by freq and divide by frame
}




