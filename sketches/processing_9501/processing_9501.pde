
int [] x = new int[12];
int [] y = new int[12];
int a = int(width/2);
int b = int(height/2);
int c = int(random(0,10));
int d = int(random(10,30));
float angle = 1.02;


void setup() {
  size(500,500);
  smooth();
  background(255);
}

void draw() {
  angle *= 1.002;

  noFill();

  if(angle > 10.0) {
    noLoop();
  }
 

  for (int i=1; i<x.length; i++) {
    for (int j=1; j<y.length; j++) {
      x[i] = int(pow(i, 2)) * int( random(10, 20));  
      y[j] = int(pow(j, 2)) * int( random(20, 30));  

      int h = 200 + int(random(-10, 50)*sin(angle));      
      int k = 123 + int(random(-120, 20)*sin(angle));
      int l = 12 + int(random(0, 40)*exp(cos(angle)));
      int f = 1 + int(random(0, 4)*exp(sin(angle)));
      stroke(k, h, l, f);

      float q = constrain(y[j]/exp(sin(angle)), 0, width);
      float e = constrain(pow(x[i],exp(sin(angle))), 0, height);
      float r = constrain(pow(x[i],exp(sin(angle))), 0, width);
      float u = constrain(pow(exp(y[j]),sin(angle)), 0, height);

      beginShape();
      
      rotate(sin(PI*angle));
      rect(q, e, u, r); 
      ellipse(u, r, q, e);

      endShape();

    }

  }
}



