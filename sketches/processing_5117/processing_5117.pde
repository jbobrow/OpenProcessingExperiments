
//Noise  5 OCT 2009

int num = 16000;
PVector[] pos = new PVector[num];
PVector[] vel = new PVector[num];
PVector[] acc = new PVector[num];


void setup(){
  size(1167, 720);
  background(0);
  smooth();
  stroke(1, 255);
  for(int i = 0; i < num; i++) {
    pos[i] = new PVector(random(0), random(0), random(0));
    vel[i] = new PVector(0, 0);
    acc[i] = new PVector(0, 0);
  }
  noiseDetail(1);
}
float R1 = random(0, 255);
float R2 = random(0, 255);
float G1 = random(0, 255);
float G2 = random(0, 255);
float B1 = random(0, 255);
float B2 = random(0, 255);
float noisy = .007;

void draw() {

  //  rect(255, 0, width, height);  
  for(int i = 0; i < num; i++) {
    stroke(R1, G1, B1, 10);
    point(pos[i].x, pos[i].y);
    vel[i].x = 10*noise(200+pos[i].x*.007, 200+pos[i].y*.007, noisy*2)*cos(4*PI*noise(pos[i].x*.007, pos[i].y*.007, noisy*.5));
    vel[i].y = 10*noise(200+pos[i].x*.007, 200+pos[i].y*.007, noisy*2)*sin(4*PI*noise(pos[i].x*.007, pos[i].y*.007, noisy*.5));
    pos[i].add(vel[i]);
    if(pos[i].x < 0 || pos[i].y < 0 || pos[i].x > width || pos[i].y > height){
      pos[i].x = random(width);
      pos[i].y = random(height);
      vel[i].x = width/2;
      vel[i].y = height/2;
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



