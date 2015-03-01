
PVector loc;
PVector loc2;
float angle; 
float r; 
float y;
float yv;
int h = 200;
int s = 80;
int cv = -1;

void setup() {
  size(720, 360);
  smooth();
  background(0, 0, 0);
  frameRate(3);
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {

  fill(0, 0, 0, 10);
  rect(0, 0, width, height);

  initial();
  
  //wave
  for (int x = 0; x < width+30; x += 30) {
    float ypos =  y+r*sin(angle)+yv;
    loc = new PVector(x, ypos);  
    angle += noise(yv)/2;
    r += noise(yv)/4;

    //color
    h += cv;
    s += cv;
    if (h > 200) {
      cv = -1;
    } 
    if (h < 100) {
      cv = 1;
    }
    if (s > 80) {
      cv = -1;
    } 
    if (h < 10) {
      cv = 1;
    }

    fill(h, s, 100, 10);
    noStroke();
    ellipse(loc.x, loc.y, 100*noise(yv), 100*noise(yv));
    fill(h, s, 100, 70);
    ellipse(loc.x, loc.y, 5, 5);

    stroke(255, 30, 100, 20);
    strokeWeight(0.3);
    noFill();
    line(loc.x, loc.y-random(30, 100), loc.x, loc.y+random(30, 100));
    stroke(255, 30, 100, 70);
    line(loc.x-random(30, 50), loc.y, loc.x+random(30, 50), loc.y);
  }
}


void mouseReleased() {
  background(0);
  initial();
}

void initial() {
  angle = random(60, 62);
  r = random(90, 94);
  y = random(120, 200);
  yv = random(-3, 3);
  loc2 = new PVector(0, 0);
  
}



