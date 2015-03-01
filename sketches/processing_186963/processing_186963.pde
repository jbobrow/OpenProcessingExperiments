
Fiuu[] bz;
float absot, loopt;

void setup() {
  size(500, 500);
  frameRate(30);

  bz = new Fiuu[5000];
  for(int i=0; i<bz.length; i++) {
    bz[i] = new Fiuu(70, 0.004);
  }
}
void draw() {
  background(#221005);
  absot = frameCount * 0.003;
  loopt = (frameCount % 40) / 40.0;
  loadPixels();
  for(int i=0; i<bz.length; i++) {
    bz[i].draw(i);
  }
  updatePixels();
  noStroke();
  fill(0);
  rect(0,0,width,60);
  rect(0,height-60,width,60);  
}

class Fiuu {
  PVector a,b,c,d;
  float offset, scale, delta, angle, dist, nt;
  Fiuu(float delta, float scale) {    
    this.scale = scale;
    this.delta = delta;
    a = new PVector(random(-50, width+50), random(0, height));        
    b = new PVector();
    c = new PVector();
    d = new PVector();
    offset = random(1);    
  }
  void setTarget(int toffset) {
    nt = absot + toffset * 0.1;
    angle = 10 * noise(a.x*scale, a.y*scale, nt);
    dist = delta * noise(a.y*scale, a.x*scale, nt);    
    b.set(dist*cos(angle), dist*sin(angle));
    b.add(a);

    angle = 10 * noise(b.x*scale, b.y*scale, nt);
    dist = delta * noise(b.y*scale, b.x*scale, nt);    
    c.set(dist*cos(angle), dist*sin(angle));
    c.add(b);

    angle = 10 * noise(c.x*scale, c.y*scale, nt);
    dist = delta * noise(c.y*scale, c.x*scale, nt);
    d.set(dist*cos(angle), dist*sin(angle));
    d.add(c);
  }
  void draw(int id) {
    setTarget(id % 2);          
    float t = (loopt+offset) % 1;
    int x = floor(bezierPoint(a.x, b.x, c.x, d.x, t));
    int y = floor(bezierPoint(a.y, b.y, c.y, d.y, t));
    if(x>0 && x < width && y > 0 && y < height) {
      float co = map(sin(t * t * t * PI), 0, 1, 0, 1);    
      pixels[x+y*width] = (255 << 24) | (floor(34+208*co) << 16) | (floor(16+238*co) << 8) | (floor(5+250*co));
    }    
  }
}


