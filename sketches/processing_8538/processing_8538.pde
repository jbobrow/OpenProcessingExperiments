
int NUM_CIRCLES = 500;
float MIN_R = 10;
float MAX_R = 100;
float MIN_MUL = 1;
float MAX_MUL = 10;
float OVERLAP_MUL = 0.15;
int MIN_ALPHA = 20; //60;
int MAX_ALPHA = 60; //140;
int BLUE_MOD = 10;
boolean thresholdMode = true;

int threshold = 65;

PGraphics pg;

ArrayList circles;

void setup(){
  size(640, 480);
  background(25, 25, 25);
  colorMode(HSB);
  smooth();
  pg = createGraphics(width, height, P2D);
  circles = new ArrayList();
  for(int i=0; i<NUM_CIRCLES; i++){
    color col;
    if(i % BLUE_MOD != 0)
      col = color(100, random(0, 255), 127, random(MIN_ALPHA, MAX_ALPHA));
    else
      col = color(0, 0, random(0, 255), random(MIN_ALPHA, MAX_ALPHA));
    circles.add(new Circle(new PVector(random(0, width), random(0, height)), random(MIN_R, MAX_R), col));
  }
}

void draw(){
  pg.beginDraw();
  pg.background(0);
  for(int i=0; i<NUM_CIRCLES; i++){
    Circle circle = (Circle) circles.get(i);
    circle.update();
    circle.display();
  }
  pg.endDraw();
  image(pg, 0, 0);
  if(thresholdMode){
    //drawThreshold(45, color(#57301F), color(#AB9650));    // brown
    drawThreshold(threshold, color(#456382), color(#B4C4D4));       // blue
  }
}

void drawThreshold(int threshold, color dark, color bright){
  loadPixels();
  for(int x=0; x<width; x++){
    for(int y=0; y<height; y++){
      if(brightness(pixels[y*width+x]) < threshold)
        pixels[y*width+x] = dark;
      else if(brightness(pixels[y*width+x]) >= threshold)
        pixels[y*width+x] = bright;
    }
  }
  updatePixels();
}

void keyPressed(){
  if(key == '+'){
    threshold++;
    if(threshold > 255)
      threshold = 255;
  }
  else if(key == '-'){
    threshold--;
    if(threshold < 0)
      threshold = 0;
  }
  else if(key == 't'){
    if(thresholdMode)
      thresholdMode = false;
    else
      thresholdMode = true;
  }
}

class Circle{
  PVector pos;
  color col;
  float r;
  int xSign, ySign;
  
  Circle(PVector p, float r, color c){
    this.pos = p;
    this.col = c;
    this.r = r;
    xSign = ySign = 1;
  }

  void display(){
    pg.fill(col);
    //pg.stroke(255, 10);
    pg.noStroke();
    //ellipseMode(CENTER);
    pg.ellipse(pos.x, pos.y, r, r);
    //pg.rectMode(CENTER);
    //pg.rect(pos.x, pos.y, r, r);
  }
  
  void update(){
    checkBoudaries();
    float mul = map(r, MIN_R, MAX_R, MIN_MUL, MAX_MUL);
    pos.x = pos.x + noise(pos.x)*xSign*mul;
    pos.y = pos.y + noise(pos.y)*ySign*mul;
  }
  
  
  void checkBoudaries(){
    if(pos.x + r*0.5*OVERLAP_MUL >= width)
      xSign = -1;
    else if(pos.x - r*0.5*OVERLAP_MUL <= 0)
      xSign = 1;
    if(pos.y + r*0.5*OVERLAP_MUL >= height)
      ySign = -1;
    else if(pos.y - r*0.5*OVERLAP_MUL <= 0)
      ySign = 1;
  }
}

