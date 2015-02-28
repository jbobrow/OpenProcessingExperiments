
int amount = 1000;
float[] radius = new float[amount];
float[] distance = new float[amount];
float[] rotVari = new float[amount];
float[] rotUpdate = new float[amount];
float[] rotSpeed = new float[amount];
float[] alpha = new float[amount];
float[] bounceSpeed = new float[amount];
float[] bounceHeight = new float[amount];
void setup() {
  size(720, 1280, P3D);
  frameRate(30);
  for(int i=0; i<amount; i++){
    distance[i] = random(100, 300);
    radius[i] = random(2, 10);
    rotSpeed[i] = -random(0.001, 0.005);
    alpha[i] = random(50,200);
    rotVari[i] = random(360);
    bounceSpeed[i] = random(2, 20);
    bounceHeight[i] = random(5, 50);
  } 
}
void draw() {
  background(107, 62, 36);
  translate(width/2, height/2);
  rotateX(-radians(rotUpdate[0]*100));
  for(int i=0; i<amount; i++){
    pushMatrix();
      rotUpdate[i]+=rotSpeed[i];
      rotateY(rotVari[i]+rotUpdate[i]);
        pushMatrix();
          translate(distance[i], 0);
          rotateY(-rotVari[i]-rotUpdate[i]);
          rotateX(radians(rotUpdate[0]*100));
          fill(255, 255, 255, alpha[i]);
          noStroke();
          ellipse(0, bounceHeight[i]*cos(rotUpdate[i]*bounceSpeed[i]), radius[i], radius[i]);
        popMatrix();
    popMatrix();
  }
}
