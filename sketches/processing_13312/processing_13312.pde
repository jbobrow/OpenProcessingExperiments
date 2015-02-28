
//import fullscreen.*;
//FullScreen fs;

ParticleSystem boxes, bullets, effectps, explps;

int points;

float hh, hw, hz;

void setup() {
  size(640, 480, P3D);
  frameRate(60);
  //fs = new FullScreen(this); 
  //fs.enter();

  effectps = new ParticleSystem();
  explps = new ParticleSystem();
  boxes = new ParticleSystem();
  bullets = new ParticleSystem();
  
  hh = height/2.0;
  hw = width/2.0;
  hz = (hh) / tan(PI*60.0 / 360.0);
  
  //buildMatrix();
}

void draw() {
  background(0);
  lights();

  noStroke();
  fill(255, 255, 255);

  boxes.run();
  bullets.run();
  effectps.run();
  explps.run();
  //translate((width / 2)-80, height / 2);
  //box(40);
  
  bulletCollisions();

  camera(mouseX, mouseY, hz,
         mouseX, mouseY, 0,
         0, 1, 0);
      
  if (timer()) {
    boxes.addParticle(hw + random(-hw,hw), hh + random(-hh,hh));    
    //buildMatrix();
  }
  
  //drawPoints();
}


void drawPoints() {
  String txt = "Point: " + points;
  fill(0);
  rect(5,5, 50, 50);
  stroke(255);
    fill(25);
  text(txt, 10, 10);  
}

void buildMatrix() {
  int spacing_x = 20;
  int spacing_y = spacing_x;
  int cols = ceil(hw / spacing_x);
  int rows = ceil(hh / spacing_y);
  float box_r = 20;
  
  for (int i = 0; i < rows; i++) {
    float y = i * (box_r + spacing_x);       
    for (int j = 0; j < cols; j++) {      
      float x = j * (box_r + spacing_y);      
      boxes.addParticle(x,y);
    }
  }
}

int nextTimeout = 0;
boolean timer() {
  if (millis() > nextTimeout) {
    nextTimeout = millis() + 50;
    return true;
  }
  else {
    return false;
  }
}

void mousePressed() {
  PVector l =  new PVector(mouseX, mouseY+30, 350);
  PVector v =  new PVector(0,0,-10);
  bullets.addParticle(l, v);  
}  


void bulletCollisions() {
  for (int i = 0; i < bullets.particles.size(); i++) {   
      Particle b = (Particle) bullets.particles.get(i);         
      for (int j = 0; j < boxes.particles.size(); j++) {
        Particle p = (Particle) boxes.particles.get(j);   
      
        if (b.loc.dist(p.loc) < 20) {
          p.timer = 0;
          b.timer = 0;
          effectps.addParticles(30, p.loc.get());
          
          points += 1;
          
          // shockwave          
          for (int k = 0; k < boxes.particles.size(); k++) {
            Particle bo = (Particle) boxes.particles.get(k);   
            float dst = p.loc.dist(bo.loc);
            //println(dst);
            if (dst < 150) {
              //float a = PVector.angleBetween(new PVector(bo.loc.x, bo.loc.y), new PVector(p.loc.x,p.loc.y));              
              /*
              float a = PVector.angleBetween(bo.loc, p.loc);              
              float x = cos(TWO_PI/a) * (4 - 4*dst/150);
              println(a);
              float y = sin(TWO_PI/a) * (4 - 4*dst/150);
              */
              PVector v_between = PVector.sub(bo.loc, p.loc);
              v_between.normalize();
              float forcemult = 2;
              v_between.mult(forcemult);
              //print(forcemult + ", ");
              bo.vel.add(v_between);  
            }
          }
          
          // explotion          
          
          Expl expl = new Expl(p.loc.get());
          explps.addParticle(expl);          
          
          break;
        }
      }      
  }
}


