
int walk=0; // parameter where the man starts
int x=0; // x variable parameter
int stepl = 0; // first step parameter left leg
int stepr = 0; // second step parameter right leg

void setup(){
  size(500,500); // size of window
  frameRate(100); // speed that he is walking
  smooth(); // the smoothness of the walking
  noFill(); // no fill in the walkman
  strokeWeight(5); // how thick the lines are
}

void draw( ){
  background(95,253,247); // background color blue
  stroke(255,0,0); // color of the line red
  line(20, 50, 550, 50); // line
  stroke(0); // thickness of the line
  ellipse(100+x, 150, 30, 30); // head circle
  ellipse(105+x, 155,1, 1); // eye circle
  line(110+x, 145,100+x,145); // lip line
  line(100+x, 100, 100+x, 130); // torso line
  line(100+x, 125, 140+x, 130); // right arm
  line(100+x, 125, 120+x, 90);  // left arm
   if(walk == 0){
    stepl = stepl + 2; // first step call
  } else {
    stepr = stepr + 2; // second step call
  }
  line(100+x, 100, 90+stepl, 50); // left leg
  line(100+x, 100, 110+stepr, 50); // right leg
  if(abs(stepl-stepr)>= 15){
    walk = 1-walk; // walking call
  }
  x=x+1; // allows body to move with legs
}

