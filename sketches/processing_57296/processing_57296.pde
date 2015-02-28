
ArrayList tris;
boolean lr = true;
boolean back = false;


void setup() {
  size(500, 500);
  smooth();
  tris = new ArrayList();
}


void draw() {
  pushMatrix();
  
  background(back ? 255 : 0);
  translate(width/2, 2 * height/3);
  
  if(frameCount % 8 == 0) tris.add(new Tri(lr));
  
  float direction = 0;
  for(int i = 0; i < tris.size(); i++) {
    Tri temp = (Tri) tris.get(i);
    
    if(direction * temp.a < 0) translate(direction, 0);
    direction = temp.a;
    
    temp.plot(196 - tris.size() + i);
  }
  
  popMatrix();
}


class Tri {
  
  float beta;
  float a;
  float b;
  int c;
  float d;
  
  
  Tri(boolean leftright) {
    beta = map(mouseY, height, 0, -0.05, -QUARTER_PI); 
    a = 30 + map(mouseX, 0, width, 0, 30);
    b = a + random(30);
    d = random(b - 30);

    if(!leftright) {
      beta = - beta;
      a = -a;
      b = -b;
      d = -d;
    }
    c = int(map(abs(a + b), 20, 100, 200, 100));
  }
  
  
  void plot(int i) {
    if(i > 0) {
      float aN = abs(a/4) - abs(a/2) * noise( frameCount * .0005, i * .05, 0);
      float bN = abs(b/4) - abs(b/2) * noise( frameCount * .0005, i * .05, 1);
      c = int(map(abs(a + aN + b + bN), 20, 100, 200, 100)); 
    
      if(d > 0) fill(c, c + degrees(abs(beta)), c, i);
      if(d < 0) fill(c + degrees(abs(beta)), c, c, i);
      stroke(back ? 196 - i : 0);
      beginShape();
      vertex(0, 0);
      vertex((a + aN), 0);
      vertex((b + bN) * cos(beta), 
             (b + bN) * sin(beta));
      vertex(0, 0);
      endShape(); 
    }
    rotate(beta);
    translate(d, 0); 
  }
}


void mousePressed() {
  lr = !lr;
}


void keyPressed() {
  switch(key) {
    case ' ':
      back = !back;
      break;
    case 'r':
      tris.clear();
      break;
  }
}

