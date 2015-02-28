
float t = 5, dt = 0.01;

void setup() {
  size(300, 300);
  colorMode(HSB, TWO_PI, 1.0, 1.0, 1.0);
  smooth();
  background(0);
  frameRate(60);
}

void draw() {
  clear();
  tanah();
  
  stroke(PI/4, 0.2, 0.5, 1);
  strokeWeight(10);
  
  gambar(100, 280, 0.1, 1, 0, t, 9);
  gambar(200, 280, 0.2, 2, 0.08, t, 9);
  
  dauns(t);
  
  t += dt;
}

void clear() {
  fill(PI, 1, 0.8, 1);
  noStroke();
  rect(0, 0, width, height);
}

void tanah() {
  noStroke();
  fill(PI/3, 0.4, 0.8, 1);
  ellipse(-10, 300, 800, 120);
}

void dauns(float rt) {
  randomSeed(3151);
  
  for (int i = 0; i < 100; i++) {
    float v = random(500, 1000);
    float a = random(0, PI/7);
    float x0 = random(-50, 0);
    float y0 = random(0, height);
    
    float x = (x0 + v * cos(a) * rt) % width;
    float y = (y0 + v * sin(a) * rt) % height;
    
    pushMatrix();
    
    noStroke();
    fill(PI/3, 0.3, 0.7, 1);
    translate(x, y);
    rotate(random(0.5, 3.5) * rt);
    skewX(random(0, 0.2));
    skewY(random(0, 0.5));
    ellipse(0, 0, 8, 3);
    
    popMatrix();
  }  
}

void gambar(
  float x, float y, 
  float a, float k, 
  float ph, float t,
  float step
) {
  if (step > 0) {
    pushMatrix();    
    translate(x, y);
    rotate(a);
    scale(k);
    
    if (step > 3) {
      stroke(PI/4, 0.2, 0.5, 1);
      line(0, 0, 0, -50);
    }
    else {
      fill(PI/3, 0.5, 0.7, 1);
      noStroke();
      ellipse(0, 0, 50, 50);
    }
      
    gambar(0, -50, -PI/6 - 0.05 * sin(9 * (t - ph)), 0.7, ph, t, step-1);
    gambar(0, -50, PI/7 + 0.05 * cos(8 * (t - ph) + 1), 0.8, ph, t, step-1);
    
    popMatrix();
  }
}





