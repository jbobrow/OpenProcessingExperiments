
/* Rainbow Color thanks to Open Processing users. */
float t = PI;
float t2 = 3*PI/2;

float pathR = 125;
float pathG, pathB;

void setup(){
  size(640, 640);
  /* Takes away the white fill inside the circle. However without this gives nice effect */
  /* noFill */
}

void draw(){
  background(255);
  
  float maxX = (float) 180/width * mouseX;
  float maxY = (float) 180/height * mouseX;
  
  translate(width/2, height/2);
  stroke(pathR, pathG, pathB);
  for(int i = 0; i < 360; i+=2){
    float s = sin(radians(i+frameCount)) * 50;
    float x = sin(radians(i)) * (s+maxX);
    float y = cos(radians(i)) * (s+maxY);
    ellipse(x, y, s, s);
    ellipse(-x, -y, s, s);
    ellipse(-y, x, s, s);
    ellipse(y, -x, s, s);
  } 
  
  /* Code used by Open Processing users. */
  pathG = 125+125*sin(t);
  t += 0.03;
  
  pathB = 125+125*sin(t2);
  t2 += 0.03;
}


