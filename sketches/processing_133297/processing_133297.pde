
size (600,400);
int resolution = 64;
float radius = 100;
float circleX = width*0.5;
float circleY = height*0.5;

beginShape();
for ( int i=0; i<resolution*2; i=i+1){
  float angle = map(i,0,resolution*2,0,TWO_PI);
  
  float waveAngle = map(i,0,resolution*2,0,TWO_PI*10);
  float waveOffset = sin(waveAngle)*15;
  
  float circleOffX = cos(angle)*((radius+40)+waveOffset);
  float circleOffY = sin(angle)*((radius+40)+waveOffset);
  
  float x = circleX + circleOffX;
  float y = circleY + circleOffY;
  
  for (int r=0; r<255; r=r+1){
    fill(r,255,255);
    ellipse(x,y,40,40);
  }
  
}
endShape(CLOSE);

beginShape();
for ( int i=0; i<resolution*2; i=i+1){
  float angle = map(i,0,resolution*2,0,TWO_PI);
  
  float waveAngle = map(i,0,resolution*2,0,TWO_PI*10);
  float waveOffset = sin(waveAngle)*15;
  
  float circleOffX = cos(angle)*((radius+40)+waveOffset);
  float circleOffY = sin(angle)*((radius+40)+waveOffset);
  
  float x = circleX + circleOffX;
  float y = circleY + circleOffY;
  
  vertex(x,y);
}
endShape(CLOSE);

beginShape();
for ( int i=0; i<resolution*2; i=i+1){
  float angle = map(i,0,resolution*2,0,TWO_PI);
  
  float waveAngle = map(i,0,resolution*2,0,TWO_PI*10);
  float waveOffset = sin(waveAngle)*15;
  
  float circleOffX = cos(angle)*(radius+waveOffset);
  float circleOffY = sin(angle)*(radius+waveOffset);
  
  float x = circleX + circleOffX;
  float y = circleY + circleOffY;
  
  vertex(x,y);
}
endShape(CLOSE);

