
Quadrat q; 
float factor; 
float rSize; 

void setup() {
  size(480, 480); 
  background(0); 
  smooth();
  noStroke();

  rSize = 40; 
  q = new Quadrat(rSize, rSize);
}

void draw() {
  background(0); 
  fill(255);   

  float angle; 
  int counter = 0; 
  factor = map(cos(radians(frameCount)), -1, 1, 0.01, 0.99);
  
  if (factor < 0.5) {
    background(0);
    fill(255);
  } else {
    background(255);
    fill(0);
  }
  
  for (float y = rSize/2; y < height; y += rSize) {
    for (float x = rSize/2; x < width; x += rSize) {
      angle = (counter%2 == 0) ? 0 : PI/2; 
      q.drawQuadrat(x, y, factor, angle);
      counter++;
    }
    if((int(width/rSize))% 2 == 0){
      counter++;
    }
    //counter++;
  }
}

class Quadrat {
  PVector[] ecken; 

  Quadrat(float _w, float _h) {
    ecken = new PVector[4];

    ecken[0] = new PVector(-_w/2, -_h/2);
    ecken[1] = new PVector(_w/2, -_h/2);
    ecken[2] = new PVector(_w/2, _h/2);
    ecken[3] = new PVector(-_w/2, _h/2);
  }

  void drawQuadrat1(float _mx, float _my, float _factor, float _rotAngle) {
    PVector v; 

    pushMatrix();
    translate(_mx, _my);
    beginShape();  
    v = PVector.lerp(ecken[0], ecken[1], _factor); 
    vertex(v.x, v.y);     
    v = PVector.lerp(ecken[1], ecken[2], _factor); 
    vertex(v.x, v.y);          
    v = PVector.lerp(ecken[2], ecken[3], _factor); 
    vertex(v.x, v.y);      
    v = PVector.lerp(ecken[3], ecken[0], _factor); 
    vertex(v.x, v.y); 
    endShape(CLOSE);

    popMatrix();
  }

  void drawQuadrat(float _mx, float _my, float _factor, float _rotAngle) {
    PVector v; 

    pushMatrix();
    translate(_mx, _my); 
    rotate(_rotAngle); 
    beginShape();  
    v = PVector.lerp(ecken[0], ecken[2], _factor); 
    vertex(v.x, v.y);     
    vertex(ecken[1].x, ecken[1].y);      
    v = PVector.lerp(ecken[2], ecken[0], _factor); 
    vertex(v.x, v.y);      
    vertex(ecken[3].x, ecken[3].y);   
    endShape(CLOSE);

    popMatrix();
  }
} 



