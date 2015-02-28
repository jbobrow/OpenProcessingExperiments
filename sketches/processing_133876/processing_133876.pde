

size(800,400);
background(0,0,0);
noStroke();

int resolution = 1024;
float radius = 100; 
float circleX = width * 0.5;
float circleY = height * 0.5;

beginShape();
for(int i=0; i<resolution; i=i+1) {
  
  float waveAngle = map(i,0, resolution,0, TWO_PI*8);
  float waveOffset = sin(waveAngle) *60;                     // smaller waves
  
  float angle = map (i,0, resolution,0, TWO_PI);
  float circleOffX = cos(angle) * (radius + waveOffset);
  float circleOffY = sin(angle) * (radius + waveOffset);
  

  
  float x = circleX + circleOffX ;
  float y = circleY + circleOffY ;
  
  vertex (x,y);
}
endShape(CLOSE);

noStroke();
fill(0,0,0);
resolution = 8;


//rotate(radians(360/8/4));

for(int i=0; i<resolution; i=i+1) {
  
  float angle = map (i,0, resolution,0, TWO_PI);
  
  float circleOffX = cos(angle+radians(360/8/4)) * (radius+30);
  float circleOffY = sin(angle+radians(360/8/4)) * (radius+30);
  
  float x = circleX + circleOffX;
  float y = circleY + circleOffY;
  ellipse (x,y,10,10);
}
fill(0,0,0);
noStroke();
ellipse(width/2,height/2, 60,60);
