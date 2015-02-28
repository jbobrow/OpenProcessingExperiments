
float a;
float b;
PVector location;
PVector velocity;

void setup(){
  size(600,600);
  location=new PVector(20,20);
  velocity=new PVector(1,random(.1,2));
  smooth();
}
void draw(){
  a=mouseY;
  b=mouseY;
  background(87,34,162);
  location.add(velocity);
  rect(0,a,20,100);
  rect(480,b,20,100);
  ellipse(location.x,location.y,50,50);
  if((location.x>475&&location.y>b&&location.y<b+100)

  ){
    velocity.x=velocity.x*-1;
    velocity.y=velocity.y*-1;
  }
  if(location.y>height-5||location.y<5){
    velocity.y=velocity.y*-1;
  }
}

