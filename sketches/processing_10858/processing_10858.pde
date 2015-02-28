
PFont font;
PGraphics g;

int N = 50;
color bg = color(0);

ArrayList particles = new ArrayList();

void setup(){
  size(400,400, P2D);
  colorMode(HSB, 255);
  background(bg);
  
  g = createGraphics(400,400,P2D);
  g.colorMode(HSB, 255);
  
  font = createFont("Osaka", 102, true);
  textFont(font,102);
  
  createTextPalette();
  createParticle();
}

void draw(){
  background(bg);
  
  for(int i=0; i<particles.size(); i++){
    Particle p = (Particle)particles.get(i);
    p.draw();
    p.update();
  }
}

void createTextPalette(){
  g.beginDraw();
  g.textFont(font,102);
  g.textAlign(CENTER,CENTER);
  g.translate(width/2, height/2);
  g.fill(255);
  g.text("Hello", 0, 0);
  g.endDraw();
}

void createParticle(){
  loadPixels();
  g.loadPixels();
  
  for(int i=0; i<width*height; i++){
    if(brightness(g.pixels[i]) > 230){
      if(random(100) < N)
      particles.add(new Particle(i%width, int(i/width), random(5)));
    }
  }
  
  updatePixels();
}

class Particle{
  float x;
  float y;
  float s;
  
  float nx = random(width*4) - width*1.5;
  float ny = random(height*4) - height*1.5;
  
  color c = color(random(255),255,255);
  
  Particle(float _x, float _y, float _s){
    x = _x;
    y = _y;
    s = _s;
    
    nx += sgn(nx-width/2)*width/2;
    ny +=  sgn(ny-height/2)*height/2;
  }
  
  void update(){
    float dx = random(sgn(x-nx)) + random(3) - 1.5;
    float dy  = random(sgn(y-ny)) + random(3) - 1.5;
    
    nx += dx;
    ny += dy;
  }
  
  void  draw(){
    noStroke();
    fill(c);
    ellipse(nx,ny,s,s);
  }
}

int sgn(float n){
  if(n==0) return 0;
  else return int(abs(n)/n);
}


