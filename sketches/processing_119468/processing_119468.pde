
PShape fish;
PShape turtle;
PShape snail; 

void setup() {
  size(600, 600);
  fish = loadShape("fish.svg");
  turtle = loadShape("turtle.svg");
  snail = loadShape ("snail.svg");
}

void draw() {
  
  //water 
  noStroke();
  fill(88, 255, 234); 
  rect(0, 0, width, 200);

  //grass 
  noStroke(); 
  fill(160, 222, 87);
  rect(0, 200, width, 200);

  //lower grass 
  noStroke();
  fill(106, 191, 62);
  rect(0, 400, width, 200);
  
  //fish map = seconds 
  float fishMap = map(second(),0,59,0,width); 
  //rect(fishMap,50,50,50);// need to have shape(fish) move, not rect
  shape(fish,fishMap,0);
  
  //turtle map = minutes 
  float turtleMap = map(minute(),0,59,0,width);
  shape(turtle,turtleMap,200);
  
  //snail map = hours
  float snailMap = map(hour(),0,59,0,width); 
  shape(snail,snailMap,400);
  
}
