
float clicks;

void setup(){
  size(640, 640);
  noStroke();
  fill(125, 0, 255, 125);
}

void draw(){
  background(255);
  translate(width/2, height/2);
  beginShape();
  for(int i = 0; i <= 360; i++){
    float angle = 100-cos(radians(i*clicks-frameCount)) * abs(cos(radians(i*clicks+frameCount)) * 100);
    float x = sin(radians(i)) * (angle);
    float y = cos(radians(i)) * (angle);
    vertex(x, y);
  }
  endShape();
  beginShape();
  for(int i = 0; i <= 360; i++){
    float angle = 100-cos(radians(i*clicks+frameCount)) * abs(cos(radians(i*clicks-frameCount)) * 100);
    float x = sin(radians(i)) * (angle);
    float y = cos(radians(i)) * (angle);
    vertex(-x, -y);
  }
  endShape();
}

void mousePressed(){
  clicks+=0.5; 
}


