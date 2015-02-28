
int num = 200;
PVector[] pos = new PVector[num];
PVector[] vel = new PVector[num];
PVector[] acc = new PVector[num];
void setup(){
  size(700, 700);
  background(255);
  fill(255, 20);
  smooth();
  stroke(100, 255);
  for(int i = 0; i < num; i++) {
      pos[i] = new PVector(random(0, 700), random(0, 700));
      vel[i] = new PVector(0, 0);
      acc[i] = new PVector(0, 0);
  }
}
float R1 = random(0, 255);
float R2 = random(0, 255);
float G1 = random(0, 255);
float G2 = random(0, 255);
float B1 = random(0, 255);
float B2 = random(0, 255);
float noisy = .007;
void draw() {
  rect(-1, -1, 701, 701);
  for(int i = 0; i < num; i++) {
    stroke(R1, G1, B1);
      ellipse(pos[i].x, pos[i].y, 3, 3);
          stroke(R2, G2, B2, 100);
      ellipse(pos[i].x, pos[i].y, 5, 5);
      stroke(100, 255);
      vel[i].x = 10*noise(200+pos[i].x*.007, 200+pos[i].y*.007, noisy*2)*cos(4*PI*noise(pos[i].x*.003, pos[i].y*.003, noisy));
      vel[i].y = 10*noise(200+pos[i].x*.007, 200+pos[i].y*.007, noisy*2)*sin(4*PI*noise(pos[i].x*.003, pos[i].y*.003, noisy));
      for(int j = 0; j < num; j++) {
        if(j != i){
          acc[i].x += (pos[i].x-pos[j].x)/dist(pos[i].x, pos[i].y, pos[j].x, pos[j].y)/sq(5+dist(pos[i].x, pos[i].y, pos[j].x, pos[j].y));
          acc[i].y += (pos[i].y-pos[j].y)/dist(pos[i].x, pos[i].y, pos[j].x, pos[j].y)/sq(5+dist(pos[i].x, pos[i].y, pos[j].x, pos[j].y));
        }
       // vel[i].add(acc[i]);
      }
    pos[i].add(vel[i]);
    if(pos[i].x < 0 || pos[i].y < 0 || pos[i].x > 700 || pos[i].y > 700){
      pos[i].x = random(0, 700);
      pos[i].y = random(0, 700);
      vel[i].x = 0;
      vel[i].y = 0;
    }
    acc[i].x = 0;
    acc[i].y = 0;
  }
  noisy += .007;
}
void mousePressed(){
  R1 = random(0, 255);
  R2 = random(0, 255);
  G1 = random(0, 255);
  G2 = random(0, 255);
  B1 = random(0, 255);
  B2 = random(0, 255);
}

