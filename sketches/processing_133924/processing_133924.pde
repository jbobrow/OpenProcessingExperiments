
float offset = 0;
color c1 = color(5,29,39);
color c2 = color(5,24,39);
int anz = 24;
float minSpeed = -1;
float maxSpeed = 1;
 
void setup() {
  size(600,512);
  noStroke();
}
 
void draw() {
  //blendMode(BLEND);
  //hint(ENABLE_DEPTH_TEST);
  background(255);
  //hint(DISABLE_DEPTH_TEST);
   
  offset+= .01;
   
  int resolution = 250;
  int radius = 165;
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

