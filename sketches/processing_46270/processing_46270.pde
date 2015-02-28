
class Node {
  float x;
  float y;

  float fx;
  float fy;

  float px;
  float py;

  float theta;
  float noiseValue;
  
  Node(float x, float y) {
    this.x = x;
    this.y = y;
    fx = x;
    fy = y;
    theta = random(-PI, PI);
    noiseValue=  random(-0.1, 0.1);
  }


  void update() {
    float tiempo = fx * cos(theta) - (y - x*x) * sin(theta);
    y = fx * sin(theta) + (fy - x*x) * cos(theta);
    x = tiempo;

    fx = x;
    fy = noise(noiseValue)/1.1;

    if ((x+ 0.5)*width > width || (y + 0.5)*height > height ) {
      x = random(1);
      y=  random(1);
      fx =x;
      fy =y;
    }
    noiseValue+=0.03;
  }

  void draw() {    
    update();
    stroke(60*(x+y) + 20,  50);
    point((x+ 0.5)*width, (y + 0.5)*height);
  }
}



