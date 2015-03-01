
/* Blog design from Jerome Herr */

float num;
void setup(){
  size(640, 640);
}

void draw(){
  background(255);
  float maxX = (float)320/width*mouseX;
  float maxY = (float)320/height*mouseY;
  translate(width/2, height/2);
  for(int i = 0; i < 360; i+=6){
    float x = sin(radians(i-num)) * maxX;
    float y = maxY+cos(radians(i+num)) * x;
    float d = abs(map(dist(x, y, 0, 0), 0, 200, 20, 1));
    fill(0);
    ellipse(x, y, d, d);
    ellipse(-x, -y, d, d);
    ellipse(-y, -x, d, d);
    ellipse(y, x, d, d);
    
    noFill();
    ellipse(x, y, d+10, d+10);
    ellipse(-x, -y, d+10, d+10);
    ellipse(-y, -x, d+10, d+10);
    ellipse(y, x, d+10, d+10);
  }
  
  num+=0.5;
}


