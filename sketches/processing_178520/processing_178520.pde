
float counter;

void setup() {  //setup function called initially, only once
  size(500,500, P3D);
  smooth(8);
  noFill();
}

void draw() {  //draw function loops 
  background(150);
  translate(width/2, height/2,0);
  rotateY(counter);
  counter+=0.01;
  rotateX(HALF_PI);
  drawSphere(100);
  }
  
  void drawSphere(float radius){
  float divs = TWO_PI/24;
  
  for (float v = 0; v < TWO_PI; v+=divs){
      for (float u = 0; u < TWO_PI; u+=divs){
          float x = radius * cos(u) * sin(v);
          float y = radius * sin(u) * sin(v);
          float z = radius * cos(v);
          pushMatrix();
              translate(x,y,z);
              sphere(1);
          popMatrix();
      }
  }
  
  }
