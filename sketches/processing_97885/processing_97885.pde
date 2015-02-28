
int num = 9;
int steps = 50;
float centx, centy;
Particle[] parr;

void setup() {
  size(700,500);
  frameRate(10);
  startover();
  smooth();
  
  centx = width/2;
  centy = height/2;
  
  parr = new Particle[num];
  for( int i=0;i<num;i++) {
    parr[i] = new Particle(i);
  }
}

void startover() {
  background(0);
}

void draw() {

  for (int i=0;i<num;i++) {
    parr[i].update();
  }
}

void keyPressed() {
  if(key== 's') {
    saveFrame("screenshot-####.tiff");
  }
}

void mousePressed() { 
  startover();
  centx = mouseX;
  centy = mouseY;
  for (int i=0;i<num;i++) {
    parr[i].me();
  }
}

class Particle {
  int it;
  int count, life, steps;
  int thick;
  float x, y;
  float x1, y1, x2, y2;
  int rd, gr, bl, alph;
  float angle, radius;
  
  Particle (int num) {
    it = num;
    me();
  }
  
  void trace(String str) {
    println("Particle " + it + ": " + str);
  }
  
  void me() {
    trace("me");
    count = 0;
    steps = int(random(10));
    life = 120 * int(random(5) + 1);
    radius = random(height) + 40;
    thick = int(random(1) + 4);
    
    x1 = 500;
    
    alph = 255;
    
    if ((rd == 0) || (rd == 255)) {
    rd = int(random(255));
    gr = int(random(255));
    bl = int(random(255));
        } else {
      if (rd > 125) {
        rd=255; gr=255; bl=255;
      } else {
        rd=0; gr=0; bl=0;
      }
    }

  }

  
  void update() {
    count += steps;
    angle = count; 
    x2 = centx + (radius * cos(angle)*2);
    y2 = centy + (radius * sin(angle)*2);

    if (x1 != 999) {
      strokeWeight(thick);
      stroke(rd, gr, bl, alph);
      line(x1, y1, x2, y2);
    }
    //update
    x1 = x2; y1 = y2;
    
    alph -= steps;
   
 
    if (count >= life) { me(); }
  }
  
}


