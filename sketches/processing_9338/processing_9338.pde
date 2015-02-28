
/**
 * Variables
 */
PFont theFont;
int scene = 0;
int count = 200;
float gt = 0;
float gdt = 0.01;
float it = 0;

/**
 * Particle
 */
class Particle {
  int index;    // Particle index  
  float x, y;   // Position
  float v, a;   // Velocity, Angle
  float s;      // Spin angular velocity
  float d;      // diameter
  float r;      // revolution radius
  float col;    // Color
  float alpha;  // Alpha blend
  float t, dt;  // Internal time

  Particle(int i) {
    index = i;
    
    reset(scene);
  }
  
  void reset(int scn) {  
    col = random(0, PI / 4);
    d = 10;

    switch (scn) {
      case 1: // semprot
        x = 0;
        y = 0;
        v = random(100, 480);
        a = random(PI / 6, PI / 3);
        break;
        
      case 2: // mancur
        x = width / 2;
        y = height;
        v = random(100, 980);
        a = random(- 0.1, 0.1);
        break;
        
      case 3: // vortex
        x = width / 2;
        y = height / 2;
        r = random(250, 1000);
        a = random(0, 2 * PI);
        break;
        
      case 4: // beads
        x = width / 2;
        y = height / 2;
        a = PI * 2 * index / count;
        r = 150 + 20 * cos(a / PI * 72);
        break;
        
      case 5: // spacewarp
        x = width / 2;
        y = height / 2;
        v = random(500, 1600);
        a = random(0, 2 * PI);
        break;
        
      case 6: // gomorah
        x = random(0, width);
        y = random(- height, 0);
        v = random(500, 800);
        a = random(0, 0.3);
        break;
        
      case 7: // wave
        y = height / 2;
        x = 1.0 * width * index / count;        
        r = 100;
        v = 5;
        s = random(3, 30);
        break;
        
      case 8: // randomwalk
        x = width / 2;
        y = height / 2;
        break;
        
      case 9: // straight
        x = random(0, width);
        y = random(0, height);
        
        v = random(30, 500);
        if (random(0, 10) < 5) 
          a = PI / 2;
        else
          a = 0;      
        break;
        
      case 10: // grow
        x = random(0, width);
        y = random(0, height);
        
        v = random(2, 40);
        s = random(0.1, 0.5);
        break;
        
      case 11: // bling
        x = random(0, width);
        y = random(0, height);
        
        v = random(2, 7);
        s = random(2, 10);
        break;
        
      case 12: // fireworks
        x = width / 2;
        y = height;
        
        v = random(700, 710);
        a = - PI/ 2;
        r = - v * sin(a) / 1000;
        break;
        
      case 13: // mancur 2
        x = width / 2;
        y = height;
        v = random(100, 980);
        a = random(- 0.1, 0.1);
        break;
        
      case 14: // bouncing
        x = width / 2;
        y = height / 2;
        v = random(100, 980);
        a = random(0, 2 * PI);
        break;
        
      case 15: // scan
        x = random(- width, 0);
        y = random(- height, height);
        v = 300;
        a = PI / 6;
        break;
        
      case 16: // split
        x = width / 2;
        y = height / 2;
        v = 100;
        a = round(random(0, 7));
        break;
        
      case 17: // whatever
        x = width / 2;
        y = height / 2;
        v = random(100, 500);
        a = round(random(0, 7));
        break;

      default:
        x = random(0, width);
        y = random(0, height);
        v = random(-10, 10);
        r = random(10, 50);
        d = random(5, 30);
        alpha = random(0.2, 0.8);
        break;
    }
    
    t = 0;
    dt = 0.01;
  }
  
  void draw(int scn) {
    float xx, yy;
  
    switch (scn) {
      case 1: // semprot
        xx = x + v * cos(a) * t;
        yy = y + (v * sin(a) + 200 * t) * t ;
        
        if (yy > height + 50) t = 0;
        break;

      case 2: // mancur
        xx = x + v * cos(-PI/2 + a) * t;
        yy = y + (v * sin(-PI/2 + a) + 500 * t) * t ;
        
        if (yy > height + 50) t = 0;
        break;
        
      case 3: // vortex
        float rr = r * (1 - t);
        xx = x + rr * cos(a + 5 * t);
        yy = y + rr * sin(a + 5 * t);
        d = 50 * (1 - t);
        
        if (rr < 30) t = 0;
        break;
        
      case 4: // beads
        xx = x + r * cos(a + t) * cos(t);
        yy = y + r * sin(a + t) * cos(t);
        break;
        
      case 5: // spacewarp
        xx = x + v * cos(a) * t;
        yy = y + v * sin(a) * t;
        d = 20 * t;
        
        if (dist(xx, yy, x, y) > 300) t = 0;
        break;
        
      case 6: // gomorah
        xx = x - v * sin(a) * t;
        yy = y + v * cos(a) * t;
        d = 20 * (1 - t);
        
        if (yy > height + random(20, 50)) t = 0;
        break;
        
      case 7: // wave
        a = PI / 2 * x / width;
        xx = x + s * sin(v * t);
        yy = y + r * cos(v * t + a) + s * cos(v * t);
        break;
        
      case 8: // randomwalk
        xx = x = x + random(-5, 5);
        yy = y = y + random(-5, 5);
        break;
        
      case 9: // straight
        xx = x + v * cos(a) * t;
        yy = y + v * sin(a) * t;
        
        if (dist(xx, yy, 0, 0) > 700) t = - 1;
        break;
        
      case 10: // grow
        xx = x;
        yy = y;
        
        d = v * sin(s * t);
        if (d < 0) {
          x = random(0, width);
          y = random(0, height);
          t = 0;
        }
        break;
    
      case 11: // bling
        xx = x;
        yy = y;
        
        d = v * sin(s * t);
        break;
        
      case 12: // fireworks
        xx = x + v * cos(a) * t;
        yy = y + (v * sin(a) + 500 * t) * t ;
        
        if (t > 2) {
          reset(scn);
        }
        else if (t > r) {
          x = xx;
          y = yy;
          v = random(500, 900);
          a = random(0, 2 * PI);
          t = 0;
          r = 1000;
        }
        break;
    
      case 13: // mancur 2
        xx = x + v * cos(-PI/2 + a) * t;
        yy = y + (v * sin(-PI/2 + a) + 500 * t) * t ;
        
        if (yy > height) {
          x = xx;
          y = yy;
          t = 0;
          v = 0.7 * v;
        }
        
        if (xx < 0 || x > width || v < 1) {
          reset(scn);
        }
        break;
        
      case 14: // bouncing
        xx = x + v * cos(a) * t;
        yy = y + v * sin(a) * t;
        
        if (xx < 0 || xx > width) {
           x = xx;
           y = yy;
           a = PI - a;
           v = 0.9 * v;
           t = 0;
        }

        if (yy < 0 || yy > height) {
           x = xx;
           y = yy;
           a = - a;
           v = 0.9 * v;
           t = 0;
        }
        
        break;
        
      case 15: // scan
        xx = x + v * cos(a) * t;
        yy = y + v * sin(a) * t;
        
        if (xx > width || yy > height) t = 0;
        break;
        
      case 16: // split
        xx = x + v * cos(a * PI / 4) * t;
        yy = y + v * sin(a * PI / 4) * t;
        
        if (t > 0.5) {
          x = xx;
          y = yy;
          a = round(random(0, 7));
          t = 0;
        }
        
        if (xx > width || yy > height || xx < 0 || yy < 0) {
          reset(scn);
        }
        break;
        
      case 17: // whatever
        xx = x + v * cos(a * PI / 2) * t;
        yy = y + v * sin(a * PI / 2) * t;
        
        if (t > 0.5) {
          x = xx;
          y = yy;
          a = round(random(0, 3));
          t = 0;
        }
        
        if (dist(xx, yy, width/2, height/2) > 300) {
          reset(scn);
        }
        break;
        
      default:
        xx = x + r * cos(v * t);
        yy = y + r * sin(v * t);
        break;
    }
    
    fill((col + 0.2 * gt) % (2 * PI), 0.4, 0.9, alpha);
    ellipse(xx, yy, d, d);
    
    t += dt;
  }
}

ArrayList particles;
ArrayList scenes;

/**
 * Setup
 */
void setup() {
  size(400, 400);
  colorMode(HSB, 2 * PI, 1, 1, 1);
  smooth();
  
  theFont = loadFont("Verdana-48.vlw");
  textFont(theFont);
  
  particles = new ArrayList();
  for (int i = 0; i < count; i++) {
    particles.add(new Particle(i));
  }
  
  scenes = new ArrayList();
  scenes.add("rotate (20)");
  scenes.add("semprot (30)");
  scenes.add("mancur (15)");
  scenes.add("vortex (40)");
  scenes.add("beads (30)");
  scenes.add("spacewarp (25)");
  scenes.add("gomorah (25)");
  scenes.add("wave (30)");
  scenes.add("randomwalk (40)");
  scenes.add("straight (30)");
  scenes.add("grow (20)");
  scenes.add("bling (20)");
  scenes.add("fireworks (40)");
  scenes.add("mancur2 (40)");
  scenes.add("bouncing (40)");
  scenes.add("scan (20)");
  scenes.add("split (30)");
  scenes.add("whatever (30)");
}

/**
 * Draw
 */
void draw() {
  clear(0.2);

  for (int i = 0; i < particles.size(); i++) {
    Particle p = (Particle) particles.get(i);
    
    p.draw(scene);
  }
  
  if (it < 2) {
    drawInfo();
    
    it += gdt;
  }
  
  gt += gdt;
}

/**
 *
 */
void mousePressed() {
  if (mouseButton == LEFT)
    scene = (scene + 1) % scenes.size();
  else if (mouseButton == RIGHT) {
    scene = scene - 1;
    if (scene < 0) scene = scenes.size() - 1;
  }
  
  for (int i = 0; i < particles.size(); i++) {
    Particle p = (Particle) particles.get(i);
    
    p.reset(scene);
  }  
  
  it = 0;
}

/**
 *
 */
void clear(float op) {
  fill(0, 0, 0, op);
  noStroke();
  rect(0, 0, width, height);
}

/**
 *
 */
void drawInfo() {
  fill(0, 0, 1, 1);
  
  textAlign(LEFT, BOTTOM);
  textSize(24);
  text(
    (scene + 1) + " - " + ((String) scenes.get(scene)),
    10,
    height - 10
  );
}

/**
 *
 */
void drawButton() {
}

