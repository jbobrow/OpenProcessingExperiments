
//Depths 
//Ale GonzÃ¡lez, 2013
//A drawing generator created to show how to implement an efficient perlin noise vector field using lookup tables

final int 
  WIDTH   = 800,
  HEIGHT  = 800,
  MAX_AGE = 100,
  STEPS = 900,
  FILL = #000000,
  STROKE = #FFFFFF,
  ALFA = 50,
  BACKGROUND = #EEEEEE;

final float 
  SMOOTHNESS = .0005;

PVector[] DIRECTIONS;
int[][] INDICES;
ArrayList<Particle> particles;

PGraphics bg;

void setup() 
{
    size(800, 800);
    fill(FILL, ALFA);
    stroke(STROKE, ALFA);
    
    
    //LUT to store the indices associated with the vector field
    INDICES = new int[WIDTH][HEIGHT];
    for (int y = 0; y < HEIGHT; y++) for (int x = 0; x < WIDTH; x++) 
        INDICES[x][y] = int(noise(x*SMOOTHNESS, y*SMOOTHNESS)*STEPS); 

    //LUT to store the directions associated with the vector field
    DIRECTIONS = new PVector[STEPS];
    for (int i = 0; i < STEPS; i++) 
        DIRECTIONS[i] = new PVector(cos(i*.5)*.1, sin(i*.5)*.1);  
    
    //Particles
    particles = new ArrayList<Particle>();

    //Create a fancy degraded background
    reset();

}
 
void reset(){
    particles.clear();
    loadPixels();
    for (int i=0; i<WIDTH*HEIGHT; i++) 
        pixels[i] = (0xFF - floor(dist(i%WIDTH, i/HEIGHT, WIDTH/2, HEIGHT/2)*.25)) * 0x01010101;
    updatePixels();
    particles.add(new Particle(new PVector(WIDTH/2, HEIGHT/2)));   
    particles.add(new Particle(new PVector(WIDTH/2, HEIGHT/2)));   
    particles.add(new Particle(new PVector(WIDTH/2, HEIGHT/2)));   
    particles.add(new Particle(new PVector(WIDTH/2, HEIGHT/2)));   
    particles.add(new Particle(new PVector(WIDTH/2, HEIGHT/2)));   
} 
  
void draw()
{

//  if(mousePressed) 
    
    for(int i = 0; i < particles.size(); i++) {
        Particle p = particles.get(i);
        if (p.isDead() == false) {
            p.update();
            p.draw();
        } else { 
            particles.remove(i);
            particles.add(new Particle(new PVector((WIDTH/2), (HEIGHT/2))));   
        }     
    }
}

void keyPressed(){
    reset();  
}

class Particle
{   
  PVector pos, vel, nvec;
  int age, x, y;
    
  public Particle(PVector p)
  {
    pos = p;
    nvec = new PVector(random(0, WIDTH), random(0, HEIGHT)); 
    vel = new PVector();
    age = MAX_AGE;
  }
   
  boolean isDead() { return age==0; } 
    
  void draw() {  ellipse(pos.x, pos.y, age, age); }  
    
  void update() 
  { 
    age--;
    vel.add(DIRECTIONS[INDICES[(int(nvec.x)+WIDTH)%WIDTH][(int(nvec.y)+HEIGHT)%HEIGHT]]);
    nvec.add(vel);
    pos.add(vel);
  }
}

//Giving style to the canvas
parent.document.getElementById("appletAjaxContainer").setAttribute("style", "border: none; padding: 0; box-shadow: 0 0 5px #000; margin: 10px 0;");
