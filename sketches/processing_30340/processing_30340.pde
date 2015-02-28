
PImage[] hana;
int[] hana_sizes  = {100, 50, 40, 30, 30, 30, 20, 10 };
List<Particle> particles;

void setup() {
  size(720,480);
  frameRate(30);
  imageMode(CENTER);  
  hana = new PImage[4];
  for (int i=0; i<4; i++) {
    hana[i] = loadImage( "hana"+i+".png");
  }
  particles = new LinkedList<Particle>();
}

void draw() {
  background(255);
  if ( particles.size() < 600 ) {
    particles.add(new Particle(new PVector( random(0,width),height+100)));
  }
  for (int i = 0; i < particles.size();) {
    Particle particle = particles.get(i);
    particle.draw();
    particle.update();
    if (particle.isDead())
      particles.remove(i);
    else
      i++;
  }
}

class Particle {
  private PVector location;
  private PVector velocity;
  private color hana_color;
  private float angle;
  private float hana_size;
  private int id;

  Particle(PVector _location) {
    id = int(random(0,hana.length-1));
    angle = 0;
    location = _location;
    hana_size = hana_sizes[int(random(0,hana_sizes.length-1))];
    velocity = new PVector(0, random(-10,-2));
  }
  
  public void update() {
    location.add(velocity);
    angle -= 0.06;
  }

  public void draw() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    image(hana[id],0,0,hana_size,hana_size);
    popMatrix();
  }
  
  public boolean isDead() {
      return (location.y<-100);
  }
}

                
