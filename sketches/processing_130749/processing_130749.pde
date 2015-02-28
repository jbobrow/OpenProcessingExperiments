
PVector location = new PVector(10,5);
PVector velocity = new PVector(1,2);
PVector acceleration= new PVector(.1,-.05);
int maximumspeed=2;
void setup(){
size(400,400);
background(230);
}
void draw(){
  fill(230,5);
  rect(0,0,width,height);
  fill(255);
  if(location.y>height){
    velocity.y=-abs(velocity.y);
    newacceleration();
  }
  if(location.x>width){
    velocity.x=-abs(velocity.x);
    newacceleration();
  }
   if(location.y<0){
    velocity.y=abs(velocity.y);
    newacceleration();
  }
  if(location.x<0){
    velocity.x=abs(velocity.x);
    newacceleration();
  }
  //acceleration.y=
   
  velocity.add(acceleration);
  location.add(velocity);
  velocity.limit(maximumspeed);
  rect(location.x,location.y,10,10);
}
void newacceleration(){
 acceleration= new PVector(random(-.2,.2),random(-.2,.2));
 }
 void keyPressed(){
if (key == 'a'){
   maximumspeed++;
 }
 if (key == 's'){
   if(maximumspeed>2){
   maximumspeed--;}
   else{
     maximumspeed/=2;}
 }
 }



