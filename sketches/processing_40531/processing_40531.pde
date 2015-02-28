
// -*-c-*-

class Star {
  float x;
  float y;
  float vx;
  float vy;
  float ax;
  float ay;

  void init(float w, float h) {
    x = random(0, w);
    y = random(0, h);
    vx = random(-gs, gs);
    vy = random(-gs, gs);
  }

  void draw() {
    ellipse(x, y, s, s);
  }

  void update() {
    vy += g;
    x += vx;
    y += vy;

    if (y < 0) {
      y = 0;
      vy = -a * vy;
    }
    else if (y > height) {
      y = height;
      vy = -a * vy;
    }
    if (x < 0) {
      x = 0;
      vx = -a * vx;
    }
    else if (x > width) {
      x = width;
      vx = -a * vx;
    }
  }

  void s_update(){
    float d = 0.001;
    ax -= d * vx;
    ay -= d * vy;
    vx += ax;
    vy += ay;
    x += vx;
    y += vy;

    if(false){
      if(x < 0) { x = 0; vx = -0.9 * vx;}
      else if(x > width) { x = width; vx = -0.9 * vx;}
      if(y < 0) {y = 0; vy = -0.9 * vy;}
      else if(y > height) { y = height; vy = -0.9 * vy;}
    } else {
      float dx = x - width / 2;
      float dy = y - height / 2;
      float r = sqrt(dx*dx + dy*dy);
      
      if(r > 200) {
	float rv = 0.2;
	dx *= 200 / r;
	dy *= 200 / r;
	x = dx + width / 2;
	y = dy + height / 2;
	vx = random(-rv,rv);
	vy = random(-rv,rv);
      }
    }
  }

  void addRepulsion(Star s){
    float dx = x - s.x;
    float dy = y - s.y;
    float d = dist(x, y, s.x, s.y);
    float dd = d * d * d * d;
    float k = 100;
    if(abs(dd) < 20){
      ax = random(-1,1);
      ay = random(-1,1);
    } else {
      ax += k * dx / dd;
      ay += k * dy / dd;
    }
  }

  void spreading() {
    for(int i=0; i<n; i++){
      stars[i].ax = stars[i].ay = 0.0;
      for(int j=0; j<n; j++){
	if(i != j)
	  stars[i].addRepulsion(stars[j]);
      }
    }
    for(int i=0; i<n; i++)
      stars[i].s_update();
  }

  
};


