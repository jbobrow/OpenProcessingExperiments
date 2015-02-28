
int eye1x;
int eye1y;
float angle1;

int eye2x;
int eye2y;
float angle2;

float angle1plus;
float angle2plus;

int redEye = 0;

void setup() {
  size(350, 250);
  noStroke();
  eye1x = 120;
  eye1y = 120;
  angle1 = 0.0;
  
  eye2x = 225;
  eye2y = 120;
  angle2 = 0.0;
  smooth();
}

void draw() {
  background(260,180,100);
  ellipseMode(CENTER);
  fill(255,255-redEye,255-redEye);
  ellipse(eye1x,eye1y,100,100);
  ellipse(eye2x,eye2y,100,100);
  
  angle1 = atan2(mouseY-eye1y, mouseX-eye1x)+angle1plus;
  float newEye1x = eye1x + (cos(angle1)*25);
  float newEye1y = eye1y + (sin(angle1)*25);
  fill(0,100,100);
  ellipse(newEye1x,newEye1y,50,50);
  
  float newEye1xSmall = newEye1x + (cos(angle1)*10);
  float newEye1ySmall = newEye1y + (sin(angle1)*10);
  fill(0);
  ellipse(newEye1xSmall,newEye1ySmall,10,10);
  
  angle2 = atan2(mouseY-eye2y, mouseX-eye2x)+angle2plus;
  float newEye2x = eye2x + (cos(angle2)*25);
  float newEye2y = eye2y + (sin(angle2)*25);
  fill(0,100,100);
  ellipse(newEye2x,newEye2y,50,50);
  
  float newEye2xSmall = newEye2x + (cos(angle2)*10);
  float newEye2ySmall = newEye2y + (sin(angle2)*10);
  fill(0);
  ellipse(newEye2xSmall,newEye2ySmall,10,10);
  
  if (mousePressed == true) {
    if (mouseButton == RIGHT) {
      angle1plus += 0.2;
      angle2plus -= 0.2;
      redEye = constrain(redEye - 1,0,255);
    } else if (mouseButton == LEFT) {
      angle1plus -= 0.2;
      angle2plus += 0.2;
      redEye = constrain(redEye + 1,0,255);
    }
  }
}



