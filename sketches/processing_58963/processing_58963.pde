


int t;


void setup() {
  
  size(500, 500, P3D);
  ellipseMode(CENTER);
  frameRate(60);
 
}


void draw() {
     
  background(255);
  noFill();
  strokeWeight(2);
  smooth();

    for (int i = 0; i < 200; i++) {
      stroke(random(255), 255, 0, 95);
      ellipse(width/2+i*cos(t), height/2+i*sin(t), t, t);
      t++;
      if (t > 100) {
        t = 0;
      }
    }
    
  }


