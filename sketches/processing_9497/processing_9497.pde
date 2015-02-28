
int [] x = new int[12];
int [] y = new int[12];
int a = int(width/2);
int b = int(height/2);
int c = int(random(0,10));
int d = int(random(10,30));
float angle = 1.02;


void setup() {
  size(500,750, P3D);
  background(255);
  smooth();
}

void draw() {
    angle *= 1.002;
    println(angle);
    
    if(angle > 18.0){
      noLoop();
    }

  
for (int i=1; i<x.length; i++) {
  for (int j=1; j<y.length; j++) {
    x[i] = int(pow(i, 2)) * int( random(10, 20)) ;  
    y[j] = int(pow(j, 2)) * int( random(20, 30)) ;  

    int h = 200 + int(random(-10, 50)*sin(angle));      
    int k = 83 + int(random(-70, 120)*sin(angle));
    int l = 12 + int(random(0, 40)*exp(cos(angle)));
    int f = 1 + int(random(0, 4)*exp(sin(angle)));

    stroke(0, f);
    noFill();

    float q = constrain(y[j]/exp(sin(angle)), 0, width);
    float e = constrain(pow(x[i],exp(cos(angle))), 0, height);
    float r = constrain(pow(x[i],sin(sin(angle))), 0, width);
    float u = constrain(pow(exp(y[j]),cos(angle)), 0, height);

    beginShape();

    int steps = 10;
    bezierDetail(12);   
    
    for (int z = 0; z <= steps; z++) {
      float t = z/float(steps);
      float x = bezierPoint(q, e, r, u, t);
      float y = bezierPoint(r, u, q, e, t);

      ellipse(x, y, 1, 1);
      
    }
    
    endShape();
    
  }
  
}

}


