
// Trying to implement something like this:
// http://10k.aneventapart.com/Uploads/83/#
// using and extending Daniel Shiffman's basic prticle system
// from the default Processing examples

system ps;
int counter = -50;

void setup() {
  size(640, 360);
  noCursor();
  colorMode(RGB, 255, 255, 255, 100);
  ps = new system();
  smooth();
}

void draw() {
  //fill(0,0,0,10);
  //rect(0,0,width,height);
  
  background(0);
  
  ps.run();
  if(counter%15 == 0){
    ps.addParticle(random(0,width),-10);
    ps.addParticle(650,random(0,height));
  }
  if(counter%300 == 0){
    ps.addFood(random(0,width),-10);
    ps.addFood(650,random(0,height));
  }
  ps.addTail(mouseX,mouseY);
  counter++;
}



