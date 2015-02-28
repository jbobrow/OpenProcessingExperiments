

                
                int num = 4000;
PVector[] pos = new PVector[num];
PVector[] vel = new PVector[num];
PVector[] acc = new PVector[num];
void setup() {
  size(800, 450, P2D);
  background(0);
  fill(0, 50);
  smooth();
  stroke(255,0,0,80);
  for(int i = 0; i < num; i++) {
    pos[i] = new PVector(200, random(0, 700));
    vel[i] = new PVector(1000,20);
    acc[i] = new PVector(400, 40);
  }
  noiseDetail(100);
}
float G1 = random(70, 70);
float G2 = random(25, 25);
float B1 = random(100, 100);
float B2 = random(200, 200);
float R1 = random(1, 1);
float R2 = random(0, 0);
float noisy = .7;
void draw() {
  for(int i = 0; i < num; i++) {
    stroke(R1, G1, B1, 10);
    point(pos[i].x, pos[i].y);
    vel[i].x = 100*noise(10+pos[i].x*.8, 20+pos[i].y*.007, noisy*10)*tan(4*PI*noise(pos[i].x*.007, pos[i].y*.007, noisy*.5));
    vel[i].y = 100*noise(10+pos[i].x*.25, 20+pos[i].y*.007, noisy*90)*radians(4*PI*noise(pos[i].x*.007, pos[i].y*.007, noisy*.5));
    pos[i].add(vel[i]);
    if(pos[i].x < 0 || pos[i].y < 0 || pos[i].x > 700 || pos[i].y > 700) {
      pos[i].x = random(0, 4);
      pos[i].y = random(0, 700);
      vel[i].x = 0;  
      vel[i].y = 0;
    }
    acc[i].x = 0;
    acc[i].y = 0;
  }
  noisy += .007;
}
void mousePressed() {
  R1 = random(0, 255);
  R2 = random(0, 255);
  G1 = random(0, 255);
  G2 = random(0, 255);
  B1 = random(0, 255);
  B2 = random(0, 255);
}
                
