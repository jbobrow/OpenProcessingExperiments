
// @pjs preload="stern3_sw.svg"; 

// constants
float THRESHOLD = 0.35;
float magnify = 200;

// vars
Maxim maxim;
AudioPlayer player;
PShape shape;

int elements = 32;
int wait = 0;
int baseWidth = 1;

float phase = 0;
float amp = 0;

boolean isPlaying;

color currentColor = color(89, 37, 119);

void setup() {
  // NOTE: could not load in JS mode
  // shape = loadShape("stern3_sw.svg");
  size(600, 600);
  maxim = new Maxim(this);
  player = maxim.loadFile("keinzweiter.wav");
  player.setLooping(true);
  player.volume(1.0);
  player.setAnalysing(true);
  rectMode(CENTER);
  frameRate(25);
}

void draw() {  
  background(255);
  float power = 0;
  
  if (isPlaying) {
    player.play();
    power = player.getAveragePower();
    if (power > THRESHOLD && wait<0) {
      phase+=power*10; 
      wait+=10; 
    }
    wait--;
  }
  
  amp += 0.05;
  float spacing = TWO_PI/elements;  
  translate(width * 0.5, height * 0.5);
  noFill();
  strokeWeight(2);

  for (int i = 0; i < elements;i++) {
    pushMatrix();
    rotate(spacing*i*phase);

    rotate(radians(map(mouseX, 0, width, 0,360)));
    translate(sin(spacing*amp*i)*magnify, 0);
    
    rotate(-(spacing*i*phase));
    rotate(i);
    float scale = power * 10;
    // shape.scale(1 + scale);
    // shape(shape, 0, 0, i*2 + power*10,i*2 + power/2);
    brush(0, 0, i*2+power*10,i*2+power/2);
    //shape.scale(1/(1 + scale));
    
    drawLines(power * 100);
    popMatrix();
    stroke(255, 0, 0);
  }
}


void brush(float x,float y, float px, float py) {
  strokeWeight(1);
  stroke(currentColor, 1);
  pushMatrix();
  translate(x,y);
  rotate(random(px));
  fill(0);
  rect(0+random(50),0+random(50),10,10); 
  popMatrix();
  return;
}

void drawLines(float power) {
  stroke(currentColor, map(mouseY, 0, height, 0, 255));
  float w = power - 10;
  if (w < 0) {
    w = 0;
  }
  strokeWeight(baseWidth + w);
  line(0, 0, width, height);
}

void keyPressed() {
  if (key == '1') {
    if (baseWidth == 10) {
      return;
    } else {
      baseWidth += 1;
      println("Increased stroke width to " + baseWidth);
    }
    baseWidth += 0.1; 
  } else if (key == '2') {
    if (baseWidth == 0 ) {
      return;
    } else {
      baseWidth -= 1;
      println("Decreased stroke width to " + baseWidth);
    } 
  } else if (key == '3') {
    currentColor = color(89, 37, 119);
  } else if (key == '4') {
    currentColor = color(223, 154, 138);
    println("Decreased stroke width to " + baseWidth);
  } else if (key == '5'){
    currentColor = color(138, 167, 197);
  } else if (key == '6'){
    currentColor = color(144, 223, 138);
  } else if (key == '+') {
    elements += 1;
  } else  if (key == '-') {
    elements -= 1;
  } 
}

void mousePressed() {
  isPlaying = !isPlaying;

  if (isPlaying) {
    player.play();
  } else {
    player.stop();
  }
}



