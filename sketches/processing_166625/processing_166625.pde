
int x, y;
boolean sketchFullScreen() {
  return true;
}

void setup() {
  size(1024, 768); 
  background(0);
  smooth();
  PFont f = createFont("Century Gothic", 190); 
  textFont(f); 
  textAlign(CENTER, CENTER);
}

void draw() {
  rect(0, 0, width, height);
  float p1 = 0.35;         
  float p2 = 0.35 + p1;     
  float num = random(1);  
  if (num < p1) {
    fill(0, 255, 0);
  } else if (num < p2) {
    fill(255, 0, 255);    
  } else {
    fill(0, 255, 0); 
  }
  text("#FF00FF", random(400,450), 0+30);
  text("#00FF00", random(600,650), 128+30);
  text("#FF00FF", random(400,450), 256+30);
  text("#00FF00", random(600,650), 384+30);
  text("#FF00FF", random(400,450), 512+30);
  text("#00FF00", random(600,650), 640+30);
}



