
size(800,400);
background(147,232,242);
int resolution = 150;
float radius = 100;
float circleX = width * 0.5;
float circleY = height * 0.5;


//stem  
beginShape();
  fill(79,137,85);
  stroke(0,0,0);
  strokeWeight(5);
  noStroke();
  rect(400,200,8,200); 
  
//Flower Leaves
fill(79, 137, 85);
ellipse(365, 350, 90, 30);
ellipse(440, 350, 90, 30);
 
endShape(CLOSE);


beginShape();
fill (245,128,79);

for( int i=0; i < resolution; i=i+1) {
  
  float waveAngle = map( i,0, resolution,0, TWO_PI * 8);
  float waveOffset = sin(waveAngle) * 60;
  
  float angle = map( i,0, resolution,0,TWO_PI);
  float circleOffX = cos (angle)* (radius + waveOffset);
  float circleOffY = sin (angle)* (radius + waveOffset);
  
  float x = circleX + circleOffX;
  float y = circleY + circleOffY;
  
  vertex (x,y);
}
  
  endShape(CLOSE);
  


  radius = 35;
  
  beginShape();
  fill (200,128,79);
 

for( int i=0; i < resolution; i=i+1) {
  
  float waveAngle = map( i,0, resolution,0, TWO_PI * 1);
  float waveOffset = sin(waveAngle) * 2;
  
  float angle = map( i,0, resolution,0,TWO_PI);
  float circleOffX = cos (angle)* (radius + waveOffset);
  float circleOffY = sin (angle)* (radius + waveOffset);
  
  float x = circleX + circleOffX;
  float y = circleY + circleOffY;
  
  vertex (x,y);
  
}
  
  endShape(CLOSE);
  
  
  

  



