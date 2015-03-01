
float num;

void setup() {
  size(640, 640);
  fill(255, 150, 0, 20);
  noStroke();
}

void draw() {
  background(0);
  translate(width/2, height/2);
  for (int i = -180; i < 180; i+=12) {
    float x = sin(radians(i)) * 15;
    float y = cos(radians(i)) * 15;
      
    //float x = i;
    //float y = 0;
    pushMatrix();
    translate(x, y);
    rotate(radians(-i));
    for(int q = 0; q < 200; q+=5){
      float d = map(q, 0, 200, 40, 0);
      float a = sin(-i+q+num) * 2;
      ellipse(a, q, d, d); 
    }
    popMatrix();
  }
  
  num += 0.2;
}



