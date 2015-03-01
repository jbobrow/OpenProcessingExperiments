
int amount = 2000; // amount of stars
int[] x = new int [amount]; 
int[] y = new int [amount];
int[] z = new int [amount];
// variable for background change //
float backR = random(0, 255);
float backB = random(0, 255);
float backG = random(0, 255);



void setup() {
  size(800, 800, P3D);
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
  background(backR, backB, backG);
  translate(width/2, height/2); // move to center //
  rotateX(frameCount/80.0);
  rotateY(frameCount/100.0);
  stroke(255);
  noFill();
 // box(200, 50, 200);
  //sphere(10);
   for (int i = 0; i < amount; i ++) {
    point(x[i], y[i], z[i]);
  }
}




