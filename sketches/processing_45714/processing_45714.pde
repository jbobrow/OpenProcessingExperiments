
class ParticleN {
  float noiseV;
  float tam;
  PVector nVector[];

  int n = 1500;
  float speed;

  float timeSpeed =0.03;

  ParticleN() {
    noiseV = 0.02;
    tam = 1;
    nVector = new PVector[n];

    for (int i =0; i < n; i++) {
      nVector[i] = new PVector(random(width), random(height));
    }
  } 


  void draw() {
    float t = frameCount * timeSpeed;
    for (int i =0; i < n; i++) {
      float normx = norm(nVector[i].x, 0, width);
      float normy = norm(nVector[i].y, 0, height);
      float noiseX = noise(noiseV, nVector[i].x*0.02, nVector[i].y*0.04) - 0.5;
      float noiseY = noise(noiseV + 1, nVector[i].x*0.03, nVector[i].y*0.03) -0.4;

      nVector[i].x += noiseX;
      nVector[i].y += noiseY;

      float ang = atan2(nVector[i].y, nVector[i].x);
      float mg = mag(nVector[i].x, nVector[i].y)*2.0;

      stroke(ang*50, mg);
      beginShape();
      vertex(nVector[i].x, nVector[i].y);
      endShape();
      
      stroke(i/10 + ang*25, 20 + ang +10);
      beginShape();
      vertex(nVector[i].x, nVector[i].y);
      endShape();
      
      
       stroke(i/10 + ang*25, i/10 + ang*25, i/20 + ang*15,  mg/50 + 25);
      beginShape();
      vertex(nVector[i].x, nVector[i].y);
      endShape();
      
      refresh(nVector[i]);
    }
    update();
  }

  void update() {
    noiseV += 0.02;
    speed +=  0.03;
  }

  void refresh(PVector p) {
    if (p.x < 0 || p.x > width || p.y <0 || p.y > height) {
      p.x = random(width);
      p.y = random(height);
    }
  }
}


