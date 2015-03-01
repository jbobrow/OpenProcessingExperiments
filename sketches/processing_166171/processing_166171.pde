
void setup(){
  size(640, 640);
  noStroke();
}

void draw(){
  fill(0, 50);
  rect(0, 0, width, height);
  fill(255, 200, 100, 3);
  translate(width/2, height/2);
  rotate(radians(frameCount));
  for(int i = -180; i < 180; i+=2){
    float x = i+sin(radians(i-frameCount))*100;
    float y = sin(radians(i+frameCount))*100;
    float d = abs(map(x, -280, 280, -50, 50));
    ellipse(x, y, d, d);
    ellipse(-x, y, d, d);
    ellipse(-x, -y, d, d);
    ellipse(x, -y, d, d);
    
    ellipse(y, x, d, d);
    ellipse(-y, x, d, d);
    ellipse(-y, -x, d, d);
    ellipse(y, -x, d, d);
  } 
}


