
float[] x = new float[3000];

void setup() {
  size(700,300);
  smooth();
  noStroke();
  fill(255,200);
  for(int i = 0; i<x.length;i++) {
    x[i] = random(-1000,200);
  }
  frameRate(10);
}

  float r = random(255);
  float g = random(255);
  float b = random(255);
  
  float r2 = r+30;
  float g2 = g+30;
  float b2 = b+30;

void draw(){
  background(r2,g2,b2);
 
  
  for (int i = 0; i<x.length;i++) {
    x[i] += 1;
    float y = i*0.4;
    
    translate (80, 0);
    strokeWeight(random(2,6));
    
    pushMatrix();
    
    stroke (r,g,b);
    
    fill(r,g,b);
    
    noStroke();
    
    
    float xc = (random(40,80));
    float yc = (random(80,150));

    ellipse(xc+(random(1,40)), yc+(random(5,10)), 3,1);
    
    fill(r,g,b, 100);
    quad (78,90, 43,90, 90, 60, 200, 70);
    
    fill(255);
    quad (30,32, 89,32, 84,55, 35,55);
    quad (39,55, 82,55, 78,90, 43,90);

    noFill();
    popMatrix();
  }
}
