
float radius = 50;
int xspacing = 16;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = (radius *10)-8;  // Height of wave
float period = 1000.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

  
int count =0;
PVector v1 = new PVector(width/2, height/2);
boolean overCircle = false;
float px, py, px1, py1, px2, py2 = 0;
float angle = 0;
float angle2 = 120; 
float angle3 = 240;

float frequency = .6;
float alp =35;
float circle =0;
float circle_ =0;
float circle__ =0;
boolean yup = false;
boolean outline = false;
 
ParticleSystem ps;

// used to create font
PFont myFont;

void setup(){
  smooth(8);
  strokeWeight(4);
  size(800, 620, OPENGL);
  background (127);
  // generate processing font from system font
  myFont = createFont("verdana", 12);
  textFont(myFont);
    ps = new ParticleSystem(new PVector(width/2,height/2));
    // v1 = new PVector(700, 600,0);
      w = width+16;
  
  yvalues = new float[2*w/xspacing];
}

void draw(){
  dx = (TWO_PI /+(sin(radians(mouseX)))/4  * xspacing);
   
  background (230,210,alp);
  //noStroke();
  fill(0, 0, 0);
  if(!yup){
    alp ++;
  }
  if(alp ==255){
  yup= true;
 
  }
  if(alp ==130){
  yup= false;
  }
  if(yup){
    alp --;
      
  }
  if(circle>= radius*10){
   circle= 0; 
   
  }
  if(circle<= radius*5 && !yup){
  outline = false;
  }
  if(yup){
    noFill();
   ellipse(width/2, height/2, radius*10, radius*10);
  }
  
 
  ellipse(width/2, height/2, -500*(sin(radians(circle)))+alp, -500*sin(radians(circle))+alp);
 if(circle <= 40){
   //circle_ = 0;
 
 //if( circle_ >= 400 ){
        fill(0,alp,alp, alp);
    ellipse(width/2, height/2, pow(circle,3), pow(circle,3));
      fill(0,0,alp, alp);
  ellipse(width/2, height/2, pow(circle,2), pow(circle,2));
  outline =true;
  
 }
   fill(0, 0, 0);
   ellipse(width/2, height/2, radius*10, radius*10);
   if((circle_+(1/circle_)) >= 500){
    circle_ = 0; 
   }
   if(sqrt(circle__)*circle >= 500){
    circle__ = 0; 
   }
   stroke(255,255,255,alp-30);
    ellipse(width/2,height/2,sqrt(circle__)*circle,sqrt(circle__)*circle);
   fill(alp-random(40,75),alp+random(20,50),alp+random(0,80), alp-50);
  // ellipse(width/2,height/2, circle_+circle_+8,circle_+circle_+8);
   ellipse(width/2,height/2, circle_+(1/circle_),circle_+(1/circle_));

  
   //println(circle);
  // rotates rectangle around circle
  px = width/2 + cos(radians(angle))*(radius*5);
  py = height/2 + sin(radians(angle))*(radius*5);
  px1 = width/2 + cos(radians(angle2))*(radius*5);
  py1= height/2 + sin(radians(angle2))*(radius*5);
  px2 = width/2 + cos(radians(angle3))*(radius*5);
  py2 = height/2 + sin(radians(angle3))*(radius*5);
  ellipseMode(CENTER);
  rectMode(CENTER);
  fill(0, 0, 0);
  //draw rectangle
  //rect (px, py, 5, 5);
  stroke(10);




  stroke(200);

 

  // send small ellipse along sine curve
  // to illustrate relationship of circle to wave
  //noStroke();
  //ellipse(width/8+radius+x, py, 5, 5);

  angle -= frequency;
  angle2 -= frequency;
  angle3 -= frequency;
  circle += frequency;
   circle_ += frequency;
   circle__ +=frequency;
  stroke(255,255,255,alp);
    drawArrow( px, py, px, py, angle);
    drawArrow( px1, py1, px1, py1, angle2);
    drawArrow( px2, py2, px2, py2, angle3);


//controls number of particles
  if(count % 13 == 0){
    ps.addParticle();

  
   }
  ps.run();

count++;

 calcWave();
  renderWave();

}
 


void drawArrow(float cx, float cy, float dx, float dy, float angle){
  float len = sqrt(pow((dx-cx), 2)+pow((dy-cy), 2))-3;
  pushMatrix();
  translate(cx, cy);
  rotate(radians(angle-90));
  line(0,0,len, 0);
  line(len, 0, len - 8, -8);
  line(len, 0, len - 8, 8);
  popMatrix();
  
  Iterator<Particle> it = ps.particles.iterator();
  while (it.hasNext()) {
    Particle p = it.next();
    //println(PVector.dist(p.location,v1));
    PVector v1 = new PVector(width/2, height/2);

    //println(v1);
    if (PVector.dist(p.location,v1)>=(abs(-500*(sin(radians(circle)))))/2){
       //it.remove();
       PVector neg = new PVector(-1, -1);
       p.velocity = PVector.mult(p.velocity,neg);
    }
    //if(
  }
}









// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {
  public ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void run() {
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove(); 
      }
    }
  }
}



// A simple Particle class

class Particle {
  public PVector location;
  public PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1),random(-2,6));
    location = l.get();
   
    lifespan = 255.0;
  }

  void run() {
    update();

    
       //println(location);
    display();
    
  }

  // Method to update location
  void update() {
     
   
   
    
   
 velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1.0;
   
    
    
    
  

    
  }

  // Method to display
  void display() {
    stroke(255,lifespan);
    fill(255,lifespan);
    ellipse(location.x,location.y,8,8);
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}



boolean overCircle(int x, int y, float diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  //println(sqrt(sq(disX) + sq(disY)) );
  if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.0002*(circle+(35));

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*(-500*(sin(radians(alp)))+alp);
    x+=dx;
  }
}

void renderWave() {
  noStroke();
  if(outline){
  fill(random(0,255),random(0,255),random(0,255), alp);
  for (int x = 0; x < yvalues.length; x++) {
    
    ellipse(x*.5*xspacing, height/2+.5*yvalues[x], 16, 16+(alp/20));
  }
  }
  fill(0,0,0,alp);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    
    ellipse(x*.5*xspacing, height/2+.5*yvalues[x], 16, 16+(alp/20));
    
  
    

  }
}


