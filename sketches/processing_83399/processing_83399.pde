

//Flock flock;
int maxNumbers = 47; 
boids [] numbers;
int l =100;
boolean pause;

void setup () { 
  size(1000, 600);
  stroke(255);
  smooth();
  frameRate(20);
  numbers= new boids [l];
  //flock=new Flock();
  //for (int i = 0; i < l; i++) {
  //flock.addBoid(new boids(0, 0));}


for (int i = 0; i <l;i=i+1) {
  float tempRadius = random(0);
  PVector tempLocation = new PVector ( random (1000), random (600));
  PVector tempVelocity = new PVector ( random(-1, 5), random(-1, 5));
  //numbers.addboids(new boids(width/2,height/2));

  numbers[i]=new boids (tempRadius, tempLocation, tempVelocity);
  numbers[i].showBoid();
}
}


void draw () {
  fill (#2BD6A1, 50);
  rect (0, 0, width, height);
  for (int i = 0; i <l;i=i+1) 
  {
    numbers[i].moveBoid();
    numbers[i].showBoid();
  }
  testDistance();
}

/*// Add a new boid into the System
 void mouseClicked() {
 flock.addBoid(new oids(mouseX, mouseY));
 }*/


void testDistance() {
  for (int i=0;i<numbers.length; i=i+1) {
    boids   boid1 = numbers[i];

    for (int j=i+1;j<numbers.length; j=j+1) {
      boids   boid2 = numbers[j];
      float distance=PVector.dist (boid1.location, boid2.location ); 
      if (distance<2)
      {
        //boid1.color.set(0,0,#816110);
        boid1.velocity.set(6, 6, 6);
        //boid1.velocity.x-= velocity.x;
        boid2.velocity.set(0, 0, 0); //freeze all
        boid1.radius=boid2.radius*2; //grow and shrunk
        boid2.radius=boid2.radius/2;



     //saveFrame("line-#####.png");
      }
      /*if (distance==width)
       {
       boid2.velocity.set(0, 0, 0); 
       //boid1.radius=0; 
       
       
       }*/
    }
  }
}
//rechtsklick=pause
void mousePressed() {
 if (mouseButton == RIGHT) {
 if (pause) {
 loop();
 pause = false;
 }
 else {
 noLoop();
 pause = true;
 }
 }
 }

class boids {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float radius;
  color farbe;


  boids ( float _radius, PVector _location, PVector _velocity)
  { 
    acceleration = new PVector(0, 0);
    velocity = new PVector(random(-1, 5), random(-1, 5));
    location = new PVector(random(width), random(height));
    radius =random(5, 6);
    farbe= color (#722A81, 95);
  }
/*  void run(ArrayList<Boid> boids) {
    flock(boids);
  }*/
  void showBoid() {
    fill (farbe);
    ellipse ( location.x, location.y, radius*4, radius*4);
  }
  void moveBoid() {
    location.add(velocity);

    if (location.y>height) {
      velocity.y = -velocity.y;
    }
    if (location.y<0) {
      velocity.y = -velocity.y;
    }
    if (location.x>width+radius) {
      location.x -= width + radius*2;
    }
    if (location.x<-radius) {
      location.x =width + radius*2;
    }
  }

  /*void moveBoid() {
   location.add(velocity);
   if (location.x< -radius)
   location.x = width + radius*2;
   else if (location.x > width + radius)
   location.x -= width + radius*2;
   if (location.y < -radius)
   location.y += height + radius*2;
   else if (location.y > height + radius)
   location.y -= height + radius*2;
   }*/
}



