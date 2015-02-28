
size (1200, 700);
background(#FDFFFC);
smooth();
int resolution = 200; 
float radius = 150 ;
float circleX = width * 0.5;
float circleY = height * 0.5;
fill(#B5B7B5);
beginShape();
fill(#5D5D5D);
for ( int i =0; i<resolution; i=i+1) {
  
  float waveAngle = map(i,0, resolution, 0, TWO_PI*25);
  float waveOffset = sin(waveAngle)*200;
 
  float angle = map (i, 0, resolution, 0, TWO_PI);
  float circleoffX = cos(angle)* (radius + waveOffset);
  float circleoffY = sin(angle)* (radius + waveOffset);
  
  float x = circleX + circleoffX ;
  float y = circleY + circleoffY ;

  ellipse(x,y, 20,20) ;
  
}
endShape(CLOSE);

fill(#DEDEDE);
resolution = 600; 
radius = 210 ;
circleX = width * 0.5;
circleY = height * 0.5;
beginShape();
for ( int i =0; i<resolution; i=i+1) {
  
 float waveAngle = map(i,0, resolution, 0, TWO_PI*25);
 float waveOffset = sin(waveAngle)*radius;
 
  float angle = map (i, 0, resolution, 0, TWO_PI);
  float circleoffX = cos(angle)* (radius + waveOffset);
  float circleoffY = sin(angle)* (radius + waveOffset);
  
   float x = circleX + circleoffX ;
   float y = circleY + circleoffY ;
  
  vertex(x,y) ;
  
}
endShape(CLOSE);


