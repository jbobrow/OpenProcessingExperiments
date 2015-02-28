
/*
Simple Physics Simulation
 Alexius Castilleja
 Sept. 21 2010
 */

int rainCount = 150;
float[] x = new float[rainCount];
float[] y = new float[rainCount];
float[] floX = new float[rainCount];
float[] floY = new float[rainCount];
float[] gravity = new float[rainCount];
float[] damping = new float[rainCount];
float[] slip = new float[rainCount];
float[] radius = new float[rainCount];

void setup() {
  size (600, 600);
  background( 35, 20, 45);
  
    for (int i=0; i<rainCount; i++) { 
    floX[i] = random(-3.2, 3.2);
    gravity[i] = random(-.2, .2);
    damping[i] = random(.9);
    slip[i] = random(.9);
    radius[i] = random(0.5, 2.75);
    }
}
void draw() {
  frameRate(15);
  fill( 35, 20, 44);
  rect(-1, -1, width+1, height+1);
  move();
  collide();
   
}

    
void move() {
  for (int i=0; i<rainCount; i++) {
    x[i] += floX[i];
    floY[i] += gravity[i];
    y[i] += floY[i];

    pushMatrix();
    translate(x[i], y[i]);
    ellipse(0, 0, radius[i]*2, radius[i]*2);
    popMatrix();
  }
}

void collide() {
  for (int i=0; i<rainCount; i++) {
    if (x[i] > width-radius[i]) {
      x[i] = width-radius[i];
      floX[i] *= -1;
    } 
    else if (x[i] < radius[i]) {
      x[i] = radius[i];
      floX[i] *= -1;
    }

    if (y[i] > height-radius[i]) {
      y[i] = height-radius[i];
      floY[i] *= -1;
      floY[i] *= damping[i];
      floX[i] *= slip[i];
    } 
    else if (y[i] < radius[i]) {
      y[i] = radius[i];
      floY[i] *= -1;
    }
  }
  smooth();
  fill(0, 95);
  stroke(193, 193, 193);
  translate (20, 20);
  arc( 300, 180, 270, 120, TWO_PI/2, TWO_PI);
  fill(255); 
  rect(295, 180, 2, 200);
  
  
}
    




