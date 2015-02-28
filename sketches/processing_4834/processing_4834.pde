
/*  Jeff Hendrickson Sept 30 09******************
    
     ****noiseDrawingEllipseV3_mirror****
     
     Not really sure why this works but it's a happy accident.  The attempt
     was to get two ellipses drawing at the same time, from the same center
     point.  With Perlin Noise attached to each one I thought they would just
     go off in different directions.  What happens here - the two painting 
     ellipses perfectly mirror each other.  Play around with ellipse size
     and transparencies to see what happens.
     */

void setup()  {
  size(600,700);
  background(0,0,0,0);
  noStroke();
  noFill();
  colorMode(RGB);
  //strokeWeight(1);
  
  ellipseMode(CENTER);
  smooth();
}

float ypos = height/2;
float xpos = width/2;
float ypos2 = height/3;
float xpos2 = width/3;
int timeLimit = 10;

void draw()  {
  ypos = ypos + 0.004;
  xpos = xpos + 0.005;
  ypos2 = ypos2 + 0.004;
  xpos2 = xpos2 + 0.005;
  float r = 20;
  float n = noise(ypos) * height;  //using height makes a smoother line
  float m = noise(xpos) * width;
  float a = noise(ypos2) * height;
  float b = noise(xpos2) * width;
  fill(random(60,180), random(14,27), random(10,30), 20);
  stroke(0, random(40,100), random(100,200), random(20,75));
  //fill(255,0,0,120);
  //stroke(0,0,0);
  ellipse(m,n,r,r);
  ellipse(a,b,r,r);
  
  if (millis() >= timeLimit*10000) {
        noLoop();
      } 
}
void mousePressed() {
  save("ellipseDrawingMirror-200.png");
}

