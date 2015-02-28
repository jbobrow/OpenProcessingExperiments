

PVector loc, vel, acc;


void setup(){
  size(600,200);
  loc = new PVector(0,100);
  vel = new PVector(0,0);
  acc = new PVector(2,0);
  frameRate(2);
  noStroke();
  //background(100);
}





void draw(){
  fill(100,10);
  rect(0,0,width,height);
  
  vel.add(acc);
  loc.add(vel);
  
  fill(255);
  ellipse(loc.x, loc.y, 50,50);
  
  println("vel: "+vel);
  
  if(loc.x > width) setup();
}

