
// Declare Mover object
Mover [] mover=new Mover[100];
int n=5;
void setup()
{
  size(400,400);
  smooth();
  background(0);
  noStroke();
  // Make Mover object
  for(int i=0;i<n;i++)
  mover[i] = new Mover(); 
}
void mousePressed()
{
  if(n<=100){
  mover[n]=new Mover();
  n++;}
}

void draw() 
{
 
 //fill(0,10); //if you unmark these comments then the balls have some shady effect 
//rect(0,0,width,height);
background(255); 
  // Call functions on Mover object.
  for(int i=0;i<n;i++){
  mover[i].update();
  mover[i].checkEdges();
  mover[i].changetored();
  mover[i].display(); 
  }
}


class Mover {

  // Our object has two PVectors: location and velocity
PVector location;
PVector velocity;
PVector acceleration;//not used in this case
PVector direction;
float topspeed;
float radi;
color colour;

  Mover() {
    location = new PVector(random(width/4,3*width/4),random(height/4,3*height/4));
    velocity = new PVector(random(3,4),random(3,4));
    acceleration = new PVector(-0.1,0.1);
    direction=new PVector(1,1);
    topspeed=10;
    radi=random(20,40);
    colour=color(random(255),random(255),random(255));
  }

  void update() {
    // Motion 101: Locations changes by velocity.
    //acceleration=new PVector(random(-1,1),random(-1,1));
    //acceleration.normalize();
    //acceleration.mult(random(2));
    //velocity.add(acceleration);
    //velocity.limit(topspeed);
    velocity.mult(direction);
    location.add(velocity);
  }

  void display() {
    ellipse(location.x,location.y,radi,radi);
  }

  void checkEdges() {

    if (location.x > height-radi||location.x<radi) 
      direction.x=-direction.x;
    
    if (location.y > height-radi||location.y<radi) 
      direction.y=-direction.y;
    

  }
void changetored()
{
  if((location.x>width-4*radi)&&direction.x==-1.0||(location.x<4*radi)&&direction.x==-1.0||(location.y>height-4*radi)&&direction.y==-1.0||(location.y<4*radi)&&direction.y==-1.0)
fill(255,0,0);
else
fill(colour);

}
}

