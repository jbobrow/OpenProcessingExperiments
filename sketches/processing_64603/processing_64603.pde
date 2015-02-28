
ArrayList <Particle> particles = new ArrayList<Particle>();
ArrayList <Spring> springs = new ArrayList<Spring>();

void setup() {
  size(500,500);
  background(0);
  smooth();
}

void draw()  {
  background(0);
  
   for (Particle p: particles) {
    p.update();
    
    //noStroke();
    fill(255,150);
    stroke(100,23,56);
    ellipse(p.x,p.y,70,70);
  
 }   
 
  for (Particle a:particles) {
      for (Particle b:particles) {
       stroke(255);
       line(a.x, a.y, b.x, b.y);
      }
}


}

void keyPressed()  {
   Particle p = new Particle();
   p.addForce(random(-1,1), random(-1,1));
   p.set(random(70,width -35), random(70,height -35 ),0);
   particles.add(p);
   
   
}


