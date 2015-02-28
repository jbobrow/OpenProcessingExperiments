

ArrayList<Dot> dots;
float G = 0.004;
/* code for creating screen-saver across multiple monitors
static public void main(String args[]) {
  Frame frame = new Frame("testing");
  frame.setUndecorated(true);
  // The name "sketch_name" must match the name of your program
  PApplet applet = new Tripper();
  frame.add(applet);
  applet.init();
  frame.setBounds(-1366, 0, 1920 + 1366, 1080); 
  frame.setVisible(true);
}*/


void setup(){
  size(500, 500, P2D);//1366 + 1920, 1080);//
  ellipseMode(RADIUS);
  
  dots = new ArrayList<Dot>();
  int n = 10;
  for(; n > 0; n--){
    dots.add(new Dot(new PVector(random(width), random(height))));
  }
  noSmooth();
  background(255);
}

void draw(){
  for(Dot d : dots){
    d.drawUpdateThis();
  }
  for(Dot d : dots){
    d.moveThis();
  }
  processPixels();
  
}

/* For screensaver
void mouseMoved(){
  if(millis() > 1000)
    this.exit();
}*/

void keyPressed(){
  background(255);
  int n = dots.size();
  dots.clear();
  for(; n > 0; n--){
    dots.add(new Dot(new PVector(random(width), random(height))));
  }
}


void processPixels(){
  int addition = (6 << 16) + (5 << 8) + 4;
  int white = color(255);
  loadPixels();
  for(int i = 0; i < pixels.length; i++){
    if(pixels[i] != white)
      pixels[i] = ((pixels[i] + addition) & 0xFFFFFF) + (0xFF << 24);
  }
  updatePixels();
}

class Dot{
  PVector pos, vel;
  float mass, rad, tmpDist;
  int clr;
  
  public Dot(PVector pos){
    this.pos = pos;
    vel = new PVector(random(1) - 0.5, random(1) - 0.5);
    accel = new PVector(0, 0, 0);
    tmp = new PVector(0, 0, 0);
    mass = pow(random(pow(20, 0.1), pow(1000, 0.1)), 10);
    rad = sqrt(mass/PI);
    int r, g, b;
    r = g = b = 0;
    while(r == g && g == b){
      r = (int)random(255);
      g = (int)random(255);
      b = (int)random(255);
    }
    clr = color(r, g, b);
  }
  
  public Dot(PVector pos, float mss){
    this(pos);
    mass = mss;
    rad = sqrt(mass/PI);
  }
  
  PVector accel, tmp;
  public void drawUpdateThis(){
    drawThis();
    updateThis();
  }
  
  public void drawThis(){
    fill(clr); stroke(clr);
    ellipse(pos.x, pos.y, (int)rad, (int)rad);
  }
  
  public void updateThis(){
    accel.set(0, 0, 0);
    for(Dot d : dots){
      if(d == this) continue;
      tmp = PVector.sub(d.pos, pos);
      tmpDist = tmp.mag();
      tmp.normalize();
      accel.add(PVector.mult(tmp, G * d.mass / tmpDist));
    }
    vel.add(accel);
  }
  
  public void moveThis(){
    if(pos.x <= 0 || pos.x >= width){
      vel.x *= -1;
      pos.x += vel.x;
    }
    if(pos.y <= 0 || pos.y >= height){
      vel.y *= -1;
      pos.y += vel.y;
    }
    pos.add(vel);
  }
}

class Sun extends Dot{
  
  public Sun(PVector p){
    super(p, 1000);
  }
  
  public void drawTghis(){
    fill(clr); stroke(clr);
    ellipse(pos.x, pos.y, (int)rad, (int)rad);
  }
}


