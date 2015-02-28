
IrisEye Eye1  = new IrisEye(100, 200, 50, 10);
IrisEye Eye2  = new IrisEye(300, 200, 50, 10);

void setup() {
  size(400, 400);
}

void draw() {
  background(#FF0561);
  Eye1.display();
  Eye2.display();
}

class IrisEye {
  int xcenter, ycenter, radius, flaps;
  IrisEye(int xcenter, int ycenter, int radius, int flaps) {
    this.xcenter = xcenter;
    this.ycenter = ycenter;
    this.radius = radius;
    this.flaps = flaps;
  }

  void display() {
    ellipseMode(CENTER);
    fill(#00B9FF);
    ellipse(xcenter, ycenter, 2*radius, 2*radius);
    float div = 2*PI/flaps;
    for (int i=0; i<flaps; i++) {
      float x = xcenter + radius*sin(i*div); 
      float y = ycenter+ radius*cos(i*div);
      float xf = xcenter + radius*sin(i*div+PI/5); 
      float yf = ycenter+ radius*cos(i*div+PI/5);
      float r = radius;
      float angle = map(mouseX, 0, width, PI/4, PI/2);
      stroke(0);  
      strokeWeight(1);
      float xm = r*cos(-angle - i*div);
      float ym = r*sin(-angle - i*div);
      fill(#3A5886);
      beginShape();
      vertex(x, y);
      vertex(x+xm, y+ym);
      vertex(xf, yf);
      endShape(); 

      noFill();
      stroke(#FFB700);
      strokeWeight(10);
      ellipse(xcenter, ycenter, 2*radius, 2*radius);
    }
  }
}

