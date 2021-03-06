
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
    vel = new PVector(random(0,0),random(0,0),0);
    loc = l.get();
    r = 10.0;
    timer = 255.0;
    font = loadFont("Helvetica-48.vlw");
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
 smooth();
    pushMatrix();
    textFont(font);
    textSize(14);
    fill(0,50,100,timer);
    translate(loc.x, loc.y-5);
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


