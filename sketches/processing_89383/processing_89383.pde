
color[][] sandcl;
PVector[][] sandpos;
PVector origin;
ArrayList particles = new ArrayList();
int numParticles = 3200;
int z = 0; 

void setup()
{
  size(400, 400);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);  
  sandcl = new color[width][height/2];
  sandpos = new PVector[width][height/2]; 
}

void draw()
{
  background(1, 0, 100);
  drawsand();
}
    
void drawsand(){  
    
  //write SAND
  textAlign(CENTER);
  fill(1, 100, 100, 1);
  PFont font = loadFont("Standard0757-8.vlw");
  textFont(font, 60); 
  text("SAND" , width/2, 50);
  //Getting the color of pixels
  //if not the text, it would be -1
  for(int i=0; i<width; i++) {
    for(int j = 0; j<height/2; j++) {
       sandcl[i][j] = get(i,j);
       if(sandcl[i][j] != -1){
            if(z < numParticles){
            sandpos[i][j] = new PVector(i,j,0);  
            origin = new PVector(sandpos[i][j].x, width/2+sandpos[i][j].y, 0);//SAND loc
            PVector a = new PVector();
            PVector v = new PVector();        
            //random location
            PVector l = new PVector(random(width), random(height),0);
            particles.add(new Particle(a,v,l, origin, random(0.05f, 2.0f)));//adding one random sand
            z++;
            }            
      }
    }
  }
  
  for (int h = 0; h<particles.size()-1; h++){
      Particle prt = (Particle) particles.get(h);
      //draw random sands
      prt.run(); 
     //if mouse is released, gradually return to random sands
      prt.add_force(PVector.mult(prt.getVelocity(),-0.05));               
      //press mouse, create word SAND     
      if(mousePressed) {
          PVector difr = PVector.sub(prt.getOrigin(),prt.getLocation());//position difference. SAND loc - random loc
          difr.normalize();  
          difr.mult(0.9); 
          prt.setAcceleration(difr); //random loc + vel + difr
       }
       
  }
}









class Particle {
  PVector or;
  PVector loc;
  PVector vel;
  PVector acc;
  float ms;

  Particle(PVector a, PVector v, PVector l, PVector o, float ms_) {
    acc = a;
    vel = v;
    loc = l;
    ms = ms_;
    or = o;
  }

  void run() {
    update();
    render();
  }

  void update() {
    vel.add(acc);//for making SAND
    loc.add(vel);
    acc = new PVector();
  }
 
  void render() {
    //stroke(1, 100, 0);
    point(loc.x,loc.y);

  }
 
 //for returning to random sand
 void add_force(PVector force) { 
    force.div(ms);
    vel.add(force);
  }  
 
  //random loc
  PVector getLocation() {
    return loc;
  }
  
  //SAND loc
  PVector getOrigin() {
    return or;
  }
  
  PVector getVelocity() {
    return vel;
  }
  
  //for making SAND
  void setAcceleration(PVector a){
    acc = a;
  }
}




