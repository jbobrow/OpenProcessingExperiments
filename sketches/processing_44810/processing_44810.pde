
class Noisy { 
  PVector vec[];
  float noiseValueX = 0.02;
  float noiseValueY = 0.02;
  int n = 400;
  float speed =0.02;

  Noisy() {
    vec = new PVector[n];

    for (int i =0; i < n; i++) {
      vec[i]  = new PVector(random(width), random(height));
    }
  }

  void draw(int px, int py) {
    float posx = 0;
    float posy = 0;
    for (int i =0; i < n; i++) {
      posx = noise(noiseValueX,  speed);//*rand[i].x;
      posy = noise(noiseValueY,  speed);//*rand[i].y;
      vec[i].x += posx*tan(speed)*10;
      vec[i].y += posy*cos(speed)*10;
      noStroke();
      if(i > n/1.3)
        fill(140, 140, 40, 30);
      else
        fill(0, 100, 50, 50);
       
      ellipse(vec[i].x, vec[i].y, 7, 7);

      if(vec[i].x > width ||  vec[i].x < 0)
        vec[i].x  = width/2;
     if(vec[i].y > height ||  vec[i].y < 0)
        vec[i].y  = height/2; 
    
      update();
    }
  }

  void update() {
    noiseValueX += 0.01;
    noiseValueY += 0.02;

    speed +=0.02;
  }
}


