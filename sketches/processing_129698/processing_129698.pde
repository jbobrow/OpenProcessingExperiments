
ArrayList particles;
float t;



void setup() {

  t=0;
  frameRate(30);
  size(500, 700);
  background(255);
  smooth();
  particles = new ArrayList();
  particles.add(new particle(width/2, height/2, 1));
}


public class particle {
  ArrayList children;
  int generation;
  PVector loc;
  PVector trueloc;

  public particle( float x, float y, int gen) {
    loc = new PVector(x, y);
    trueloc = new PVector(x, y);
    generation = gen;
    children = new ArrayList();
  }

  public particle( float x, float y, float xx, float yy, int gen) {
    loc = new PVector(x, y);
    trueloc = new PVector(xx, yy);
    generation = gen;
    children = new ArrayList();
  }

  public void update() {
    pushMatrix();
    translate(loc.x, loc.y);

    if (children.size()>0) {
      for (int i = 0; i< children.size();i++) {      
        particle child = (particle)children.get(i);
        rotate(t/(100)-children.size());
        child.update();

        stroke(255); 
        line(0, 0, child.loc.x, child.loc.y);
      }
    } 

    fill(255);
    stroke(0);
    ellipse(0, 0, 60/generation, 60/generation);

    popMatrix();
  }

  public void spawngeneration() {
    if (children.size()<30) {
      for (int i = 0; i<6; i++) {
        float xpl = 100*cos(2*PI*i/6)/generation;
        float ypl = 100*sin(2*PI*i/6)/generation;
        particle p = new particle(xpl, ypl, loc.x +xpl, loc.y+ ypl, generation+1);
        children.add(p);
        particles.add(p);
      }
    }
  }
}

void draw() {

  background(0);
  for (int i = 0; i< particles.size(); i++) {
    particle a=(particle)particles.get(i);
    fill(0);
  //  rect(0, 0, width, height*.2);
   // rect(0, height-height/6, width, height);
    quad(0,height/3,0,0,width/2,0,width/2,height/6);
    a.update();
    fill(255);
    rect(0, 0, width, height/8);
    rect(0, height-height/8, width, height);
  }
  t=t+1;
}

void mouseClicked() {
  particle p=(particle)particles.get(0);
  float xx =mouseX;
  float yy = mouseY;
  PVector loct = p.loc.get();
  ArrayList children = p.children;

  for (int i = 0 ;i <  particles.size(); i++) {
    particle a=(particle)particles.get(i);
    loct = a.trueloc.get();
    PVector mouseloc= new PVector(loct.x-xx, loct.y-yy);
    if (mouseloc.mag() < 60/a.generation ) {
      a.spawngeneration();
    }
  }

  if (mouseY<height/8 || mouseY>7*height/8) {
     p=(particle)particles.get(floor(random(particles.size())));
    p.spawngeneration();
  }
} 


void mouseDragged() {
  if (mouseY>height/8 && mouseY<7*height/8) {
    particle p=(particle)particles.get(0);
    p.loc.x=mouseX;
    p.loc.y=mouseY;
  }
}

