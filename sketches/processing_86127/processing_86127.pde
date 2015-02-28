
float firstSegmentLength;
int numLevels = 200;

void setup() {
  size(1280,1024);
  firstSegmentLength = height/4;
}

void draw() {
  background(0);
  
  color c = color(255,255,0);

  fill(c); 
  stroke(c);

  float length = sqrt(sq(mouseX - width/2) + sq(mouseY - height/2));
  float angle = atan2(mouseY - height/2, mouseX - width/2);  

  float changeInLength = length / firstSegmentLength;

  line(width/2, height/2, width/2, height/2 + firstSegmentLength);
  line(width/2,height/2, mouseX, mouseY);
  
  noFill();
  ellipse(width/2, height/2, firstSegmentLength*2, firstSegmentLength*2);

  stroke(255);
  drawSegments(mouseX, mouseY, angle, length, angle + PI/2, 
                    changeInLength, numLevels);
}

void drawSegments(float x, float y, float angle, float length, 
            float changeInAngle, float changeInLength, int level) {
  angle = angle + changeInAngle;
  length = length * changeInLength;

  float nx = x + cos(angle)*length;
  float ny = y + sin(angle)*length;

  line(x,y,nx,ny);
  ellipse(x,y,4,4);

  if (level > 0) drawSegments(nx,ny,angle,length,
        changeInAngle,changeInLength, level - 1);  
} 



