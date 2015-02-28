
float offset = 0;

void setup() {
  size(512,512);
  noStroke();
  fill(255);
}

void draw() {
  background(0);
  offset+= .01;
  
  int resolution = 360;
  int radius = 100;
  int noiseHeight = 50;
  int circleX = width/2;
  int circleY = height/2;
  
  beginShape();
  for(int i=0; i<resolution; i++) {
    
    float angle = map(i,0,resolution,0,TWO_PI);
    float circleOffX = cos(angle+offset) * (radius+noise(i*.1,offset)*noiseHeight);
    float circleOffY = sin(angle+offset) * (radius+noise(i*.1,offset)*noiseHeight);
    
    float x = circleX + circleOffX;
    float y = circleY + circleOffY;
        
    vertex(x,y);
  }
  endShape();
}
