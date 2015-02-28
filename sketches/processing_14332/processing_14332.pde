
Particle p, target;
float DRAG = 0.9;
float big = 80;
float amp = big/7;

Particle[] t;
int following = 0;

void setup() {
  size(400, 300); 
  float midX = width/2;
  float midY = height/2;

  t = new Particle[6];
  t[0] = new Particle(midX - big*.5, midY - big*.5);
  t[1] = new Particle(midX - big*1.5, midY); 
  t[2] = new Particle(midX - big, midY + big); 
  t[3] = new Particle(midX + big*.5, midY - big*.5);
  t[4] = new Particle(midX + big*1.5, midY);   
  t[5] = new Particle(midX + big, midY + big); 

  target = new Particle(t[0].px + random(-amp, amp), t[0].py + random(-amp, amp)); 
  target.col = color(234, 145, 9, 7);
  target.mass = 100;
  p = new Particle(midX + big*.5, midY + big*.5);
  background(255);
  smooth();
}


void check() {
  float d = dist(p.px, p.py, target.px, target.py);

  if(d < amp*5) {
    following ++;
    following %= 6;
    //println(following);
    target.px = t[following].px + random(-amp, amp);
    target.py = t[following].py + random(-amp, amp);
  }
}


void draw() {
  float x = p.px;
  float y = p.py;
  p.clearForces();
  check();


  float fx = target.px - p.px;
  float fy = target.py - p.py;
  p.accumulateForce(fx, fy);
  p.update(); 

  strokeWeight(1);
  float grey = map(cos((float)millis()/10000.0), -1, 1, 0, 255);
  stroke(grey);
  line(x, y, p.px, p.py);
  //target.render();
}

class Particle {

  float px, py;
  float vx, vy;
  float fx, fy;
  float mass;
  color col;

  Particle(float xin, float yin){
    px = xin;
    py = yin;
    col = color(0, 50);
    vx = 0; 
    vy = 0;
    fx = 0; 
    fy = 0; 
    mass = 50;
  }

  void clearForces(){
    fx = 0; 
    fy = 0;
  }

  void accumulateForce(float gx, float gy){
    fx += gx;
    fy += gy;
  }

  void update(){
    vx += fx / mass;
    vy += fy / mass;
    vx *= DRAG;
    vy *= DRAG;
    px += vx;
    py += vy;
  }

  void screenwarp(){
    if (py<0){
      py += height;
    }
    if (px<0){
      px += width;
    } 
    else if (px>width){
      px -= width;
    }
  }

  void render(){
    fill(col);
    noStroke();
    ellipse(px,py, mass/10, mass/10);
  }
}



