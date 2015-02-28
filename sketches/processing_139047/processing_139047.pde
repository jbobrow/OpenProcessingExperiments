
final int max_c = 74;
final float aver_dist = 10;

final float min_ellipse = 1;
final float max_ellipse = 100;

final float friction = .4;

float t1 = 0;
int x1 = 0;
float t2 = 0;
int x2 = 0;

PVector[] radius;

void setup() {
  size(800, 800);
  noFill();
  
  
  radius = new PVector[max_c];
  for (int i = 1; i < max_c; i++)
  {
    radius[i] =  new PVector(2*i*min_ellipse, 2*i*min_ellipse);
  }
}

void draw() {
  

  float nt1 = noise(t1);
  float nt2 = noise(t2);
  background(20);
  
  radius[0] =  new PVector(min_ellipse+map(noise(t1), 0., 1., 0, 800)*(max_ellipse-min_ellipse)/width, min_ellipse+map(noise(t2), 0., 1., 0, 800)*(max_ellipse-min_ellipse)/height);
  ellipse(width/2, height/2, radius[0].x, radius[0].y);


 
  for (int i = 1; i < max_c; i++) {
    strokeWeight(2.8);
    if (mousePressed && (mouseButton == LEFT)) { 
    float r = map(noise(t1), 0., 1., 200, 255);
    float g = map(noise(t2),  0., 1., 150, 200);
    float b = random(180, 200);
    stroke(r, g, b);
  } else {
    float r = map(noise(t1), 0., 1., 60, 150);
    float g = map(noise(t2),  0., 1., 100, 255);
    float b = random(80, 250);
    stroke(r, g, b);
  }
    
    
    float deltaX = radius[i-1].x - radius[i].x + aver_dist;
    float deltaY = radius[i-1].y - radius[i].y + aver_dist;

    radius[i].x += deltaX * friction;
    radius[i].y += deltaY * friction;

    ellipse(width/2, height/2, radius[i].x, radius[i].y);
    t1 = t1+0.00001;
    x1++;
    t2 = t2+0.00001;
    x2++;
  }
  
  for (int i = 1; i < max_c; i++) {
    strokeWeight(1);
    ellipse(width/2, height/2, radius[i].x, radius[i].y);
    
    float r = map(noise(t1), 0., 1., 200, 255);
    float g = map(noise(t2),  0., 1., 220, 255);
    float b = random(180, 255);
    stroke(r, g, b);
    float deltaX = radius[i-1].x - radius[i].x + aver_dist;
    float deltaY = radius[i-1].y - radius[i].y + aver_dist;

    radius[i].x += deltaX * friction;
    radius[i].y += deltaY * friction;

    ellipse(width/2, height/2, radius[i].x, radius[i].y);
    if (mousePressed && (mouseButton == LEFT)) { 
    t1 = t1+0.005;
    t2 = t2+0.007;
  } else {
    t1 = t1+0.0001;
    x1++;
    t2 = t2+0.0001;
    x2++;}
  }
}

