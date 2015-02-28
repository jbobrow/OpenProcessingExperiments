
PVector location = new PVector(10,5);
PVector velocity = new PVector(1,2);
PVector acceleration= new PVector(.1,.1);
void setup(){
size(200,200);
background(230);
}
void draw(){
  fill(255,5);
  rect(0,0,width,height);
  fill(255);
  if(location.y>height){
    velocity.y=-velocity.y;
    newacceleration();
  }
  if(location.x>width){
    velocity.x=-velocity.x;
    newacceleration();
  }
   if(location.y<0){
    velocity.y=-velocity.y;
    newacceleration();
  }
  if(location.x<0){
    velocity.x=-velocity.x;
    newacceleration();
  }
  velocity.add(acceleration);
  location.add(velocity);
  velocity.limit(6);
  rect(location.x,location.y,10,10);
  
}
void newacceleration(){
 acceleration= new PVector(random(-.2,.2),random(-.2,.2));}

