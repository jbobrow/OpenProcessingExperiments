
// two nostrils glowing
// guide the blind animal to the source of blood
// always swimming
// its just about survival
// gradually losing senses

// keys
boolean[] keys = new boolean[500];

// player
PVector pos = new PVector();
float angle = PI;
float vel = 1.0;
ArrayList<PVector> tail = new ArrayList();
int counter = 0;
PVector reye, leye;
float life = 100.0;
float fadein = 0.0;

// target
PVector target = new PVector();
float sat = 1.0;
PVector eaten = new PVector();
float eatenr = 0.0;
float eatena = 100.0;

// bg
PImage bgImg = new PImage(440, 440, ARGB);

// setup
void setup() {
  size(440,440);
  colorMode(HSB,360,100,100);
  ellipseMode(CENTER);
  smooth();
  pos = new PVector(width/2, height);
  target = new PVector(random(width), random(height));
  makeBg();
}


// draw
void draw() {    
  // fadein
  if(life > 0) {
    fadein = min(1.0, fadein + 0.02);
  } else {
    fadein = max(0.0, fadein - 0.02);
  }
  // background
  drawBg();
  // player
  float turn = 0.06;
  if(keys[37]) angle -= turn;
  if(keys[39]) angle += turn;
  PVector a = new PVector(vel*sin(-angle), vel*cos(-angle));
  pos.add(a);
  // get eye positions
  a.normalize(); a.mult(7);
  PVector b = new PVector(a.y, -a.x);
  reye = PVector.add(PVector.add(pos,a),b);
  leye = PVector.sub(PVector.add(pos,a),b);
  // draw playr
  drawPlayer();
  // get target
  if(target.dist(pos) < 15) {
    eaten = target.get();
    eatenr = 0.0;
    eatena = 100.0;
    target = new PVector(random(width*0.25, width*0.75), random(height*0.25, height*0.75));
    sat = max(0, sat - 0.1);
    makeBg();  
    life = min(100, life + 10.0);
}
  // tail
  counter++;
  if(counter > 5) {
    counter = 0;
    tail.add(pos.get());
    if(tail.size() > 5) tail.remove(0);
  }
  //
  eatena = max(0, eatena - 2.0);
  eatenr += 3.0;
  noFill();
  stroke(0,0,100,eatena);
  ellipse(eaten.x, eaten.y, eatenr, eatenr);
  // life
  stroke(0,0,100,100);
  line(10,10,10 + life/100 * (width-20),10);
  life = max(0, life - 0.05); 
  // target
  drawTarget();
  // limit pos
  if(pos.x <= 0) pos.x = 0.0;
  if(pos.x > width) pos.x = width;
  if(pos.y <= 0) pos.y = 0.0;
  if(pos.y > height) pos.y = height;
}


// make bg
void makeBg() {
  bgImg.loadPixels();
  for(int i = 0; i < width*height; i++) {
    int x = i % width;
    int y = floor(i / width);
    PVector p = new PVector(x, y);
    int a = width - p.dist(target);
    a *= 100/width;
    a *= sat;
    bgImg.pixels[i] = color(0, 70, 100, a);
  }
  bgImg.updatePixels();
}


// bg
void drawBg() {
  float s = 38.0;
  background(215, s, 40);
  image(bgImg, 0, 0);
}


// draw player
void drawPlayer() {
  // style
  noStroke();
  fill(0,0,100,100*fadein);
  // body
  pushMatrix();
  translate(pos.x, pos.y);
  rotate(angle);
  beginShape();
  vertex(0,5);
  vertex(5,-5);
  vertex(-5,-5);
  endShape();
  popMatrix();
  // tail
  int i = 0;
  for(PVector p : tail) {
    ellipse(p.x, p.y, i, i);
    i++;
  }
  // eyes
  float eyer = 7.0;
  reye.z = 100 - 100*target.dist(reye)/width;
  leye.z = 100 - 100*target.dist(leye)/width;
  float dif = reye.z - leye.z;
  dif*=5;
  leye.z -= dif;
  reye.z += dif;
  float a = 100;
  reye.z *= fadein;
  leye.z *= fadein;
  //stroke(0,0,100,100);
  fill(0, 70, 100, reye.z);
  ellipse(reye.x, reye.y, eyer, eyer);
  fill(0, 70, 100, leye.z);
  ellipse(leye.x, leye.y, eyer, eyer);
}



// draw target
void drawTarget() {
  noStroke();
  fill(0,70,100,100);
  //ellipse(target.x, target.y, 5, 5);
}


// keys
void keyPressed() {
  if(keyCode < 256) keys[keyCode] = true;
  
}

void keyReleased() {
  if(keyCode < 256) keys[keyCode] = false;
}
