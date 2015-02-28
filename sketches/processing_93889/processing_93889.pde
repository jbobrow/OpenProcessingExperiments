
//time falling away
//written by james Frankis

int s;
int m;
int h;
float random1;
float random2;
float random3;
float random4;

int counterS;
int counterS2;
int deathcounter;

int line_height = 100;

float movement;

float map_s;
float map_m;
float map_h;

float aa;
float bb;

PFont font;


 
ParticleSystem ps;

void setup(){

  size (500, 500);
  background(255);
    ps = new ParticleSystem(0, new PVector(width/2,height/2,0));
  smooth();
  movement = 1000/60.0;
  random1 = random(1,10);
random2 = random(70,100);
random3 = random(40,50);
random4 = random(100,150);

}

void draw(){

  frameRate(60);

  s = second();



  font = loadFont("Baskerville-48.vlw");

  background(255);
  stroke(0);

 line(width/2 + 10, line_height+10, width, line_height+10);
 noFill();
beginShape();
vertex(width/2 + 10, line_height+10);
vertex(width/2 + 10 +random1, line_height+random2);
vertex(width/2 + 10 +random1+random2, line_height+random2+random4);
vertex(width/2 +  10+ random1+random2+random4, line_height+random2+random4+random3);
vertex(width/2 + 10+random1+random2+random4+random3, line_height+random2+random4+random3+random4);
vertex(width/2 + 10+random1+random2+random4+random3+random1, line_height+random2+random4+random3+random4+random2);
endShape();

  textFont(font);

  textSize(14);
//  fill(0, 10, 255, 100);
//  rect(width/2, 0, 18, height);
  fill(0);
//  text(s, width/2+movement-12, line_height+10);


  noStroke();

  fill(0);
  textSize(14);
  

  
//seconds//////////////////////////////////////////////////////

  for (float i = movement+5; i < width; i+=movement ) {
    s+=1;
    if (s==61){
      s=1;
    }
    text(s, width/2+i, line_height+10);
  }



    //countersecs///////////////////////////////////////
  if ((s & 1) == 0) {
counterS ++;

} else {
counterS2 ++;
}

if(counterS > frameRate - 3) {


    counterS = 0;
    counterS2 = 0;
  deathcounter ++;
ps.addParticle(width/2+movement-12, line_height+10);
  }
  
  if(counterS2 > frameRate - 3){
    
 
    counterS2 = 0;
    counterS = 0;
deathcounter ++;
ps.addParticle(width/2+movement-12, line_height+10);
  }
  
  
text("Seconds thrown to their death:", 20, 20); 
text(deathcounter, 220, 20);
 ps.run();

   
}




// time falling away particle

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float timer;
  int s;
  PFont font;
  float spin;
  float spin1;

  Particle(PVector l) {
    acc = new PVector(0,0.05,0);
    vel = new PVector(random(-2,-1),random(-2,-1),0);
    loc = l.get();
    r = 10.0;
    timer = 255.0;
    font = loadFont("Baskerville-48.vlw");
    s = second();
    spin1 = random(-0.05,0.05);
  }

  void run() {
    update();
    render();
    
  }


  void update() {
    vel.add(acc);
    loc.add(vel);
    timer -=1.5;
    
    

    spin += spin1;
    
  }


  void render() {

    pushMatrix();
    textFont(font);
    textSize(14);
    fill(0,timer);
    translate(loc.x, loc.y);
       rotate(spin);
 
    text(s+1,0,0);
    
  popMatrix();

  }
  

  boolean dead() {
    if (timer <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
  


}

//time falling away particle system

class ParticleSystem {

  ArrayList particles;    
  PVector origin;       

  ParticleSystem(int num, PVector v) {
    particles = new ArrayList();            
    origin = v.get();                       
    for (int i = 0; i < num; i++) {
      particles.add(new Particle(origin));   
    }
  }

  void run() {
  
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = (Particle) particles.get(i);
      p.run();
      if (p.dead()) {
        particles.remove(i);
      }
    }
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }
  
    void addParticle(float x, float y) {
    particles.add(new Particle(new PVector(x,y)));
  }

  void addParticle(Particle p) {
    particles.add(p);
  }


  boolean dead() {
    if (particles.isEmpty()) {
      return true;
    } else {
      return false;
    }
  }

}



