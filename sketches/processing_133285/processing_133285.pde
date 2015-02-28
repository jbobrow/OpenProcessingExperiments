
float offset = 0;
color c1 = color(204,0,51);
color c2 = color(102,51,51);
int anz = 10;
float minSpeed = -1;
float maxSpeed = 1;

void setup() {
  size(512,512);
  noStroke();
}

void draw() {
  //blendMode(BLEND);
  //hint(ENABLE_DEPTH_TEST);
  background(255);
  //hint(DISABLE_DEPTH_TEST);
  
  offset+= .01;
  
  int resolution = 360;
  int radius = 150;
  int circleX = width/2;
  int circleY = height/2;
  
  for(int j=0; j<anz; j++) {
    
    beginShape();
    color c = lerpColor(c1,c2,float(j)/anz);
    float speed = lerp(minSpeed, maxSpeed, float(j)/anz);
    fill(c,50);

    for(int i=0; i<resolution; i++) {
      
      float waveAngle = map(i,0,resolution,0,TWO_PI*10);
      float waveOffset = sin(waveAngle)*10*j;
      
      float angle = map(i,0,resolution,0,TWO_PI);
      float circleOffX = cos(angle+offset*speed) * (radius+waveOffset-j*10);
      float circleOffY = sin(angle+offset*speed) * (radius+waveOffset-j*10);
      
      float x = circleX + circleOffX;
      float y = circleY + circleOffY;
          
      vertex(x,y);
    }
    endShape();
  }
}
