
float rSize; 
float factor, inc; 
int drawMode; 
int dispMode; 

void setup() {
  size(520, 520); 
  background(255);

  rSize = 130;
  factor = 0; 
  inc = 0.007;
  drawMode = 0;
  dispMode = 1; 
}

void draw() {  
  noStroke(); 
  fill(255, 20);
  rect(0, 0, width, height);  

  drawMode = (factor >= 1) ? 1 : 0; 
  int count, direction;
  count = 0;  
  for (float my = rSize/2; my < height; my += rSize) {
    direction = (count%2 == 0) ? 1 : -1; 
    if (dispMode == 0) {
      direction = 0;
    }
    for (float mx = rSize/2; mx < width; mx += rSize) {
      drawShape(mx, my, factor, direction);
      direction *= -1;
    }
    count++;
  }

  factor += inc; 
  if (factor >= 2 || factor <= 0) {    
    inc *= -1;
  }
}

void drawShape(float _mx, float _my, float _f, int _d) {
  PVector[] v;
  float factor, f;  

  v = new PVector[4]; 

  v[0] = new PVector(-rSize/2, -rSize/2); 
  v[1] = new PVector(rSize/2, -rSize/2);
  v[2] = new PVector(rSize/2, rSize/2);
  v[3] = new PVector(-rSize/2, rSize/2);

  noFill(); 
  stroke(#024F6C, 200); 

  pushMatrix();
  translate(_mx, _my);

  for (factor = 0; factor <= 1; factor += 0.25) {
    if (drawMode == 1) {
      f = constrain(factor+_f-1, 0, 1);
    } else {
      f = constrain(_f, 0, factor);
    }

    if (_d >= 0) {
      beginShape(); 
      vertex(v[0].x, v[0].y);
      vertex(lerp(0, v[1].x, f), lerp(0, v[1].y, f));
      vertex(v[2].x, v[2].y);
      vertex(lerp(0, v[3].x, f), lerp(0, v[3].y, f));
      endShape(CLOSE);
    } 
    if (_d <= 0) {
      beginShape(); 
      vertex(v[1].x, v[1].y);
      vertex(lerp(0, v[2].x, f), lerp(0, v[2].y, f));
      vertex(v[3].x, v[3].y);
      vertex(lerp(0, v[0].x, f), lerp(0, v[0].y, f));
      endShape(CLOSE);
    }
  }
  popMatrix();
}

void keyReleased() {
  if (key == 'M' || key == 'm') {
    dispMode = (dispMode == 0) ? 1 : 0;
  }
}



