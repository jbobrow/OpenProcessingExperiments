
//float is a datatype for floating point numbers; it creates a value and reference
float separation_range = 20;
float separation_strength = 0.02;

float cohesion_range = 100;
float cohesion_strength = 0.01;

float alignment_range = 200;
float alignment_strength = 0.5;

float friction = 0.97;

int lifespan = 1000; //controls the lifespan of dot

class Dot{ //class

  PVector position;//vector object, like a arrow in space
  PVector velocity;//gives velocity into PVector
  PVector acceleration;
  
  color col;
  
  int age;
  int lifespan;

  Dot(PVector _position){ //constructor
    //constructor as the same name as the class
    //constructor creates the new object
    //constructor takes input paramaters - info for the new object

    position = _position;
    velocity = new PVector(random(-5,1),random(-5,1));//movement
    acceleration = new PVector(0,0);//acceleration = 0;
    col = color(random(255),random(255),random(255));
    age = 0;
    lifespan = int(random(1000));
  }
  
void run(){//master function;control board
  
steerToMouse();
separation();
cohesion();
alignment();
bounce();
move();
render();
age++;
if (age == lifespan) Dots.remove(this); // when age becomes equal to lifespan remove dots

}

  void render(){
    fill(col);
    noStroke();
    ellipse(position.x,position.y,9,9);//size of dots
    ellipse(position.x,position.y,(lifespan-age)*0.03,(lifespan-age)*0.03);
  }

  void move(){
    velocity.mult(friction);
    velocity.add(acceleration);// update the velocity
    position.add(velocity);//update the position
    acceleration.mult(0);//set the acceration to 0
  }

  void steerToMouse(){
    PVector mouseVector = new PVector(mouseX,mouseY); // new pvector based on mouse
    PVector toMouse = PVector.sub(mouseVector,position);//subtract name position from dot
    toMouse.normalize(); //scale it to 1.0
    toMouse.mult(0.05); //scale the vector down
    acceleration.add(toMouse); // add toMouse to the accelaration
  }

void separation(){
  
  PVector separationForce = new PVector();//force of separation
  
  for (int d=0; d<Dots.size();d++){
    Dot otherDot = (Dot) Dots.get(d);//get a dot from the bucket
    //how far is this dot from me?
    float distance = PVector.dist(position,otherDot.position);
    if (distance < separation_range){ //if it's in my field of vision
    //make a repelling force
    separationForce = PVector.sub(position,otherDot.position);
    separationForce.normalize();//scale the force to 1.0
    separationForce.mult(separation_strength); //multiply the force by
    }
    acceleration.add(separationForce); //add separation to accelaration
  }
}

void cohesion(){
  
  PVector cohesionForce = new PVector();//force of cohesion
  PVector averagePos = new PVector(); // average position of all neighbours
  
  int averageCount = 0;
  
  for (int d=0; d<Dots.size();d++){
    Dot otherDot = (Dot) Dots.get(d);//get a dot from the bucket
    //how far is this dot from me?
    float distance = PVector.dist(position,otherDot.position);
    if (distance < cohesion_range){ //if it's in my field of vision
      averagePos.add(otherDot.position);
      averageCount++;
    }
  }
  averagePos.div(averageCount); //divide by number of neighbours
  
  cohesionForce = PVector.sub(averagePos,position); //head towards the average position
  cohesionForce.normalize(); //scale down to 1
  cohesionForce.mult(cohesion_strength);//scale it by strength factor
  acceleration.add(cohesionForce);
}

void alignment(){
  
  PVector alignmentForce = new PVector();//force of alignment
  PVector averageVel = new PVector(); // average position of all neighbours
  
  int averageCount = 0;
  
  for (int d=0; d<Dots.size();d++){
    Dot otherDot = (Dot) Dots.get(d);//get a dot from the bucket
    //how far is this dot from me?
    float distance = PVector.dist(position,otherDot.position);
    if (distance < alignment_range){ //if it's in my field of vision
      averageVel.add(otherDot.velocity);
      averageCount++;//adds to value
    }
  }
  averageVel.div(averageCount); //divide by number of neighbours
  averageVel.normalize(); //scale down to 1
  averageVel.mult(alignment_strength);//scale it by strength factor
  acceleration.add(alignmentForce);//add to acceleration
}

  void bounce(){

    /*if(this is this){
     do this
     }
     */

    if(position.x > width){// if position y is less than 0
      velocity.x = velocity.x*-1;//flip the velocity around minus one
    }

    if(position.x < 0){
      velocity.x = velocity.x*-1;
    }
    if(position.y < 0){// if position y is less than 0
      velocity.y = velocity.y*-1;//flip the velocity around minus one
    }
    if(position.y > height){
      velocity.y = velocity.y*-1;
    }
  }
}




