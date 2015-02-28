
int amount = 1000;
int[] x = new int [amount];
int[] y = new int [amount];
int[] z = new int [amount];

void setup() {
  size(500, 500, P3D);
  background(0);
  //noFill();
  stroke(255);
  strokeWeight(2);
  //frameRate(30);
  for (int i = 0; i < amount; i ++) {
    x[i] = int(random(-250, 250));
    y[i] = int(random(-250, 250));
    z[i] = int(random(-250, 250));
  }
}

void draw() {
  background(0);
  
  translate(width/2, height/2);
  rotateX(frameCount/80.0);
  rotateY(frameCount/100.0);
  //box(300);
   for (int i = 0; i < amount; i ++) {


    point(x[i], y[i], z[i]);
  }
}
