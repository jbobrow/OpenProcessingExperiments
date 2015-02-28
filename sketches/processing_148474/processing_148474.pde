
loat ay;
float by;
PVector location;
PVector velocity;

void setup(){
  size(500,250);
  location=new PVector(50, 100);
  velocity=new PVector(2,2);
  smooth();
}
void draw(){
  ay=mouseY;
  by=mouseY;
  background(100);
  location.add(velocity);
  noStroke();
  fill(255);
  rect(10,location.y-12,5,25);
  noStroke();
  fill(255);
  rect(470,by,5,25);
  fill(0);
  rect(location.x,location.y,3,3);
  if((location.x>465&&location.y<468&&location.y>by&&location.y<by+14)||(location.x<22&&location.y>24&&location.y<ay+14))
  {
    velocity.x=velocity.x*-(1 + 0,1);
    velocity.y=velocity.y*-(1 + 0,1);
  }
  if(location.y>height-5||location.y<5){
    velocity.y=velocity.y*-1;
  }
}
