


ParticleSystem ps;    //define a ParticleSystem
Ship ship;          //define ship 
float angle;        //define angle of ship


void setup(){
  size(600,400);
  smooth();
  
  ship = new Ship();
// generate a ParticleSystem with ship location vector
    ps = new ParticleSystem(ship.location);
}

// draw the ship and emitting particles
void draw(){
  background(0);
                    
  ship.update();                
  ship.display();
  
// apply ship acceleration  
  ps.applyForce(ship.acceleration);
//  translate(ship.location.x,ship.location.y);
//  ps.locate(ship);

  ps.run(ship);
  ps.addParticle();
  
}

// press space bar to acceleration and direction with 'LEFT' and 'RIGHT'
void keyPressed(){
  if(key == CODED){                
    if(keyCode == LEFT){                      //pressed LEFT ARROW
      ship.angle += -PI/18;                   //rotate 10 dgree cclockwise
    } else if(keyCode == RIGHT){              //pressed RIGHT ARROW
      ship.angle += +PI/18;                   //rotate 10 dgree clockwise
    }
  } else if (key == ' '){                      //pressed spacebar  
      ship.accelerate();                       //accelerate ship
//    println(ship.velocity);
  }
}
class Particle{
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;      // define lifespan of a particle
  
  Random generator;    // random generator for directrion of emit particles

  
  float mass = 1;
  
  PImage img = loadImage("texture.png");
  
// construct a particle with location vector
  Particle(PVector l){

  generator = new Random();

// make random figure for direction of emit particles  
  float vx = (float) generator.nextGaussian()*0.2;
  float vy = (float) generator.nextGaussian()*0.2;


    acceleration = new PVector(0,0);

    velocity = new PVector(vx,vy);
    location = l.get();
// numbercount of lifespan
    lifespan = 255.0;
  }
// display  
  void run(){
    update();
    render();
  }
// apply force to a particle  
  void applyForce(PVector force){
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
// update the movement of a particle  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 2.0;
  }

// use image for particle  
  void render(){
    imageMode(CENTER);
    tint(255,lifespan);
    image(img,location.x,location.y);
  }


  void display(){
    stroke(255,lifespan);
    fill(255,lifespan);
    ellipse(location.x,location.y,8,8);
  }
  
// check life of a particle
  boolean isDead(){
    if(lifespan <0.0){
      return true;
    } else{
      return false;
    }
  }
}

// ParticleSystem for emitting behind spaceship

class ParticleSystem{

// define ArrayList  
  ArrayList<Particle> particles;
// define origin point
  PVector origin;
  
// constructor with location vector
  ParticleSystem(PVector location){
// extract the location of vector    
    origin = location.get();
// initialise particles    
    particles = new ArrayList<Particle>();
  }

// add particle members  
  void addParticle(){
    particles.add(new Particle(origin));
  }

// apply force to whole particles  
  void applyForce(PVector f){
    for (Particle p: particles){
      p.applyForce(f);
    }
  }

// trace the location of ship     
  void locate(Ship sh){
    origin = sh.location.get();
  }
  
  void run(Ship sh){
    locate(sh);
    
// repeat making and removing particles    
    Iterator it = particles.iterator();
    while(it.hasNext()){
      Particle p = (Particle) it.next();
      p.run();
      if (p.isDead()){
        it.remove();
      }
    }
  }
}


class Ship{

  PVector location;              //location of ship
  PVector velocity;              //velocity of ship  
  PVector acceleration;          //acceleration of ship
  float angle;                   //angle of ship
  
  Ship(){
    angle = PI;                                  //default angle
    location = new PVector(width/2,height/2);   //default location (center)
    velocity = new PVector(-1,0);                //default velocity 0
    acceleration = new PVector(0,0);            //default acceleration 0
    
    
  }
  
  void update(){
    
// locate with velocity    
    location.add(velocity);                      //locate ship
// return to opposite left and right    
    if (location.x <0){
      location.x=width;
    } else if (location.x > width){               //skip to opposite side 
      location.x=0;
    }
// return to opposite up an down    
    if (location.y < 0){
      location.y = height;
    } else if (location.y > height){               //skip to bottom down
      location.y = 0;
    }    
  }


// acceleration with angular force  
  void accelerate(){
    velocity.add(new PVector(0.2*cos(angle),0.2*sin(angle)));   //acceleration
  }
  
  void display(){
    noStroke();
    fill(200);
    rectMode(CENTER);
//    translate(location.x,location.y);                //display location
//    rotate(angle);                                   //display angle
 //   ellipse(location.x,location.y,20,30);    
    beginShape();                                    // 

//    vertex(30,0);                                    //
//    vertex(-30,15);                                  //   shape of ship
//    vertex(-30,-15);                                 //

//    vertex(location.x+30,location.y);                                    //
//    vertex(location.x-30,location.y+15);                                  //   shape of ship
//    vertex(location.x-30,location.y-15); 


//    moving and rotating with polar data.

// front point
    vertex(location.x+cos(angle)*30,location.y+sin(angle)*30);                                    //
// back points
    vertex(location.x+cos(angle+PI*2/3)*15,location.y+sin(angle+PI*2/3)*15);                                  //   shape of ship
    vertex(location.x+cos(angle+PI*4/3)*15,location.y+sin(angle+PI*4/3)*15);                                 //
    endShape();                                      //
  }
}


