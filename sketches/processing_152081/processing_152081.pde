
int num; //number of circles
float[] cir; //circle elements
float[] x; //circle position
float[] y;
float[] dx; //change in position
float[] dy;
float[] prox;

void setup() {

  size(500, 500);
  
  num = (int)random(5, 20);
  cir = new float[num];
  x = new float[num];
  y = new float[num];
  dx = new float[num];
  dy = new float[num];
  prox = new float[num];
  
  for (int i=0; i<num; i++){
    x[i] = random(width);   // initial position in the centre of the screen
    y[i] = random(height);
    dx[i] = random(-1, 1);  // dx and dy are the small change in position each frame
    dy[i] = random(-1, 1);
    prox[i] = random(80, 120);
  }
  

}


void draw() {

  strokeWeight(random(1,4));
  
  for (int i=0; i<num; i++){    
    x[i] += dx[i];  // calculate new position
    y[i] += dy[i];
  
    //When the shape hits the edge of the window, it reverses its direction and changes velocity
    if (x[i] > width || x[i] < 0) {
      dx[i] = dx[i] > 0 ? -random(1) : random(1);
    }
  
    if (y[i] > height || y[i] < 0) {
      dy[i] = dy[i] > 0 ? -random(1) : random(1);
    }


    
    for (int j=0; j<num; j++) {
      for (int k=0; k<j; k++) {
        float dist = dist(x[j], y[j], x[k], y[k]);
        if (dist < prox[j]) {
          if (j%2 == 0 || k%2==0) {
              stroke(0, 40, 150, random(10,50));
            } 
            else {
              stroke(10, 130, 200, random(5,20));
            }
            line(x[j], y[j], x[k], y[k]);
          }
    }
  }
      noFill();
      stroke(random(10, 50), random(2,20));
      ellipse(x[i], y[i], prox[i], prox[i]); 
  }
  
}

