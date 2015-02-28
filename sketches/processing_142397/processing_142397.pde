
float angle;


 
void setup()
{
  size(600,600);
  background(pathR, pathG, pathB);
}

float R=125;
float centerR=125;
float a=PI/2;
float a1=PI;
float a2=3*PI/2;
float pathR=125;
float pathG=125;
float G=125;
float centerG=125;
float pathB=125;
float B=125;
float centerB=125;
 
void draw() {
 pathG=centerG+G*sin(a1);
  a1=a1+.03;

  pathB=centerB+B*sin(a2);
  a2=a2+.03;
  
  background(pathR, pathG, pathB);
  
  // rotation angle
  angle += 0.002;
 
  strokeWeight(23);
  stroke(pathR, pathG, pathB);
  fill(255);
  
  // move coordinate origin to center of sketch window
  translate(width/2,height/2);
  
  // number of scaled rectangles
  for (int i=0; i<100; i++){
    rotate(angle);
    scale(0.90);
    rectMode(CENTER);
    rect(0, 0, 800, 800);
  }
}
