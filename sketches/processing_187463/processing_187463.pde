
PVector taro, hanako;
float steptaro = 10;
float stephanako = 10*random(1);

void setup() {
  size(600, 600);  
  background(0);
  smooth();
  taro = new PVector(0, 0);
  hanako = new PVector(width, height);
}

void draw() {
  strokeWeight(0.3);
  stroke(0,100,100);
  line(taro.x, taro.y, hanako.x, hanako.y);
  next(taro, steptaro);
  next(hanako, stephanako);
  // ellipse(taro.x, taro.y, 10, 10);
  // ellipse(hanako.x, hanako.y, 10, 10);
}

void next(PVector vec, float step) {
  PVector vecp;
  if (vec.y ==0) {
    vecp = new PVector(step, 0);
    vec.add(vecp);
    if (vec.x > width) {
      vec.y = vec.x -width;
      vec.x = width;
    }
  }
  if (vec.y == height) {
    vecp = new PVector(step, 0);
    vec.sub(vecp);
    if (vec.x < 0) {
      vec.y = width- vec.x;
      vec.x = 0;
    }
  }
  if (vec.x ==0) {
    vecp = new PVector(0, step);
    vec.sub(vecp);
    if (vec.y < 0) {
      vec.x = vec.y*-1;
      vec.y = 0;
    }
  }  
  if (vec.x == width) {
    vecp = new PVector(0, step);
    vec.add(vecp);
    if (vec.y > height) {
      vec.x = width +height- vec.y;
      vec.y = height;
    }
  }
}


